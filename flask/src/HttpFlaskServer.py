from sys import argv
from flask import Flask, make_response, request, Response, jsonify, send_from_directory
from werkzeug.serving import WSGIRequestHandler
import random
import string
import hashlib
import os
from time import sleep
import re
import json
import argparse
import sys

app = Flask(__name__, static_url_path='/static')

modification_dict = dict()

####################################################################################


def modify_cache_control_header(response):

    resp_content_type = response.headers['Content-Type']
    for header_name in modification_dict.keys():

        json_obj = modification_dict[header_name]
        for content_type in json_obj.keys():
            if content_type in resp_content_type:
                if json_obj[content_type].lower() == 'disable':
                    del response.headers[header_name]
                elif json_obj[content_type].lower() != 'enable':
                    response.headers[header_name] = json_obj[content_type]


@app.after_request
def after_request(response):

    if len(modification_dict) > 0:
        # Modify Cache control headers
        modify_cache_control_header(response)

    return response

####################################################################################


def get_chunk_encoded_str(file_name=None, chunk_size_list=None, orig_str=None):
    """
    Takes a file or a string as input and converts it into chunk encoded format
    """
    if file_name is not None:
        try:
            f = open(file_name, 'r')
            orig_str = f.read()
            f.close()
        except IOError:
            return 'Could not open file.', True

    elif orig_str is None:
        return 'Either provide a string size or a file name', True

    if len(orig_str) <= 10:
        return 'String too short. Enter a larger string', True

    if chunk_size_list:
        # Check if sum of all chunk sizes is equal to length of string
        chunk_size_list = map(int, chunk_size_list)
        if sum(chunk_size_list) != len(orig_str):
            return 'Sum of chunk sizes should be equal to string length', True
        if 0 in chunk_size_list:
            return 'Chunk size cant be zero.', True
    else:
        num_chunks_default = 10
        chunk_size_list = [len(orig_str) / num_chunks_default] * (num_chunks_default - 1)
        chunk_size_list.append(len(orig_str) - ((len(orig_str) / num_chunks_default) * (num_chunks_default - 1)))

    # Create chunk encoded string
    chunk_enc_str = ''
    curr_index = 0
    for chunk_size in chunk_size_list:
        # read chunk_size chars from curr_index
        chunk_enc_str += '{0}\r\n{1}\r\n'.format(hex(chunk_size)[2:].upper(),
                                                 orig_str[curr_index: curr_index + chunk_size])
        curr_index += chunk_size

    chunk_enc_str += '0\r\n\r\n'
    return chunk_enc_str, False

#########################################


def generate_string(size):
    """
    Returns a string of specified size, which is generated randomly
    """
    return ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(size))

#########################################


def get_checksum(str):
    """
    Returns md5 checksum of string input
    """
    m = hashlib.md5()
    m.update(str)
    return m.hexdigest()

#########################################


def get_http_version(http_ver):
    """
    Takes value of query string parameter named http
    Returns version to be used for response
    """
    if http_ver is None:
        http_ver = '1.1'
    elif http_ver in ['10', '11']:
        http_ver = http_ver[:1] + '.' + http_ver[1:]

    return http_ver

####################################################################################


@app.before_request
def before_request():

    """
    Prints request header and body before route functions are called
    """

    print request.headers
    print request.data


@app.route('/conn', methods=['GET', 'POST'])
def conn():

    """
    Sends default HTTP Response based on version
    URL - http://10.102.34.232:5001/conn?http=11
          http://10.102.34.232:5001/conn?http=1.1
          http://10.102.34.232:5001/conn         (Uses HTTP 1.0)
    """

    http_ver = request.args.get('http')
    http_ver = get_http_version(http_ver)

    body = 'This is the body of Response'
    if http_ver in ['1.0', '1.1']:
        WSGIRequestHandler.protocol_version = 'HTTP/{0}'.format(http_ver)
    else:
        body = 'Please specify a valid HTTP Version'

    resp = make_response(body)
    resp.headers['Content-type'] = 'text/html'
    return resp


@app.route('/reset', methods=['GET', 'POST'])
def reset():
    sys.exit(1);

def conn_close():

    """
    Sends connection close header in response.
    URL - http://10.102.34.232:5001/conn_close?http=11
          http://10.102.34.232:5001/conn_close?http=1.1
          http://10.102.34.232:5001/conn_close         (Uses HTTP 1.0)
    """

    resp = conn()
    resp.headers['Connection'] = 'close'
    return resp


@app.route('/conn_keep_alive', methods=['GET'])
def conn_keep_alive():

    """
    Sends connection keep alive header in response.
    URL - http://10.102.34.232:5001/conn_keep_alive?http=11
          http://10.102.34.232:5001/conn_keep_alive?http=1.1
          http://10.102.34.232:5001/conn_keep_alive         (Uses HTTP 1.0)
    """

    resp = conn()
    resp.headers['Connection'] = 'keep-alive'
    return resp


@app.route('/chunked', methods=['GET', 'POST'])
def chunked():

    """
    Sends chunked Response
    URL - http://10.102.34.232:5001/chunked?size=128
          http://10.102.34.232:5001/chunked?size=128&chunks=64,54,10
          http://10.102.34.232:5001/chunked?file=DefaultFile&chunks=75,50
          http://10.102.34.232:5001/chunked?file=DefaultFile
    Default: http - 1.0
             number of chunks = 10
    """

    WSGIRequestHandler.protocol_version = 'HTTP/1.1'

    str_size = request.args.get('size')
    chunk_str = request.args.get('chunks')
    file_name = request.args.get('file')

    chunks = None
    if chunk_str is not None:
        chunks = chunk_str.split(',')

    if str_size is not None:
        random_string = generate_string(int(str_size))
        resp_string, is_err_msg = get_chunk_encoded_str(orig_str=random_string, chunk_size_list=chunks)
    else:
        resp_string, is_err_msg = get_chunk_encoded_str(file_name=file_name, chunk_size_list=chunks)

    resp = make_response(resp_string)
    resp.headers['Content-type'] = 'text/html'
    if not is_err_msg:
        resp.headers['Transfer-Encoding'] = 'chunked'
    return resp


@app.route('/chunked_keep_alive', methods=['GET'])
def chunked_keep_alive():

    """
    Sends chunked Response. Also adds connection keep alive header
    URL - http://10.102.34.232:5001/chunked_keep_alive?size=128
          http://10.102.34.232:5001/chunked_keep_alive?size=128&chunks=64,54,10
          http://10.102.34.232:5001/chunked_keep_alive?file=DefaultFile&chunks=75,50
          http://10.102.34.232:5001/chunked_keep_alive?file=DefaultFile
          Default: http - 1.0
                   number of chunks = 10
    """

    resp = chunked()
    resp.headers['Connection'] = 'keep-alive'
    return resp


@app.route('/chunked_close', methods=['GET'])
def chunked_close():

    """
    Sends chunked Response. Also adds connection close header
    URL - http://10.102.34.232:5001/chunked_close?size=128
          http://10.102.34.232:5001/chunked_close?size=128&chunks=64,54,10
          http://10.102.34.232:5001/chunked_close?file=DefaultFile&chunks=75,50
          http://10.102.34.232:5001/chunked_close?file=DefaultFile
          Default: http - 1.0
                   number of chunks = 10
    """

    resp = chunked()
    resp.headers['Connection'] = 'close'
    return resp


@app.route('/chunked_checksum', methods=['GET'])
def chunked_checksum():

    """
    Sends chunked Response. Also adds checksum value of string in header.
    URL - http://10.102.34.232:5001/chunked_checksum?size=128
          http://10.102.34.232:5001/chunked_checksum?size=128&chunks=64,54,10
          http://10.102.34.232:5001/chunked_checksum?file=DefaultFile&chunks=75,50
          http://10.102.34.232:5001/chunked_checksum?file=DefaultFile
          Default: http - 1.0
                   number of chunks = 10
    """
    WSGIRequestHandler.protocol_version = 'HTTP/1.1'

    str_size = request.args.get('size')
    chunk_str = request.args.get('chunks')
    file_name = request.args.get('file')

    chunks = None
    if chunk_str is not None:
        chunks = chunk_str.split(',')

    if str_size is not None:
        random_string = generate_string(int(str_size))
        checksum = get_checksum(random_string)
        resp_string, is_err_msg = get_chunk_encoded_str(orig_str=random_string, chunk_size_list=chunks)
    else:
        resp_string, is_err_msg = get_chunk_encoded_str(file_name=file_name, chunk_size_list=chunks)
        checksum = get_checksum(open(file_name).read())

    resp = make_response(resp_string)
    resp.headers['Content-type'] = 'text/html'
    resp.headers['Checksum'] = checksum

    if not is_err_msg:
        resp.headers['Transfer-Encoding'] = 'chunked'

    return resp


@app.route('/echo', methods=['GET'])
def echo():
    """
    Echoes the request.
    """
    return make_response('Not yet implemented')


@app.route('/add_header', methods=['GET'])
def add_header():
    """
    Adds header received in query string to the response.
    """
    return make_response('Not yet implemented')


@app.route('/delayed_server', methods=['GET'])
def delayed_server():
    """
    Takes delay time in ms and send packets or burst of packets interleaved with this delay.
    Usage: http://10.102.34.232:5001/delayed_server?delay=11&http=1.1&file=DefaultFile
           http://10.102.34.232:5001/delayed_server?delay=10 (Uses HTTP 1.0)
           http://10.102.34.232:5001/delayed_server (Uses delay of 5ms)
           Default: http - 1.0
                    delay - 5ms
    """
    http_ver = request.args.get('http')
    http_ver = get_http_version(http_ver)

    delay = request.args.get('delay')
    if delay is None or not delay.isdigit():
        delay = 5
    else:
        delay = int(delay)

    file_name = request.args.get('file')
    if file_name is None:
        file_name = '/src/DefaultFile'

    if http_ver in ['1.0', '1.1']:
        WSGIRequestHandler.protocol_version = 'HTTP/{0}'.format(http_ver)

    num_bursts = 5

    file_obj = open(file_name, 'r')
    file_content = file_obj.read()
    file_obj.close()
    num_bytes = len(file_content)

    sleep(delay * 0.001)
    def generate():
        curr_index = 0
        num_bytes_per_burst = num_bytes / num_bursts
        for i in range(0, num_bursts):

            if i == num_bursts - 1:
                # send all remaining bytes
                yield file_content[curr_index:]
            else:
                yield file_content[curr_index:curr_index + num_bytes_per_burst]
            curr_index += num_bytes_per_burst
            sleep(delay * 0.001)
    return Response(generate())


@app.route('/response_code', methods=['GET'])
def response_code():
    """
    Send response with status code provided in query string param.
    Not Fully implemented
    """
    http_ver = request.args.get('http')
    http_ver = get_http_version(http_ver)
    code = request.args.get('code')

    if http_ver in ['1.0', '1.1']:
        WSGIRequestHandler.protocol_version = 'HTTP/{0}'.format(http_ver)

    if code is None or not code.isdigit():
        return make_response('Please provide valid code parameter')
    else:
        return make_response('The status code of this response is {0}'.format(code)), int(code)


@app.route('/incorrect_content_length', methods=['GET'])
def incorrect_content_length():
    """
    Send a response where content-Length header is present but following data is more than the mentioned length.
    Usage: http://10.102.34.232:5001/incorrect_content_length
           http://10.102.34.232:5001/incorrect_content_length?http=1.0
    """
    http_ver = request.args.get('http')
    http_ver = get_http_version(http_ver)
    if http_ver in ['1.0', '1.1']:
        WSGIRequestHandler.protocol_version = 'HTTP/{0}'.format(http_ver)

    content_length = 5
    resp = make_response('The content length of the response is {0}, which is incorrect.'.format(content_length))
    resp.headers['Content-Length'] = content_length
    return resp


@app.route('/invalid_content_length', methods=['GET'])
def invalid_content_length():
    """
    Content-Length header is present but it has some invalid value
    Usage: http://10.102.34.232:5001/invalid_content_length
           http://10.102.34.232:5001/invalid_content_length?http=1.0
    """
    http_ver = request.args.get('http')
    http_ver = get_http_version(http_ver)
    if http_ver in ['1.0', '1.1']:
        WSGIRequestHandler.protocol_version = 'HTTP/{0}'.format(http_ver)

    content_length = -1
    resp = make_response('The content length of the response is {0}, which is invalid.'.format(content_length))
    resp.headers['Content-Length'] = content_length
    resp.headers['Connection'] = 'close'
    return resp


@app.route('/invalid_chunk_encoding', methods=['GET'])
def invalid_chunk_encoding():
    """
    Transfer-Encoding: chunked is sent in response , but response is not encoded
    Usage: http://10.102.34.232:5001/invalid_chunk_encoding
    """
    WSGIRequestHandler.protocol_version = 'HTTP/1.1'
    resp_string = generate_string(128)
    resp = make_response(resp_string)
    resp.headers['Transfer-Encoding'] = 'chunked'
    return resp


@app.route('/<path:path>')
def feo(path):
    """
    Returns HTML file and modifies some mentioned headers in response.
    Usage: http://10.102.34.232:5001/feointerop/alltest.html?arg1=Cache-Control{"image":"private","javascript":"public",
    "css":"disable"}&arg2=ETag{"image":"enable","css":"disable"}

    Note - /clear needs to be called before/after each usage
    """
    WSGIRequestHandler.protocol_version = 'HTTP/1.1'

    pattern = re.compile(r'(.+)(\{.+\})')

    global modification_dict
    i = 1
    while True:
        arg = request.args.get('arg{0}'.format(i))
        if arg is None:
            break

        match_groups = pattern.search(arg)
        if match_groups is None:
            return make_response('Incorrect Argument Format')

        try:
            json_obj = json.loads(match_groups.group(2))
        except ValueError:
            return make_response('Incorrect Argument Format')

        header_name = match_groups.group(1)
        modification_dict[header_name] = json_obj
        i += 1

    return send_from_directory('/var/www/html/', path)


@app.route('/clear')
def clear():
    """
    Clears all variables
    """
    global modification_dict
    modification_dict = dict()
    return make_response('Cleared')


@app.route('/doc', methods=['GET'])
def doc():
    """
    View documentation.
    """
    f = open(os.path.dirname(os.path.realpath(__file__)) + '/' + __file__.replace('.py', '.html'), 'r')
    content = f.read()
    f.close()
    return make_response(content)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)


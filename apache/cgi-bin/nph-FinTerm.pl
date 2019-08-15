#!/usr/bin/perl
use CGI;
$cgi=CGI::new ;
$cgi->nph();

print "HTTP/1.1 200 OK\n";
print "Connection:Close\n";
print "Content-type:text/plain\n\n";

print"A response which is neither content length nor chunked. A FIN should be \nsent at the end of this response\n" ; 


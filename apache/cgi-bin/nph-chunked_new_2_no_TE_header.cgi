#!/usr/bin/perl
print "HTTP/1.1 200 OK\r\n";
print "Content-type: text/html\r\n" ;
#print "Transfer-Encoding: chunked\r\n";
print "Connection: close\r\n";
print "Date: Thu, 15 Jan 2009 05:27:51 GMT\r\n";
print "\r\n";
print "A\r\n";
print "0123456789";
print "\r\n";
print "A\r\n";
print "abcdefghij";
print "\r\n";
print "A\r\n";
print "012345";
print "\r\n";
print "0\r\n\r\n";

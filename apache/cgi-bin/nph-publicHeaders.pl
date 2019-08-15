#!/usr/bin/perl 

print "HTTP/1.1 200 OK\n";
print "Cache-Control: public\r\n";
print "Cache-Control: max-age=300\r\n";
print "Expires: Thu, 08 May 2008 02:17:10 GMT\r\n";
print "Date: Tue, 19 Jun 2007 02:17:10 GMT\r\n";
print "Content-Type: text/html\r\n";
print "Content-length: 41\r\n\r\n";
 
print "A response with Public and Expires header";


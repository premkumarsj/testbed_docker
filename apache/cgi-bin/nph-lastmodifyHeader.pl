#!/usr/bin/perl 
use CGI;
$cgi=CGI::new ;
$cgi->nph();

print "HTTP/1.1 200 OK\n";
print "Date: Tue, 19 Jun 2007 02:17:10 GMT\n";
print "Last-Modified: Tue, 03 Apr 2017 03:00:00 IST\r\n";
print "Content-Type: text/html\n";
print "Content-length: 41\n";
print "Connection: Keep-Alive\n\n";

print "A response with Public and Expires header";


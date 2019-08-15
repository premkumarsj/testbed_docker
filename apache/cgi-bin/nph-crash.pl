#!/usr/bin/perl
use strict;
use CGI qw(:standard);

print "HTTP/1.1 200 OK\r\n";
print "Connection: Keep-Alive\r\n";
print "Content-Type: text/html\r\n";
print "Transfer-Encoding: chunked\r\n";
print "X: "."a"x159;
print "\r\n";
print "\r\n";
print "62\r\n";
print "X"x98;
print "\r\n";
print "0\r\n\r\n";
print start_html;
print end_html;

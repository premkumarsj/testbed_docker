#!/usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Last-modified: Mon, 17 Jan 2005 10:50:10 GMT\r\n";
print "Age:80000\r\n";
print "Content-type: text/plain\r\n";
print "Content-length: 34\r\n\r\n";

print "A response with Last Modified date";

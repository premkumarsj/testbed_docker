#!/usr/bin/perl
print "HTTP/1.1 206 Partial Content\n";
print "Content-Range:bytes 13-22/36\n";
print "Content-length:10\n"; 
print "Content-type: text/html\n\n";

print "tencharact";

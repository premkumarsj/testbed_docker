#!/usr/bin/perl
print "HTTP/1.1 206 Partial Content\n";
print "Content-Range:bytes 1-12/36\n";
print "Content-length:12\n"; 
print "Content-type: text/html\n\n";

print "<HTML><BODY>";
#

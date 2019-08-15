#!/usr/bin/perl
print "HTTP/1.1 206 Partial Content\n";
print "Content-Range:bytes 23-36/36\n";
print "Content-length:14\n"; 
print "Content-type: text/html\n\n";

print "</HTML></BODY>";

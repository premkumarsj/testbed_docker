#!/usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Connection: Close\n";
print "Content-type: text/plain\n\n";

print "If this file is accesed Connection will be closed by the server even if\nthe client Connection header is Conenction:Keep-Alive";


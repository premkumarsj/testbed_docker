#!/usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Connection: Keep-Alive\n";
print "Content-type: text/plain\n\n";

print "Although the response header will have Connection:Keep-Alive connection will be closed by the server if the request specified Connection:close";

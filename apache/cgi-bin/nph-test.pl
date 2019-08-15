#!/usr/bin/perl

print "HTTP/1.1 200 OK\r\n";
print "Connection: Keep-Alive\r\n";
print "Content-Type: text/html\r\n";
print "Transfer-Encoding: chunked\r\n";
print "\r\n";


print "10\r\n";
print "<!DOCTYPE HTML P\r\n";
print "27\r\n";
print "UBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\r\n";
print "16\r\n";
print "<html>Test Page</html>\r\n";
print "0\r\n\r\n";

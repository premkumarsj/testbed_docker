#!/usr/bin/perl -w
print "HTTP/1.1 451 OK\r\n";
print "Content-Type: text/html\r\n";
print "Location: webmail2\r\n";
print "Content-Length: 187\r\n\r\n";
print "Served by webmail2. webmail2 is our dummy server. We have webmail2 working as an efficient backend server for mail exchange. The url to directly access webmail2 is webmail2.owa.someurl.in";

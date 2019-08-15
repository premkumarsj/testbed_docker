#!/usr/bin/perl 
$| = 1;
print "HTTP/1.1 200 OK\n";
print "Date: Tue, 27 Mar 2003 11:13:28 GMT\r\n";
print "Last-Modified: Tue, 27 Mar 2003 11:13:28 GMT\r\n";
print "Expires: Tue, 28 Mar 2003 11:13:28 GMT\r\n";
print "Content-type: text/plain\r\n";
print "Content-length: 59\r\n\r\n"; 

sleep(1);
print "Age value calculated from 'Date' and 'Age' headers mismatch";


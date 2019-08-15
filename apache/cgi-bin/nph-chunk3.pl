#! /usr/bin/perl

use CGI ;
print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;
$cgi= CGI::new ;

for (my $j = 1; $j <=30; $j++) 
{
print "400\r\n";
print "3"x1024;
print "\r\n";
}
print "0\r\n\r\n";


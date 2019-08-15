#! /usr/bin/perl

use CGI ;
print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Content-Length:4096000000\n\n" ;
$cgi= CGI::new ;

for (my $j = 1; $j <=4000000; $j++) 
{
print "4"x1024;
}

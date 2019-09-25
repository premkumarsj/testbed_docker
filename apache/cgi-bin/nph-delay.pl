#! /usr/bin/perl

use CGI ;
print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "h1: value1\n";
print "h4: value4\n";
print "h5: value5\n" ;
print "h10: value10\n";
print "Content-Length:20480\n\n" ;
$cgi= CGI::new ;
print $cgi;

for (my $j = 1; $j <=10; $j++)
{
print "6"x10;
}
sleep 6 ;
for (my $j = 1; $j <=10; $j++)
{
print "7"x10;
}
print "\n";

#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n" ;
print "Trailer: Set-Cookie\n\n";
$cgi= CGI::new ;

print "24\n" ;
print "<HTML><BODY>tencharact</BODY></HTML>";
print "\n0\nSet-Cookie: Trailer Cookie\n\n";

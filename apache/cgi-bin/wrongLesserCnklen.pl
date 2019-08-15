#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;
$cgi= CGI::new ;

print "10\n" ;
print "<HTML><BODY>tencharact</BODY></HTML>";
print "\n0\n\n";

#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n" ;
print "Content-length:10\n\n";
$cgi= CGI::new ;

print "<HTML><BODY>tencharact</BODY></HTML>";

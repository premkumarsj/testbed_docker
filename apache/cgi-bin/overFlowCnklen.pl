#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;
$cgi= CGI::new ;

print "1ABCDEFFF66789ABFD98791FF00\n" ;
print "<HTML><BODY>Chunk length greater than actual data</BODY></HTML>";
print "\n0\n\n";

#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Content-length: 99746832648723648726999999999999\n\n" ;
$cgi= CGI::new ;

#print $cgi->start_html(-title=>'Compression testing-Very Large Content Length');

#print "We send a large content length but very little content.<br>This should cause a size overflow in NetScaler" ;

#print $cgi->end_html(); 

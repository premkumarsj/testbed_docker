#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Content-length: 3000\n\n" ;
$cgi= CGI::new ;

print $cgi->start_html(-title=>'Compression testing-Content Length Greater than Actual');

print "We send a large content length but very little content. While NetScaler<br>and Browser handle this properly, clients such a LWP may hang waiting for <br> the'remaining' data" ;

print $cgi->end_html(); 

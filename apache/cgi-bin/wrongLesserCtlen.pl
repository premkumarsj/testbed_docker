#! /usr/bin/perl

use CGI ;
print "Content-type:text/html\n" ;
print "Content-length: 25\n\n" ;
$cgi= CGI::new ;

print $cgi->start_html(-title=>'Compression testing-Content Length Lesser than Actual');

print "We send a large content length but very little content. NetScaler wil not<br> compress the response and Browser is able to handle this properly.Clients <br>such a LWP truncate the response displayed to the ctlen value" ;

print $cgi->end_html(); 

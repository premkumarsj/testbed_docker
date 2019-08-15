#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "HTTP 200 OK\r\n";
print "Connection: close\r\n";
print "Content-type: text/html\r\n\r\n";

print $cgi->start_html(-title=>'Compression Test for HTML Page');

print "This page should not be compressed since the Cache-control:no-transform directive is specified" ;

print $cgi->end_html();


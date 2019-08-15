#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "Cache-Control: no-transform\n";
print "Content-type: text/html\n\n";

print $cgi->start_html(-title=>'Compression Test for HTML Page');

print "This page should not be compressed since the Cache-control:no-transform directive is specified" ;

print $cgi->end_html();


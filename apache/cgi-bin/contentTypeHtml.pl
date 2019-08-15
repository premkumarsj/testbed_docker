#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "Content-type: text/html\n\n";

print $cgi->start_html(-title=>'Compression Test for HTML Page');

print "This page has text/html content" ;

print $cgi->end_html();


#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "Content-type: text/html\n";
print "Vary: Accept Encoding\n";
print "Content-Encoding: Pack200-gzip\n\n";

print $cgi->start_html(-title=>'Compression Test for HTML Page');

print "This page should not be compressed since the content-encoding field is already specified" ;

print $cgi->end_html();


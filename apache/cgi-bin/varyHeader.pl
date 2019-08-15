#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "Content-type: text/html\n";
print "Vary: user-agent, accept-language\n\n";

print $cgi->start_html(-title=>'Compression Test for HTML Page');

print "This page should be compressed and a vary header added" ;

print $cgi->end_html();


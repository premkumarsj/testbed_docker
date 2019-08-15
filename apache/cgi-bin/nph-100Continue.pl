#!/usr/bin/perl
use CGI;
$cgi=CGI::new ;
$cgi->nph();

print "HTTP/1.1 100 Continue\n";
print "Connection:Keep-Alive\n\n";


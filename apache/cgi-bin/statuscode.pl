#!/usr/bin/perl -w
use CGI;
use bytes;

my %queryString = ();
my $qwStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $qwStr);
my $raw = 0;

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}
# # $str =~ s/$find/$replace/g;
my $status = $queryString{"choice"};
# print "HTML/1.1 $status\r\n";
print "Status:$status", "\r\n";
print "Content-Length:0", "\r\n";
print "Content-type:text/html; charset=utf-8\r\n\r\n" ;
# print "Connection:Keep-Alive\r\n\r\n" ;
print "\r\n";
print "\r\n";

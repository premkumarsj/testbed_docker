#!/usr/bin/perl
use CGI ;
$cgi=CGI::new ;
$cgi->nph();
binmode STDIN,':raw';
binmode STDOUT,':raw';
my $cgi=CGI::new ;
open(ip,"<lineFeed");
open (op,">testfile");
$val = 0;
while(<ip>) {
       $val = $_ ;	
}
close(ip);

print "HTTP/1.1 206 Partial Content\n";
print  "Vary:User-Agent";
print  "$val";
print "Content-length: 4";
print "$val";
print  "Content-type: text/plain";
print  "$val$val";

print  "Body";



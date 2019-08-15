#!/usr/bin/perl
use CGI ;

my $cgi=CGI::new ;
print "Content-type: text/plain\n\n";

binmode STDIN,':raw';
binmode STDOUT,':raw';

open(ip,"<norepPattern");

while(<ip>) {
	print $_ ;
}
close(ip);





#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

open(ip,"<150MBfile.txt");

while(<ip>) {
	print $_ ;
}
close(ip);



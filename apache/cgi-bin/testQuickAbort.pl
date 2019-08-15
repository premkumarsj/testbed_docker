#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

$quantumSize=57344 ;

$result=` sh createFileOfSize.sh  equalTo11k 11000`;
open(ip,"<equalTo11k");
while(<ip>) {
	print $_ ;
}

sleep(20);

$result=` sh createFileOfSize.sh  equalTo12k 12000`;
open(ip,"<equalTo12k");
while(<ip>) {
	print $_ ;
}
close(ip);



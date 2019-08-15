#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo5m' whose size is: 5000000 bytes

$result=` sh createFileOfSize.sh  equalTo5m 5000000`;


open(ip,"<equalTo5m");

while(<ip>) {
	print $_ ;
}
close(ip);



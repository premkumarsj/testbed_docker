#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo500k' whose size is: 500000 bytes

$result=` sh createFileOfSize.sh  equalTo500k 500000`;


open(ip,"<equalTo500k");

while(<ip>) {
	print $_ ;
}
close(ip);



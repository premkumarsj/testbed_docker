#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

print "Content-length: 50000\r\n\r\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo50k' whose size is: 50000 bytes

$result=` sh createFileOfSize.sh  equalTo50k 50000`;


open(ip,"<equalTo50k");

while(<ip>) {
	print $_ ;
}
close(ip);


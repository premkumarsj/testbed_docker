#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo64k' whose size is: 64 * 1024

$result=` sh createFileOfSize.sh  equalTo64k 65536`;


open(ip,"<equalTo64k");

while(<ip>) {
	print $_ ;
}
close(ip);



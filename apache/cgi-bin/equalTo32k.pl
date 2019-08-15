#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo32k' whose size is: 32 * 1024

$result=` sh createFileOfSize.sh  equalTo32k 32768`;


open(ip,"<equalTo32k");

while(<ip>) {
	print $_ ;
}
close(ip);



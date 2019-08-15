#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;
use Time::Local;

print "Content-type: text/html\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Create the file 'equalTo500bytes' whose size is: 50 bytes

$result=` sh createFileOfSize.sh  equalTo500bytes 500`;

open(ip,"<equalTo5k");

$date = localtime time;
print $date;
while(<ip>) {
	print $_ ;
}
close(ip);



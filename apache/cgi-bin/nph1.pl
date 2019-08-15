#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/plain\n\n";

$cgi = CGI::new ;

$quantumSize=57344 ;

$result=` sh createFileOfSize.sh  equalTo12k 12000`;
open(tp,"<equalTo12k");
while(<tp>) {
	print $_ ;
}

sleep(10);

$result=` sh createFileOfSize.sh  equalTo13k 13000`;
open(tp,"<equalTo13k");
while(<tp>) {
	print $_ ;
}
sleep (10);
close(tp);



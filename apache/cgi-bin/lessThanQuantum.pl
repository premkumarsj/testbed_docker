#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
#Prerequisite:File whose size is 
use CGI ;

print "Content-type: text/html\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;
#Create the file 'lessThanQuantum'

#Why does this not work?

$result=` sh createFileOfSize.sh  testfile 25000`;
print $cgi->start_html(-title=>'Compression Test for Pages smaller than Quantum');

print "This page has text/html content whose size is smaller than compression quantum\n\n" ;

printf("Random content follows.....\n");


open(ip,"<lessThanQuantum");

while(<ip>) {
	print $_ ;
}
print "\n\nEnd of Random content\n" ;
print "</BODY></HTML>\n";
close(ip);



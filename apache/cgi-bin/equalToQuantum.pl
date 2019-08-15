#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
#Prerequisite: File whose size = QuantumSize - 643 
use CGI ;

print "Content-type: text/html\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;
#Create the file 'lessThanQuantum'

#Why does this not work?
#system "\/var\/www\/cgi-bin\/createFileOfSize testfile 14567";

print $cgi->start_html(-title=>'Compression Test for Pages of exactly Quantum Size');


print "This page has text/html content whose size is exactly equal  to compression quantum<br>" ;

printf("Random content follows.....\n");


open(ip,"<equalToQuantum");

while(<ip>) {
	print $_ ;
}
print "\n\nEnd of Random content\n" ;
print "</BODY></HTML>\n";
close(ip);



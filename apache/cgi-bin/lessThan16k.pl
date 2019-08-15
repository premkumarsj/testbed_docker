#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/html\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;
#Create the file 'lessThan16k'

$result=` sh createFileOfSize.sh  lessThan16k 10000`;

print $cgi->start_html(-title=>'Compression Test for Pages lesser than 16k');

print "This page has text/html content whose size is less than 16k<br>" ;

printf("Random content follows.....<br>");


open(ip,"<lessThan16k");

while(<ip>) {
	print $_ ;
}
print "\n\nEnd of Random content\n" ;
print "</BODY></HTML>\n";
close(ip);



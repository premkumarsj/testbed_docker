#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

print "Content-type: text/html\n\n";

$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;
#Create the file 'btwn16kand32k'

$result=` sh createFileOfSize.sh  btwn16kand32k 21000`;

print $cgi->start_html(-title=>'Compression Test for Pages between 16k and 32k');

print "This page has text/html content whose size is between 16k and 32k<br>" ;

printf("Random content follows.....<br>");


open(ip,"btwn16kand32k");

while(<ip>) {
	print $_ ;
}
print "\n\nEnd of Random content\n" ;
print "</BODY></HTML>\n";
close(ip);



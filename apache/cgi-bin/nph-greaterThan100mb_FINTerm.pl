#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;
$cgi = CGI::new ;
$cgi->nph();


print "HTTP/1.1 200 OK\n";
print "Connection:Close\n";
print "Content-type:text/plain\n\n";

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;
#Create the file 'greaterThan100mb'

$result=` sh createFileOfSize.sh  greaterThan100mb 115343360`;

print $cgi->start_html(-title=>'Compression Test for Pages greater than 100mb');

print "This page has text/html content whose size is greater than 100mb<br>" ;

printf("Random content follows.....<br>");


open(ip,"<greaterThan100mb");

while(<ip>) {
	print $_ ;
}
print "\n\nEnd of Random content\n" ;
print "</BODY></HTML>\n";
close(ip);
exit(1) ;

#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
#Prerequisite:File whose size is 
use CGI ;

print "Content-type: text/html\n";
# Content length = size of 'twoPacketResponse` file + sizeof(HTML/BODY) tags
# 

$size = `sh getsize.sh twoPacketResponse` ;
$size = $size + 12 + 14 ;
print "Content-length:$size \n\n";
$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Why does this not work?
#system "\/var\/www\/cgi-bin\/createFileOfSize testfile 14567";

print "<HTML><BODY>";

open(ip,"<twoPacketResponse");

while(<ip>) {
	print $_ ;
}

print "</BODY></HTML>";
close(ip);



#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
#Prerequisite:File whose size is 
use CGI ;

print "Content-type: text/html\n";
print "Content-length:42 \n\n" ;
$cgi = CGI::new ;

#$quantumSize=$cgi->param('quantum');
#print "Quantum size: $qsize" ;

$quantumSize=57344 ;

#Why does this not work?
#system "\/var\/www\/cgi-bin\/createFileOfSize testfile 14567";


#print $cgi->start_html(-title=>'Compression Test for One Packet response');

print "<HTML><BODY>" ;
print "Very Little Data" ;

print "</BODY></HTML>";



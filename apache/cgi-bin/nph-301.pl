#!/usr/bin/perl
use CGI;
$cgi=CGI::new ;
$cgi->nph();

print "HTTP/1.1 302 Found\r\n";
print "Connection: close\r\n";
printf "Content-type: text/plain\r\n";
printf "Content-length:53\r\n\r\n";
printf "100 continue + Incomplete 200 response in same packet";

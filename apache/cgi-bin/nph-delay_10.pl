#!/usr/bin/perl -w
use CGI;
use bytes;

sleep(10);
my $http_reponse ="HTTP/1.1 200 OK\r\nCache-Control: no-store, no-cache, max-age=0, private\r\nServer: Microsoft-IIS/8.5\r\nX-Powered-By: ASP.NET\r\nDate: Mon, 30 Oct 2017 16:05:59 GMT\r\n\r\n";
print $http_reponse ;


############################################################################
# Below block insert only extra DATA in new packet
############################################################################
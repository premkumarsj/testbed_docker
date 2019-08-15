#!/usr/bin/perl -w
use Switch;

my %queryString = ();
my $tmpStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $tmpStr);
my $raw = 0;

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}

if ($queryString{"raw"} eq '1') {
print "HTTP/1.1 101 Switching Protocols\r\n";
}
if ($queryString{"raw"} eq '2') {
print "HTTP/1.1 200 OK\r\n";
}
if ($queryString{"raw"} eq '3') {
print "HTTP/1.1 301 Moved Temporarily\r\n";
}
if ($queryString{"raw"} eq '4') {
print "HTTP/1.1 403 Forbidden\r\n";
}
if ($queryString{"raw"} eq '5') {
print "HTTP/1.1 500 Internal Server Error\r\n";
}
print "Content-Type: text/html\r\n";
print "Server: Apache\r\n";
print "Content-Length: 5\r\n\r\n";
print "Body_";

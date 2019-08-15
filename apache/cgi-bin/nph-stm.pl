#!/usr/bin/perl -w

my %queryString = ();
my $tmpStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $tmpStr);
my $raw = 0;

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}
if ($queryString{"id"} eq "stream") {
    print "HTTP/1.1 200 OK\r\n";
    print "Content-Type: text/html\r\n";
    print "Server: Apache\r\n"; 
    print "Content-Length: 10060 \r\n\r\n";
    sleep(1);
    for($i=0;$i<8960;$i++) {
        print("a");
    }
    sleep(1);
    for($i=0;$i<2000;$i++) {
        print("JLEwx");
    }
    sleep(1);
    for($i=0;$i<3000;$i++) {
        print("JLE");
    }
}

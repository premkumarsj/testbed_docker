#!/usr/bin/perl
use Switch;

my %queryString = ();
my $tmpStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $tmpStr);

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}

print "HTTP/1.1 200 OK\r\n";
print "Content-type: text/html\r\n" ;
print "Transfer-Encoding: chunked\r\n";
print "Connection: close\r\n";
print "Date: Thu, 15 Jan 2009 05:27:51 GMT\r\n";

    switch ($queryString{"case"}) {

        case 4 {
            print "\r\n";
            print "A\r\n";
            print "0123456789";
            print "\r\n";
            print "A\r\n";
            print "abcdefghij";
            print "\r\n";
            print "6\r\n";
            print "0123456789";
            print "\r\n";
            print "0\r\n\r\n";
             }
        case 5 {
            print "\r\n";
            print "A\r\n";
            print "0123456789";
            print "\r\n";
            print "A\r\n";
            print "abcdefghij";
            print "\r\n";
            print "1E\r\n";
            print "0123456789";
            print "\r\n";
             }
        case 6 {
            print "\r\n";
            for(my $i=0; $i < 200 ; $i++) {
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                print "A\r\n";
                print "abcdefghij";
                print "\r\n";
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                }
                print "2\r\n";
                print "0123456789\r\n";
                print "0\r\n\r\n";

        }
        case 7 {
            print "\r\n";
            for(my $i=0; $i < 200 ; $i++) {
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                print "A\r\n";
                print "abcdefghij";
                print "\r\n";
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                }
                print "1E\r\n";
                print "0123456789\r\n";
                print "0\r\n\r\n";

        }
        case 9 {
            print "\r\n";
            for(my $i=0; $i < 200 ; $i++) {
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                print "A\r\n";
                print "abcdefghij";
                print "\r\n";
                print "A\r\n";
                print "0123456789";
                print "\r\n";
                }
                #print "0\r\n\r\n";

        }

        case 2 {
            ##Different Testcase - chunk_basic.pl
            print "Content-Length: 531\r\n";
            print "\r\n";
            print "A\r\n";
            print "0123456789";
            print "\r\n";
            print "A\r\n";
            print "abcdefghij";
            print "\r\n";
            print "A\r\n";
            print "0123456789";
            print "\r\n";
            print "0\r\n\r\n";

        }
        case 40 {
            ##Different Testcase - chunk_basic.pl
            print "Content-Length: 531\r\n";
            print "\r\n";
            print "3\r\n";
            print "abc";
            print "\r\n";
            print "0\r\n\r\n";

        }
    }


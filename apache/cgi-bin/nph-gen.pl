#!/usr/bin/perl
use CGI;

my $cgi = CGI::new;

print "HTTP/1.1 200 O";

my @names = $cgi->param;
foreach $name(@names) {
        @vals = $cgi->param($name);
        foreach $item(@vals) {
                while ($item > 0) {
                        print "K";
                        $item--;
                }
        }
}

print "\r\n\r\n";

print "DONE\n"

#!/usr/bin/perl
use CGI;

print "Content-type:text/plain";
print "\r\n\r\n";

my $cgi = new CGI();

my @names = $cgi->param;

foreach $name(@names) {
        @vals = $cgi->param($name);
        foreach $item(@vals) {
                while ($item > 0) {
			print "-";
			$item--;
		}
        }
}

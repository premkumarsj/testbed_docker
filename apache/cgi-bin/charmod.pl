#!/usr/bin/perl
use strict;
use CGI qw(:standard);

my $query=$ENV{QUERY_STRING};
my $text="a";
print header;
#print "<B>Query string = \"$query\"</B>";
my @params = split (/&/, $query);
my ($name1, $value1) = split (/=/, $params[0]);
my ($name2, $value2) = split (/=/, $params[1]);
my $html_start = 0;
my $script_start = 0;
for(my $count = 0; $count < $value1; $count++)
{
	if ( $count eq $value2 ) {
		print start_html;
		$html_start = 1;
 	} else {
 	    if ($html_start) {
	        print "$text";
	    }
	}
}
if ($html_start) {
    print end_html;
}

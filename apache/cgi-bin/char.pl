#!/usr/bin/perl
#use strict;
use CGI qw(:standard);

my $q=new CGI;
my $params=$q->Vars;
print header;
my $t;
my %testhash = %$params;
foreach $t (keys(%testhash)) {
	$name = $t;
	$value = $testhash{$t};
}

#my($name, $value) = split(/=/, $params);
#print start_html;
print "<html><head> </head>";
my $count = 1;
for(my $count = 0; $count < $value; $count++)
{
	print $name;
}
print "</html>";

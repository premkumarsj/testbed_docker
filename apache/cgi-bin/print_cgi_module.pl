#!/usr/bin/perl
#use strict;
use CGI qw(:standard);

my $q=new CGI;
my $params=$q->Vars;
print header;
my $name;
my %testhash = %$params;

print "<html><head> </head>";
print "Submitted Form Parameters:<br>\n";
foreach $name (keys(%testhash)) {
        print "Name: ", $name, "; Value: ", $testhash{$name}, "<br>\n"
}
print "<br><br>\n";
print "Environment Variables:<br>\n";
foreach $name (keys(%ENV)) {
        print "Name: ", $name, "; Value: ", $ENV{$name}, "<br>\n"
}
print "</html>";

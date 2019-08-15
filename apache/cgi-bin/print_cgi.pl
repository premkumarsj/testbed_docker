#!/usr/bin/perl
#use strict;

my ($buffer, @pairs, $pair, $name, $value, %FORM);
my ($method_is_post);

# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;

if ($ENV{'REQUEST_METHOD'} eq "POST")
{
	read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	$method_is_post = 1;
}
else {
	$buffer = $ENV{'QUERY_STRING'};
	$method_is_post = 0;
}

# Split information into name/value pairs
@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{
	($name, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	$FORM{$name} = $value;
}

$first_name = $FORM{first_name};
$last_name  = $FORM{last_name};

print "Content-type:text/html\r\n\r\n";
print "<html>";
print "<head>";
print "</head>";
print "<body>";

if ($method_is_post) {
	print "Method is POST<br>\n";
	print "Standard input is:<br>\n";
	print "------------<br>\n";
	print $buffer, "\n";
	print "------------<br>\n";
}
else {
	print "Method is GET<br>\n";
	print "Query string is: ", $buffer, "<br>\n";
}
print "<br><br>";

print "Environment Variables:<br>\n";
foreach $name (keys(%ENV)) {
        print "Name: ", $name, "; Value: ", $ENV{$name}, "<br>\n"
}

print "</body>";
print "</html>";

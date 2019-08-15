#!/usr/bin/perl
use CGI;

my $query = new CGI;

my $tcid=$query->param('tcid');
#my $iter=$query->param('iter');
#my $version;
#($tcid,$iter,$version)=get_req_param();


####### 29.25.1.32 : Header-syntax >> HTTP response + No status code  ###############
if ($tcid eq "29.25.1.32"){
print "$version OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### invalid test case id  ###############
else {
print "Content-type:text/plain; charset=iso-8859-1\n";
print "invalid test case id\n";
print "tcid: -1\n\n";}

############ Function to parse the incoming request ######

sub get_req_param
{
my ($buffer, @pairs, $pair, $name, $value, %PARAM);
$buffer = $ENV{'QUERY_STRING'};
@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{
        ($name, $value) = split(/=/, $pair);
        $value =~ tr/+/ /;
        $value =~ s/%(..)/pack("C", hex($1))/eg;
        $PARAM{$name} = $value;
}
my $tcid1 = $PARAM{tcid};
my $iter1 = $PARAM{iter};
my $version1 = $ENV{'SERVER_PROTOCOL'}; 
return ($tcid1,$iter1,$version1); }

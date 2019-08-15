#!/usr/bin/perl
use CGI;

#my $query = new CGI;

#my $tcid=$query->param('tcid');
#my $iter=$query->param('iter');
#my $version;
($tcid,$iter,$version)=get_req_param();
=for comment
####### 29.33.1.1 : Header-syntax >> HTTP response + No version number ###############
if ($tcid eq "29.33.1.1") {
print "HTTP/ 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++) 
{
print "6"x1024;}} 
=cut
####### 29.33.1.2 : Header-syntax >> HTTP response + No status code  ###############
elsif ($tcid eq "29.25.1.31"){
print "$version OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }
=for comment
####### 29.33.1.3 : Header-syntax >> HTTP response + No proper header field separator i.e. >  ###############
elsif ($tcid eq "29.33.1.3"){
print "$version 200 OK\n";
print "Server> Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type> text/plain; charset=iso-8859-1\n";
print "Content-Length> 10240\n";
print "tcid> $tcid\n";
print "Connection> Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.1.4 : Header-syntax >> HTTP response + No line separator between headers  ###############
elsif ($tcid eq "29.33.1.4"){
print "$version 200 OK";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1";
print "Content-type: text/plain; charset=iso-8859-1";
print "Content-Length: 10240";
print "tcid: $tcid";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.1.5 : Header-syntax >> HTTP response + Extra line between headers  ###############
elsif ($tcid eq "29.33.1.5"){
print "$version 200 OK\n\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n\n";
print "Content-type: text/plain; charset=iso-8859-1\n\n";
print "Content-Length: 10240\n\n";
print "tcid: $tcid\n\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.1.6 : Header-syntax >> HTTP response + No header field value  ###############
elsif ($tcid eq "29.33.1.6"){
print "$version 200 OK\n";
print "Server: \n";
print "Content-type: \n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.1 : Header-anomaly >> HTTP response + Long header line i.e. 50  ###############
elsif ($tcid eq "29.33.2.1"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: ", "text/plain; charset=iso-8859-1"x50, "\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.2 : Header-anomaly >> HTTP response + Long header line i.e. 5000  ###############
elsif ($tcid eq "29.33.2.2"){
print "$version 200 OK\n";
print "Server: ", "Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1"x5000, "\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.3 : Header-anomaly >> HTTP response + Double content-length headers with different values, one being correct  ###############
elsif ($tcid eq "29.33.2.3"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "Content-Length: 10220\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.4 : Header-anomaly >> HTTP response + Double content-length headers with same value  ###############
elsif ($tcid eq "29.33.2.4"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.5 : Header-anomaly >> HTTP response + Large number of headers i.e. 50  ###############
elsif ($tcid eq "29.33.2.5"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n"x50;
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.6 : Header-anomaly >> HTTP response + Large number of headers i.e. 5000  ###############
elsif ($tcid eq "29.33.2.6"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n"x5000;
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.2.7 : Header-anomaly >> HTTP response + No end of headers, connection stalls  ###############
elsif ($tcid eq "29.33.2.7"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n";}

####### 29.33.3.1 : Header-Protocol >> HTTP response + Invalid response code i.e. 2A0  ###############
elsif ($tcid eq "29.33.3.1"){
print "$version 2A0 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.2 : Header-Protocol >> HTTP response + Extended response code i.e. 278  ###############
elsif ($tcid eq "29.33.3.2"){
print "$version 278 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.3 : Header-Protocol >> HTTP response + Wrong version number in request i.e. 1.2  ###############
elsif ($tcid eq "29.33.3.3"){
print "HTTP/1.2 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10240\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.4 : Header-Protocol >> HTTP response + missing content-length header  ###############
elsif ($tcid eq "29.33.3.4"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.5 : Header-Protocol >> HTTP response + content-length=0 + body  ###############
elsif ($tcid eq "29.33.3.5"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 0\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.6 : Header-Protocol: >> HTTP response + content length > actual body size  ###############
elsif ($tcid eq "29.33.3.6"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10260\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.7 : Header-Protocol >> HTTP response + content-length < actual body size  ###############
elsif ($tcid eq "29.33.3.7"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: text/plain; charset=iso-8859-1\n";
print "Content-Length: 10230\n";
print "tcid: $tcid\n";
print "Connection: Keep-Alive\n\n";
 
for (my $j = 1; $j <=10; $j++)
{
print "6"x1024;} }

####### 29.33.3.8 : Header-Protocol >> HTTP response + Chunk data + content length header  ###############
elsif ($tcid eq "29.33.3.8"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "Content-Length: 78\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "9\r\ns1=ashish\r\ne\r\n&surname=gupta\r\n22\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.1 : Wrong-body-structure >> HTTP response + Chunk data + No chunk length  ###############
elsif ($tcid eq "29.33.4.1"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";

print "\r\ns1=ashish\r\n\r\n&surname=gupta\r\n\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.2 : Wrong-body-structure >> HTTP response + Chunk data + Chunk length > actual length  ###############
elsif ($tcid eq "29.33.4.2"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "19\r\ns1=ashish\r\nf\r\n&surname=gupta\r\n25\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.3 : Wrong-body-structure >> HTTP response + Chunk data + chunk length < actual length  ###############
elsif ($tcid eq "29.33.4.3"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "7\r\ns1=ashish\r\nc\r\n&surname=gupta\r\n20\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.4 : Wrong-body-structure >> HTTP response + Chunk data + Chunk length = 0  ###############
elsif ($tcid eq "29.33.4.4"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "0\r\ns1=ashish\r\ne\r\n&surname=gupta\r\n0\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.5 : Wrong-body-structure >> HTTP response + Chunk data + chunk length followed by newline and data is series of newlines  ###############
elsif ($tcid eq "29.33.4.5"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "9\r\nn\n\n\n\n\n\n\n\n\n\r\ne\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\r\n22\r\n&data=this is the last of the data\r\n0\r\n\r\n"}

####### 29.33.4.6 : Wrong-body-structure >> HTTP response + Chunk data + No zero chunk  ###############
elsif ($tcid eq "29.33.4.6"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
 
print "9\r\ns1=ashish\r\ne\r\n&surname=gupta\r\n22\r\n&data=this is the last of the data\r\n"}

####### 29.33.4.7 : Wrong-body-structure >> HTTP response + Chunk data + chunk of more than 2GB  ###############
elsif ($tcid eq "29.33.4.7"){
print "$version 200 OK\n";
print "Server: Apache/2.2.21 (Unix) mod_ssl/2.2.21 OpenSSL/0.9.7e-p1\n";
print "Content-type: application/x-www-form-urlencoded\n";
print "tcid: $tcid\n";
print "Transfer-Encoding: Chunked\n";
print "Connection: Keep-Alive\n\n";
#print "800018D0\r\n";
print "FA00000\r\n";
for (my $j = 1; $j <=1000; $j++) 
{ 
#print "6"x214749;
print "6"x262144;
} 
print  "\r\ne\r\n&surname=gupta\r\n22\r\n&data=this is the last of the data\r\n0\r\n\r\n";}
=cut
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

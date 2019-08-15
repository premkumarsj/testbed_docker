#! /usr/bin/perl
 
use CGI ;
my $query = new CGI;
my $i = $query->param('i');

#($tcid,$i)=get_req_param();
#my ($i , $t) = get_req_param();
my $j= 100;

my $k = int($i)*$j;
print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "h1: value1\n";
print "h4: value4\n";
print "h5: value5\n" ;
print "h10: value10\n";
print "Content-Length:$k\n\n" ;
for (my $j = 1; $j <=1; $j++)
{
print "9"x$k;
}

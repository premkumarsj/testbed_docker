#!/usr/bin/perl

use CGI ;
print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Header1 : Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1\n" ; print "Header1 2 Valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1\n" ; print "Date: ". getDate() ."\n" ; print "Server: Apache/2.2.3 (Fedora)\n" ; print "Last-Modified: Wed, 12 Aug 1998 11:03:50 GMT\n" ; print "ETag: \"1d80b6-5-67ba5180\"\n" ; print "Content-Length:0\n\n" ; $cgi= CGI::new ;


sub getDate {
    my $add = @_ ? shift :0;
    my @weekDays = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
    my @months = ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = gmtime();
    my $time = time;        # or any other epoch timestamp
    my ($sec, $min, $hour, $day,$month,$year) = (gmtime($time+$add))[0,1,2,3,4,5,6];
    # You can use 'gmtime' for GMT/UTC dates instead of 'localtime'
    $dt = $weekDays[$dayOfWeek] . ", " . $day . " ". $months[$month]." ".($year+1900);
    if ($hour == 0 || $hour < 10) {
        $hour = "0".$hour;
    }
    if ($min == 0 || $min < 10) {
        $min = "0".$min;
    }
    if ($sec == 0 || $sec < 10) {
        $sec = "0".$sec;
    }
    $dt =  $dt . " ".$hour.":".$min.":".$sec." GMT";
    return $dt;
}


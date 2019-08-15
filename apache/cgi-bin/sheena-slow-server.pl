#!/usr/bin/perl

use IO::Socket;

my $htmlresp_file = "test.js";

open (HTMLRESP, $htmlresp_file) or die "Cannot open file $htmlresp_file, $!\n";

my $line = "";

my $proto = getprotobyname('tcp');
my $server = socket(F, PF_INET, SOCK_STREAM, $proto) || die $!;
my $sin = sockaddr_in(10080,inet_aton('0.0.0.0'));
bind(F,$sin) || die $!;
listen(F, 5) || die $!;


while (1) {
	accept(FH,F) || die $!;


	print FH "HTTP/1.1 200 OK\n";
	sleep (1);
	print FH "Content-Length: 3167\n";
	sleep (1);
	print FH "Content-Type: application/x-javascript\n";
	sleep (1);
	print FH "Last-Modified: Tue 06 Jun 2006 13:22:43 GMT\n";
	sleep (1);
	print FH "ETag: 0d59a406c89c61:49d4\n";
	sleep (1);
	print FH "Server: Apache\n";
	sleep (1);
	print FH "Date: Sat, 01 Mar 2008 00:21:43 GMT\n";
	sleep (1);
	print FH "Connection: keep-alive\n\n";

	while ($line = <HTMLRESP>) {
    		@chars = split ("", $line);
    		print "Sending === ". $line ." one char at a time \n";
    		foreach $char (@chars) {
        		print FH $char;
    		}
    		sleep (1);
	}
	close (HTMLRESP);
}


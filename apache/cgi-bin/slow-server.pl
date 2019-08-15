#!/usr/bin/perl

use IO::Socket;

my $htmlresp_file = "test1318_10k";

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
	print FH "Content-Length: 10240\n";
	print FH "Content-Type: text/html\n";
	print FH "Last-Modified: Tue 06 Jun 2006 13:22:43 GMT\n";
	print FH "ETag: 0d59a406c89c61:49d4\n";
	print FH "Server: Apache\n";
	print FH "Date: Wed, 06 Apr 2011 17:25:43 PDT\n";
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


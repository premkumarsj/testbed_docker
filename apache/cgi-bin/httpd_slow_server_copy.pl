#!/usr/bin/perl

use HTTP::Daemon; 
use POSIX;
use File::stat;

# Number of child processes to open presumbly
my $totalChildren = 5;
# Number of requests each child handles before dying
my $childLifetime = 100;
my $logFile = "/tmp/my_http_daemon.log";
my %children;
my $children = 0;

open (LOGMSG, ">>$logFile");
my $htmlresp_file = "./test.js";
open (HTMLRESP, $htmlresp_file) or die "Cannot open file $htmlresp_file, $!\n";
&daemonize;

# Create an HTTP daemon
my $d = HTTP::Daemon->new( LocalPort => 10080, LocalAddr => '0.0.0.0', Reuse => 1, Timeout => 180 ) || die "Cannot create socket: $!\n";

# Log the URL used to access our daemon
logMessage ("master is ", $d->url);
&spawnChildren;
&keepTicking;
close (LOGMSG);

sub logMessage {
   ($str, $msg) = (@_);
    print LOGMSG $str.": ". $msg;
}

sub daemonize {   

	my $pid = fork;   defined ($pid) or die "Cannot start daemon: $!";

	# The daemon is now running.
	print "Parent daemon running.\n" if $pid;

	exit if $pid;

	# Now we're a daemonized parent process!

	# Detach from the shell entirely by setting our own
	# session and making our own process group
	# as well as closing any standard open filehandles.
	POSIX::setsid();
	close (STDOUT); close (STDIN); close (STDERR);

	# Set up signals we want to catch. Let's log
	# warnings, fatal errors, and catch hangups
	# and dying children

	$SIG{__WARN__} = sub {
		&logMessage ("NOTE! " . join(" ", @_));
	};

	$SIG{__DIE__} = sub {
		&logMessage ("FATAL! " . join(" ", @_));
		exit;
	};

	$SIG{HUP} = $SIG{INT} = $SIG{TERM} = sub {
		# Any sort of death trigger results in death of all
		my $sig = shift;
		$SIG{$sig} = 'IGNORE';
		kill 'INT' => keys %children;
		die "killed by $sig\n";
		exit;
	};

	# We'll handle our child reaper in a separate sub
	$SIG{CHLD} = \&REAPER;
}


sub REAPER {
	my $stiff;
	while (($stiff = waitpid(-1, &WNOHANG)) > 0) {
		warn ("child $stiff terminated -- status $?");
		$children--;
		delete $children{$stiff};
	}
	$SIG{CHLD} = \&REAPER;
}

sub spawnChildren {
	for (1..$totalChildren) {
		&newChild();
	}
}

sub keepTicking {
  while ( 1 ) {
    #sleep;
    for (my $i = $children; $i < $totalChildren; $i++ ) {
      &newChild();
    }
  };
}

sub newChild {
  # Daemonize away from the parent process.
  my $pid;
  my $sigset = POSIX::SigSet->new(SIGINT);
  sigprocmask(SIG_BLOCK, $sigset) or die "Can't block SIGINT for fork: $!";
  die "Cannot fork child: $!\n" unless defined ($pid = fork);
  if ($pid) {
	$children{$pid} = 1;
	$children++;
	warn "forked new child, we now have $children children";
	return;
  }

  # Loop for a certain number of times
  my $i = 0;
  while ($i < $childLifetime) {
	$i++;
	# Accept a connection from HTTP::Daemon
	my $c = $d->accept or last;
	$c->autoflush(1);
	logMessage ("connect:". $c->peerhost . "\n");

	# Get the request
	my $r = $c->get_request(1) or last;

	# Process the request..
	# you can do whatever you like here..
	# we blindly respond to anything for now..
	logMessage ($c->peerhost . " " . $d->url . $url . "\n");
	# We do not handle POST 
	if ($r->method eq 'GET') {
		my $htmlresp_file = "./test.js";
		open (HTMLRESP, $htmlresp_file) or die "Cannot open file $htmlresp_file, $!\n";
		# If this URL is just a /, send a simple response
		# For any other URL, send the slow response
		if ($r->url->path =~ /hello/) {
		   sleep (30);
	  	   $c->send_file_response ("./simpleresponse.txt");
		} 
		elsif ($r->url->path !~ /\.xml/ && $r->url->path !~ /\.html/) {
			#sleep (20);
			$c->send_file_response ("./simpleresponse.txt");
		} elsif ($r->url->path =~ /\.xml/) {
				print $c "HTTP/1.1 402 Payment Required";
				$c->send_crlf;
				$c->send_crlf;
		} elsif ($r->url->path =~ /test/) {
			open (NEWFILE, "/var/www/html/index.html") or $cannotopen = 1;
			$newfile = "/var/www/html/index.html";
			$clength = stat($newfile)->size;
			$clength += 7;
			print $c "HTTP/1.1 200 OK";
			$c->send_crlf;
			print $c "Age: 0";
			$c->send_crlf;
			print $c "Last-Modified: Wed, 04 Aug 2010 20:04:04 GMT";
			$c->send_crlf;
			print $c "Expires: Tue, 03 Aug 2010 20:04:04 GMT";
			$c->send_crlf;
			print $c "Content-Length: ".$clength;
			$c->send_crlf;
			$c->send_crlf;
			print $c $r->url->query;
			while ($line = <NEWFILE>) {
			    print $c $line;
			}
			close (NEWFILE);
		} elsif ($r->url->path =~ /hello/) {
			$c->send_crlf;
			$c->send_crlf;
			$c->close;
		} elsif ($r->url->path =~ /\.html$/) {
			$cannotopen = 0;
			$newfile = "/var/www/html".$r->url->path;
			open (NEWFILE, $newfile) or $cannotopen = 1;
			if ($cannotopen) {
			   open (NEWFILE, "/var/www/html/ictest.html") or $cannotopen = 1;
			}
			$clength = stat($newfile)->size;
			sleep (2);
			print $c "HTTP/1.1 200 OK";
			$c->send_crlf;
			print $c "Age: 0";
			$c->send_crlf;
			print $c "Last-Modified: Wed, 04 Aug 2010 20:04:04 GMT";
			$c->send_crlf;
			print $c "Expires: Tue, 03 Aug 2010 20:04:04 GMT";
			$c->send_crlf;
			print $c "Content-Length: ".$clength;
			$c->send_crlf;
			$c->send_crlf;
	
			while ($line = <NEWFILE>) {
			    print $c $line;
			}
			close (NEWFILE);
		} else {
			print $c "HTTP/1.1 200 OK";
			$c->send_crlf;
			print $c "Age: 0";
			$c->send_crlf;
			print $c "Content-Length: 3167";
			$c->send_crlf;
			$c->send_crlf;

			while ($line = <HTMLRESP>) {
				print $c $line;
				#sleep (1);
			}
			close (HTMLRESP);
		}
	} else {
	   #sleep (20);
	    print $c "HTTP/1.1 200 OK";
	    $c->send_crlf;
            print $c "Age: 10";
            $c->send_crlf;
            print $c "Content-Length: 115";
	    $c->send_crlf;
	    $c->send_crlf;
	    print $c "<svc_info>100</svc_info><http_message>GET / HTTP/1.1\r\nHost: 10.217.30.16\r\nFrom: Callout\r\n\r\n</http_message>";
	    close (HTMLRESP);

	    #$c->send_error(RC_FORBIDDEN);
	}
    $c->close;
  }
  warn "child terminated after $i requests";
  exit;
}

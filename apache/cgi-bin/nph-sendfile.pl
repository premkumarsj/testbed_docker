#!/usr/bin/perl

#This file can take quantum size as a form argument named 'quantum'
#Default size is 56k,Option not yet enabled
use CGI ;

$cgi = CGI::new ;

local ($len, $type, $meth, $errflag, $cmdflag, $got, $name);
local ($filename, $line);

# Get several useful env variables
$type = $ENV{'CONTENT_TYPE'};
$len  = $ENV{'CONTENT_LENGTH'};
$meth = $ENV{'REQUEST_METHOD'};

if (!defined $meth || $meth eq '' || $meth eq 'GET' || $meth eq 'HEAD' || $type eq 'application/x-www-form-urlencoded') {
  local ($key, $val, $i);

  # Read in text
  if (!defined $meth || $meth eq '') {
    $in = $ENV{'QUERY_STRING'};
  } elsif($meth eq 'GET' || $meth eq 'HEAD') {
    $in = $ENV{'QUERY_STRING'};
  }

  @in = split(/[&;]/,$in); 
  push(@in, @ARGV) if $cmdflag; # add command-line parameters

  foreach $i (0 .. $#in) {
    # Convert plus to space
    $in[$i] =~ s/\+/ /g;

    # Split into key and value.  
    ($key, $val) = split(/=/,$in[$i],2); # splits on the first =.

    # Convert %XX from hex numbers to alphanumeric
    $key =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;
    $val =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;

    # Associate key and value
    $in{$key} .= "\0" if (defined($in{$key})); # \0 is the multiple separator
    $in{$key} .= $val;
      
  }
}

print "HTTP/1.1 200 OK\n";
print "Content-type: text/plain\n\n";
$filename = $in{"filename"};

open (RESFILE, $filename);

while (<RESFILE>) {
	print $_;
}

close (RESFILE);

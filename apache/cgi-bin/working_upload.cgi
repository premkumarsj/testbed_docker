#!/usr/bin/perl 
# A sample file upload script

use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser);    
use Digest::MD5;

$CGI::POST_MAX = 1024 * 1024 * 1024 * 100;  # maximum upload filesize is 100G

sub save_file($);

#
# Build the form
#

my $q = new CGI;

print $q->header;
print $q->start_html(
-title => "An example file upload web page",
);
print $q->h3('Use this form to upload a local file to the web server'),
$q->start_multipart_form(
-name    => 'main_form');
print 'Enter a filename, or click on the browse button to choose one: ',
$q->filefield(
-name      => 'filename',
	  -size      => 40,
	  -maxlength => 80);
print $q->hr;
print $q->submit(-value => 'Upload the file');
print $q->hr;
print $q->end_form;


if (!$q->param('filename') && $q->cgi_error()) {
print $q->cgi_error();
print <<'EOT';
<p>
The file you are attempting to upload exceeds the maximum allowable file size.
<p>
Please refer to your system administrator
EOT
print $q->hr, $q->end_html;
exit 0;
}

#
# Upload the file
#

if ($q->param()) {
save_file($q);
}

print $q->end_html;
exit 0;

#-------------------------------------------------------------

sub save_file($) {

my ($q) = @_;
my ($bytesread, $buffer);
my $num_bytes = 1024;
my $totalbytes;
my $filename = $q->upload('filename');
my $untainted_filename;

if (!$filename) {
print $q->p('You must enter a filename before you can upload it');
	return;
}

# Untaint $filename

if ($filename =~ /^([-\@:\/\\\w.]+)$/) {
$untainted_filename = $1;
} else {
die <<"EOT";
Unsupported characters in the filename "$filename". 
Your filename may only contain alphabetic characters and numbers, 
and the characters '_', '-', '\@', '/', '\\' and '.'
EOT
}

if ($untainted_filename =~ m/\.\./) {
die <<"EOT";
Your upload filename may not contain the sequence '..' 
Rename your file so that it does not include the sequence '..', and try again.
EOT
}
my $ostest = `uname -a`;
my $osflag = 1;
my $file;
if($ostest !~ /Linux/i)
{
	$osflag = 0;### This means OS is Windows
}
if($osflag)
{
	$untainted_filename =~ s/.*[\/\\]([\.\w\s]+)$/$1/;
	$file = "/tmp/$untainted_filename";
}
else
{
	$untainted_filename =~ s/.*[\/\\]([\.\w\s]+)$/$1/;
	$file = "C:/temp/$untainted_filename";
}
print "Uploading $filename to $file<BR>";


open (OUTFILE, ">", "$file") or die "Couldn't open $file for writing: $!";

while ($bytesread = read($filename, $buffer, $num_bytes)) {
$totalbytes += $bytesread;
print OUTFILE $buffer;
}
die "Read failure" unless defined($bytesread);
unless (defined($totalbytes)) {
print "<p>Error: Could not read file ${untainted_filename}, ";
print "or the file was zero length.";
} else {
print "<p>Done. File $filename uploaded to $file ($totalbytes bytes)<BR>\n";
}
close OUTFILE or die "Couldn't close $file: $!";
########## Calculate the MD5 checksum and print ###########
   open(FILE, $file) or die "Can't open '$file': $!";

    my $md5 = Digest::MD5->new;
    while (<FILE>) {
        $md5->add($_);
    }
    close(FILE);
    print "MD5($file)= " . $md5->hexdigest;#, " $file\n";
}
#-------------------------------------------------------------

use Switch;

$query{"case"} = 1;
my %queryString = ();
my $tmpStr = $ARGV[0];
my @parts = split(/\&/, $tmpStr);
my $raw = 0;

foreach $part (@parts) {
     chomp($part);
    ($name, $value) = split(/\=/, $part);
print "\n\n NAme is $name\n\n";
print "\n\n Value is ($value)\n\n";
    $queryString{"$name"} = $value;
}

foreach (values %queryString) {
    print "\n\n$_--\n\n";
}

foreach (keys %queryString) {
    print "\n\n$_--\n\n";
}

print qq#\n\n\$queryString{"case"} is $queryString{"case"}--------\n\n#;
switch ($queryString{"case"}) {
    case 'a' {
        print "\n\n Inside case 1\n\n";
    }
    else {
        print $queryString{"case"}."\n";
        print "wrong option entered\n\n";
    }
}

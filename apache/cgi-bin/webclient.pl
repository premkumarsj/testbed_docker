 use Net::HTTP;

 my $s = Net::HTTP->new(Host => "www.perl.com") || die $@;

 $s->write_request(GET => "/", 'User-Agent' => "Mozilla/5.0");
 sleep 5;
 my($code, $mess, %h) = $s->read_response_headers;

 while (1) {
    my $buf;
    my $n = $s->read_entity_body($buf, 1024);
    last unless $n;
    print $buf;
 }  

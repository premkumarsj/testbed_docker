#!/usr/bin/perl -w
use bytes;

my %queryString = ();
my $qwStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $qwStr);
my $raw = 0;

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}

my $mss_size = $queryString{"mss"};
my $nsb = $queryString{"res_pkt"};

my $http_reponse ="HTTP/1.1 200 OK\r\nContent-Type: text/html\r\ncharset: UTF-8\r\nServer: Apache\r\nMTU Size: $mss_size\r\n";
#print $http_reponse ;
my $header_length = bytes::length($http_reponse);
my $content_length=0;
my $content_length_header_size = 20; # Excluding value size
my $mss_count_size ;
############################################################################
# Below block insert only extra DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_data_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: $mss_size\r\n";
				$http_reponse .= "Extra_CRLF: 0\r\n";
		
				my $header_length = bytes::length($http_reponse);
				
				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size; $k++) 
					{
						print "X";
					}	
		}
############################################################################
# Below block insert only extra DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_data_in_one_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: $mss_size\r\n";
				$http_reponse .= "Extra_CRLF: 0\r\n";
		
				my $header_length = bytes::length($http_reponse);
				
				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size; $k++) 
					{
						print "X";
					}	
		}
############################################################################
# Below block insert only extra CRLF in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: $mss_size\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/2; $k++) # -> Extra CRLF in new packets
					{
						print "\r\n";
					}	
		}
############################################################################
# Below block insert only extra LF in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_lf_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: $mss_size\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size; $k++) 
					{
						print "\n";
					}	
		}
############################################################################
# Below block insert only extra CR in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_cr_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: $mss_size\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size; $k++) 
					{
						print "\r";
					}	
		}
############################################################################
# Below block insert only extra CR first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_cr_data_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size/2)."\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size/2)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "\r";
					}
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "X";
					}	
		}
############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_lf_data_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size/2)."\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size/2)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "\n";
					}
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "X";
					}	
		}

############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_data_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size/2)."\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size/2)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/4; $k++) 
					{
						print "\r\n";
					}
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "X";
					}	
		}

############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_data_crlf_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size/2)."\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size/2)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "X";
					}
				for (my $k = 1; $k <=$mss_size/4; $k++) 
					{
						print "\r\n";
					}	
		}
############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'res_1pkt_extra_data_crlf_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size/2)."\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size/2)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
				 	{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=$mss_size/2; $k++) 
					{
						print "X";
					}
				for (my $k = 1; $k <=$mss_size/4; $k++) 
					{
						print "\r\n";
					}	
		}

############################################################################
############################################################################
############################################################################
############################################################################
############################################################################
############################################################################

############################################################################
# Below block insert only extra DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_data_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: ".($mss_size)."\r\n";
				$http_reponse .= "Extra_CRLF: 0\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1)));  # ($mss_size*2) -> 2 extra packets
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=($mss_size); $k++) 
					{
						print "X";
					}	
		}
############################################################################
# Below block insert only extra CRLF in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1)));  # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=($mss_size); $k++) 
					{
						print "\r\n";
					}	
		}
############################################################################
# Below block insert only extra LF in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_lf_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1)));  # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=($mss_size); $k++) 
					{
						print "\n";
					}	
		}
############################################################################
# Below block insert only extra CR in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_cr_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 100 + ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=($mss_size); $k++) 
					{
						print "\r";
					}	
		}
############################################################################
# Below block insert only extra CR first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_cr_data_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_CRLF: 200\r\n";
				$http_reponse .= "Extra_DATA: ".($mss_size-200)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=200; $k++) 
					{
						print "\r";
					}
				for (my $k = 1; $k <=($mss_size-200); $k++) 
					{
						print "X";
					}	
		}
############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_lf_data_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_CRLF: 200\r\n";
				$http_reponse .= "Extra_DATA: ".($mss_size-200)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=200; $k++) 
					{
						print "\n";
					}
				for (my $k = 1; $k <=($mss_size-200); $k++) 
					{
						print "X";
					}	
		}

############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_data_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_CRLF: 200\r\n";
				$http_reponse .= "Extra_DATA: ".($mss_size-200)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=100; $k++) 
					{
						print "\r\n";
					}
				for (my $k = 1; $k <=($mss_size-100); $k++) 
					{
						print "X";
					}	
		}


############################################################################
# Below block insert only extra LF first then DATA in new packet
############################################################################
	if ($queryString{"test"} eq 'extra_data_crlf_on_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 100\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size-100)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 3 packets - 200 bytes
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=100; $k++) 
					{
						print "X";
					}
				for (my $k = 1; $k <=($mss_size-100); $k++) 
					{
						print "\r\n";
					}
		}

############################################################################
#- Customer issue case
############################################################################
	if ($queryString{"test"} eq 'extra_data_on_last_packet_crlf_data_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_CRLF: 2\r\n";
				$http_reponse .= "Extra_DATA: ".($mss_size-2)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 3 packets - 200 bytes
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{ 
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=200; $k++) 
					{
						print "X";
					}
				for (my $k = 1; $k <=2; $k++) 
					{
						print "\r\n";
					}
					for (my $k = 1; $k <=($mss_size-204); $k++) 
					{
						print "X";
					}	
		}

############################################################################
#
############################################################################
	if ($queryString{"test"} eq 'extra_data_on_last_packet_data_crlf_on_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 204\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size-204)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 3 packets - 200 bytes
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=200; $k++) 
					{
						print "X";
					}
				for (my $k = 1; $k <=2; $k++) 
					{
						print "XX";
					}
					for (my $k = 1; $k <=($mss_size-4); $k++) 
					{
						print "\r\n";
					}	
		}
############################################################################
#
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_on_last_packet_data_crlf_on_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				$http_reponse .= "Extra_DATA: 2\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size-2)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 3 packets - 200 bytes
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=200/2; $k++) 
					{
						print "\r\n";
					}
				for (my $k = 1; $k <=2; $k++) 
					{
						print "X";
					}
					for (my $k = 1; $k <=($mss_size-202)/2; $k++) 
					{
						print "\r\n";
					}	
		}

############################################################################
#
############################################################################
	if ($queryString{"test"} eq 'extra_crlf_on_last_packet_crlf_data_on_new_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				
				$http_reponse .= "Extra_CRLF: 204\r\n";
				$http_reponse .= "Extra_DATA: ".($mss_size-204)."\r\n";
				
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size - 200 + ($mss_size*($nsb-1))); # 3 packets - 200 bytes
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length; $j++) # -> Actual data as per content length
					{
						print "1";
					}
			
				# Following are extra data in new packet
				for (my $k = 1; $k <=(200/2); $k++) 
					{
						print "\r\n";
					} 
				for (my $k = 1; $k <=2; $k++) 
					{
						print "\r\n";
					}
					for (my $k = 1; $k <=($mss_size-4); $k++) 
					{
						print "X";
					}	
		}
############################################################################
# 
############################################################################
	if ($queryString{"test"} eq 'all_crlf_extra_crlf_last_packet') 
		{		
	
				$mss_count_size = 4 if ($mss_size > 999);
				$mss_count_size = 3 if (($mss_size > 99)&& ($mss_size < 999));
				
				$http_reponse .= "Extra_DATA: 0\r\n";
				$http_reponse .= "Extra_CRLF: ".($mss_size)."\r\n";
				my $header_length = bytes::length($http_reponse);

				$content_length = ($mss_size-$header_length-$content_length_header_size-$mss_count_size-200+ ($mss_size*($nsb-1))); # 20 for content length header size and 4 for MTU size (ex.1342)
				$http_reponse .= "Content-Length: ".$content_length."\r\n\r\n";
				print $http_reponse ;
		
				for (my $j = 1; $j <=$content_length/2; $j++) # -> Actual data as per content length
					{
						print "\r\n";
					}
			
					
				# Following are extra data in new packet
				for (my $k = 1; $k <=($mss_size/2); $k++) # -> Extra CRLF in new packets
					{
						print "\r\n";
					}	
		}
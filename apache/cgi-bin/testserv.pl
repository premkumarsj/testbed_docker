# Server Program
use IO::Socket::INET;
print ">> Server Program <<\n";

# Create a new socket
$MySocket=new IO::Socket::INET->new(LocalPort=>10080,Proto=>'tcp');

# Keep receiving messages from client
$def_msg="\nReceiving message from client.....\n";
while(1)
{
    $MySocket->recv($text,128);
    if($text ne '')
    {
        print "\nReceived message '", $text,"'\n";
    }
    # If client message is empty exit
    else
    {
        print "Cilent has exited!";
        exit 1;
    }
}


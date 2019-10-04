<?php
global $HTTP_GET_VARS;

$login_name = $HTTP_GET_VARS['login_name'];
$passwd = $HTTP_GET_VARS['passwd'];
$text_area = $HTTP_GET_VARS['text_area'];


$date = gmstrftime("%A, %d-%b-%Y %H:%M:%S",(mktime()+6400) );
$date1 = gmstrftime("%A, %d-%b-%Y %H:%M:%S",(mktime()+1400) );
header("Set-Cookie: login=$login_name; expires=$date; path=/", false); 
header("Set-Cookie: geoloc=$passwd; expires=$date1; path=/", false); 
header("Set-Cookie: priya=$text_area; path=/", false); 
print "$login_name has successfully logged in<br>";

print "Your personal information is public!<br><br>";
print "It is as follows<br>";

foreach($HTTP_GET_VARS as $k => $v) {
    print "$k : $v<br>";
}

print "<a href='sc.html'>Login Once again</a>";
print "<br><a href='showcookies.php'>show your cookies</a>";

echo "<br>=================<br>\n";
echo "cookies sent to this page<br>";
$cookie_ak = array_keys($_COOKIE);
sort($cookie_ak);
echo "<br><pre>\n";
foreach ($cookie_ak as $cookiekey => $cookievalue) {
    echo "cookie " . $cookievalue . " : " . $_COOKIE[$cookievalue] . "\n";
}
echo "</pre><br>\n";
?>

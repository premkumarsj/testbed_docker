#! /usr/bin/perl

use CGI ;
print "Content-type: text/html; charset=utf-8\r\n" ;
print "Transfer-Encoding:chunked\r\n" ;
print "Connection: Keep-Alive\r\n\r\n" ;
print "05b4\r\n";
print "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"../testsite/FEO/cssMoveToHead/css_minify_code_removals.css\" /><script type=\"text/javascript\" src=\"../testsite/FEO/cssMoveToHead/formval.js\"></script><style>p.second{font: 12pt/14pt sans-serif}</style></head><body>";
print "1"x1125;
print "<style>p.third{font: 12pt/14pt sans-serif}</style>";
print "<style>p.thirr{";
print "\r\n";
for($i = 0; $i<= 9;$i++)
{
 print "05b4\r\n";
 print "font: 12pt/14pt sans-serif}</style>";
print "1"x1300;
print "<style>p.thir".$i."{font: 12pt/14pt sans-serif}</style>";
print "1"x60;
print "<style>p.thi".$i."d{";
print "\r\n";
}
for($i = 10; $i<= 60;$i++)
{
 print "05b4\r\n";
 print "font: 12pt/14pt sans-serif}</style>";
print "1"x1300;
print "<style>p.thi".$i."{font: 12pt/14pt sans-serif}</style>";
print "1"x60;
print "<style>p.th".$i."d{";
print "\r\n";
}
print "63\r\n";
print "font: 12pt/14pt sans-serif}</style>";
print "<style>p.tiird{font: 12pt/14pt sans-serif}</style>";
print "</body></html>\r\n";
print "0\r\n";
print "\r\n";
print "\r\n";

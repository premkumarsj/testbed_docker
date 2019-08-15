#!/usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;

print "1F3\r\n";
print "<?xml version=\"1.0\" encoding=\"utf-8\"?>                                  <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-US\" lang=\"en-US\">
<head profile=\"http://www.w3.org/2000/08/w3c-synd/#\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<meta name=\"generator\" content=\"HTML Tidy for Mac OS X (vers 1st March 2004), see www.w3.org\" />";
print "\r\n";

print "306\r\n";
print "<title>World Wide Web Consortium</title>
<link rel=\"meta\" href=\"/Overview-about.rdf\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"/StyleSheets/home.css\" />
<link rel=\"bookmark\" href=\"#technologies\" title=\"Technologies |\" />
<link rel=\"bookmark\" href=\"#news\" title=\"News |\" />
<link rel=\"bookmark\" href=\"#search\" title=\"Search |\" />
<link rel=\"contents\" href=\"#contents\" title=\"Contents |\" />
<link rel=\"bookmark\" href=\"#Offices\" title=\"Offices |\" />
<link rel=\"bookmark\" href=\"#systems\" title=\"Systems |\" />
<link rel=\"bookmark\" href=\"#donors\" title=\"Supporters |\" />
<link rel=\"bookmark\" href=\"#footnotes\" title=\"Footnotes |\" />
<link rel=\"alternate\" type=\"application/rss+xml\" title=\"W3C Home Page News RSS Channel\" href=\"http://www.w3.org/2000/08/w3c-synd/home.rss\" />";
print "\r\n";
print "0\r\n\r\n";


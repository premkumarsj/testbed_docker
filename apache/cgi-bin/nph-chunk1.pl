#! /usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;

print "458\r\n";

$str = "

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head><title>
        Sunweb Vakanties - Zonvakanties
</title>
    <meta name=\"description\" content=\"Voordelige zonvakanties, strandvakanties en lastminute reizen. Goedkope vakantie aanbiedingen naar Spanje, Egypte, Griekenland, Turkije , Portugal, Italie, Tunesie, Malta, Kroatie, Cyprus en Bulgarije.\" /><meta name=\"keywords\" content=\"zonvakantie, zonvakanties, zon vakantie, zon vakanties, vakantieaanbieding, vakantieaanbiedingen, vakantie aanbieding, vakantie aanbiedingen, strandvakantie, strandvakanties, strand vakantie, lastminute, lastminutes, lastminute reizen, lastminute zonvakantie, lastminute zonvakanties, jongerenreizen, jongeren reizen, jongerenvakantie, jongerenvakanties, jongeren vakanties, all in vakanties, all inclusive vakanties, goedkope vakanties, goedkope strandvakanties, goedkope zonvakanties, vliegvakantie, vliegvakanties, vliegreis, vliegreizen\" />

<link rel=\"icon\" type=\"image/ico\" href=\"/skins/sz.nl/favicon.ico\" />";
print $str."\r\n";
print "0\r\n\r\n";



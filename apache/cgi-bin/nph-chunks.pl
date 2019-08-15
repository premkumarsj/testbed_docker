#! /usr/bin/perl

print "HTTP/1.1 200 OK\n";
print "Content-type:text/html\n" ;
print "Transfer-Encoding:chunked\n\n" ;

print "1810\r\n";
print "<script language=\"javascript\">
//-- Google Analytics Urchin Module
//-- Copyright 2007 Google, All Rights Reserved.

//-- Urchin On Demand Settings ONLY
var _uacct=\"\";			// set up the Urchin Account
var _userv=1;			// service mode (0=local,1=remote,2=both)

//-- UTM User Settings
var _ufsc=1;			// set client info flag (1=on|0=off)
var _udn=\"auto\";		// (auto|none|domain) set the domain name for cookies
var _uhash=\"on\";		// (on|off) unique domain hash for cookies
var _utimeout=\"1800\";   	// set the inactive session timeout in seconds
var _ugifpath=\"/__utm.gif\";	// set the web path to the __utm.gif file
var _utsp=\"|\";			// transaction field separator
var _uflash=1;			// set flash version detect option (1=on|0=off)
var _utitle=1;			// set the document title detect option (1=on|0=off)
var _ulink=0;			// enable linker functionality (1=on|0=off)
var _uanchor=0;			// enable use of anchors for campaign (1=on|0=off)
var _utcp=\"/\";			// the cookie path for tracking
var _usample=100;		// The sampling % of visitors to track (1-100).

//-- UTM Campaign Tracking Settings
var _uctm=1;			// set campaign tracking module (1=on|0=off)
var _ucto=\"15768000\";		// set timeout in seconds (6 month default)
var _uccn=\"utm_campaign\";	// name
var _ucmd=\"utm_medium\";		// medium (cpc|cpm|link|email|organic)
var _ucsr=\"utm_source\";		// source
var _uctr=\"utm_term\";		// term/keyword
var _ucct=\"utm_content\";	// content
var _ucid=\"utm_id\";		// id number
var _ucno=\"utm_nooverride\";	// don't override

//-- Auto/Organic Sources and Keywords
var _uOsr=new Array();
var _uOkw=new Array();
_uOsr[0]=\"google\";	_uOkw[0]=\"q\";
_uOsr[1]=\"yahoo\";	_uOkw[1]=\"p\";
_uOsr[2]=\"msn\";		_uOkw[2]=\"q\";
_uOsr[3]=\"aol\";		_uOkw[3]=\"query\";
_uOsr[4]=\"aol\";		_uOkw[4]=\"encquery\";
_uOsr[5]=\"lycos\";	_uOkw[5]=\"query\";
_uOsr[6]=\"ask\";		_uOkw[6]=\"q\";
_uOsr[7]=\"altavista\";	_uOkw[7]=\"q\";
_uOsr[8]=\"netscape\";	_uOkw[8]=\"query\";
_uOsr[9]=\"cnn\";	_uOkw[9]=\"query\";
_uOsr[10]=\"looksmart\";	_uOkw[10]=\"qt\";
_uOsr[11]=\"about\";	_uOkw[11]=\"terms\";
_uOsr[12]=\"mamma\";	_uOkw[12]=\"query\";
_uOsr[13]=\"alltheweb\";	_uOkw[13]=\"q\";
_uOsr[14]=\"gigablast\";	_uOkw[14]=\"q\";
_uOsr[15]=\"voila\";	_uOkw[15]=\"rdata\";
_uOsr[16]=\"virgilio\";	_uOkw[16]=\"qs\";
_uOsr[17]=\"live\";	_uOkw[17]=\"q\";
_uOsr[18]=\"baidu\";	_uOkw[18]=\"wd\";
_uOsr[19]=\"alice\";	_uOkw[19]=\"qs\";
_uOsr[20]=\"yandex\";	_uOkw[20]=\"text\";
_uOsr[21]=\"najdi\";	_uOkw[21]=\"q\";
_uOsr[22]=\"aol\";	_uOkw[22]=\"q\";
_uOsr[23]=\"club-internet\"; _uOkw[23]=\"q\";
_uOsr[24]=\"mama\";	_uOkw[24]=\"query\";
_uOsr[25]=\"seznam\";	_uOkw[25]=\"q\";
_uOsr[26]=\"search\";	_uOkw[26]=\"q\";
_uOsr[27]=\"szukaj\";	_uOkw[27]=\"szukaj\";
_uOsr[28]=\"szukaj\";	_uOkw[28]=\"qt\";
_uOsr[29]=\"netsprint\";	_uOkw[29]=\"q\";
_uOsr[30]=\"google.interia\";	_uOkw[30]=\"q\";
_uOsr[31]=\"szukacz\";	_uOkw[31]=\"q\";
_uOsr[32]=\"yam\";	_uOkw[32]=\"k\";
_uOsr[33]=\"pchome\";	_uOkw[33]=\"q\";


//-- Auto/Organic Keywords to Ignore
var _uOno=new Array();
//_uOno[0]=\"urchin\";
//_uOno[1]=\"urchin.com\";
//_uOno[2]=\"www.urchin.com\";

//-- Referral domains to Ignore
var _uRno=new Array();
//_uRno[0]=\".urchin.com\";

//-- **** Don't modify below this point ***
var _uff,_udh,_udt,_ubl=0,_udo=\",_uu,_ufns=0,_uns=0,_ur=\"-\",_ufno=0,_ust=0,_ubd=document,_udl=_ubd.location,_udlh=\",_uwv=\"1\";
var _ugifpath2=\"http://www.google-analytics.com/__utm.gif\";
if (_udl.hash) _udlh=_udl.href.substring(_udl.href.indexOf('#'));
if (_udl.protocol==\"https:\") _ugifpath2=\"https://ssl.google-analytics.com/__utm.gif\";
if (!_utcp || _utcp==\") _utcp=\"/\";
function urchinTracker(page) {
 if (_udl.protocol==\"file:\") return;
 if (_uff && (!page || page==\")) return;
 var a,b,c,xx,v,z,k,x=\"\",s=\",f=0;
 var nx=\" expires=\"+_uNx()+\";\";
 var dc=_ubd.cookie;
 _udh=_uDomain();
 if (!_uVG()) return;
 _uu=Math.round(Math.random()*2147483647);
 _udt=new Date();
 _ust=Math.round(_udt.getTime()/1000);
 a=dc.indexOf(\"__utma=\"+_udh);
 b=dc.indexOf(\"__utmb=\"+_udh);
 c=dc.indexOf(\"__utmc=\"+_udh);
 if (_udn && _udn!=\"\") { _udo=\" domain=\"+_udn+\";\"; }
 if (_utimeout && _utimeout!=\"\") {
  x=new Date(_udt.getTime()+(_utimeout*1000));
  x=\" expires=\"+x.toGMTString()+\";\";
 }
 if (_ulink) {
  if (_uanchor && _udlh && _udlh!=\"\") s=_udlh+\"&\";
  s+=_udl.search;
  if(s && s!=\"\" && s.indexOf(\"__utma=\")>=0) {
   if (!(_uIN(a=_uGC(s,\"__utma=\",\"&\")))) a=\"-\";
   if (!(_uIN(b=_uGC(s,\"__utmb=\",\"&\")))) b=\"-\";
   if (!(_uIN(c=_uGC(s,\"__utmc=\",\"&\")))) c=\"-\";
   v=_uGC(s,\"__utmv=\",\"&\");
   z=_uGC(s,\"__utmz=\",\"&\");
   k=_uGC(s,\"__utmk=\",\"&\");
   xx=_uGC(s,\"__utmx=\",\"&\");
   if ((k*1) != ((_uHash(a+b+c+xx+z+v)*1)+(_udh*1))) {_ubl=1;a=\"-\";b=\"-\";c=\"-\";xx=\"-\";z=\"-\";v=\"-\";}
   if (a!=\"-\" && b!=\"-\" && c!=\"-\") f=1;
   else if(a!=\"-\") f=2;
  }
 }
 if(f==1) {
  _ubd.cookie=\"__utma=\"+a+\"; path=\"+_utcp+\";\"+nx+_udo;
  _ubd.cookie=\"__utmb=\"+b+\"; path=\"+_utcp+\";\"+x+_udo;
  _ubd.cookie=\"__utmc=\"+c+\"; path=\"+_utcp+\";\"+_udo;
 } else if (f==2) {
  a=_uFixA(s,\"&\",_ust);
  _ubd.cookie=\"__utma=\"+a+\"; path=\"+_utcp+\";\"+nx+_udo;
  _ubd.cookie=\"__utmb=\"+_udh+\"; path=\"+_utcp+\";\"+x+_udo;
  _ubd.cookie=\"__utmc=\"+_udh+\"; path=\"+_utcp+\";\"+_udo;
  _ufns=1;
 } else if (a>=0 && b>=0 && c>=0) {
  _ubd.cookie=\"__utmb=\"+_udh+\"; path=\"+_utcp+\";\"+x+_udo;
 } else {
  if (a>=0) a=_uFixA(_ubd.cookie,\";\",_ust);
  else a=_udh+\".\"+_uu+\".\"+_ust+\".\"+_ust+\".\"+_ust+\".1\";
  _ubd.cookie=\"__utma=\"+a+\"; path=\"+_utcp+\";\"+nx+_udo;
  _ubd.cookie=\"__utmb=\"+_udh+\"; path=\"+_utcp+\";\"+x+_udo;
  _ubd.cookie=\"__utmc=\"+_udh+\"; path=\"+_utcp+\";\"+_udo;
  _ufns=1;
 }
 if (_ulink && xx && xx!=\"\" && xx!=\"-\") {
   xx=_uUES(xx);
   if (xx.indexOf(\";\")==-1) _ubd.cookie=\"__utmx=\"+xx+\"; path=\"+_utcp+\";\"+nx+_udo;
 }
 if (_ulink && v && v!=\"\" && v!=\"-\") {
  v=_uUES(v);
  if (v.indexOf(\";\")==-1) _ubd.cookie=\"__utmv=\"+v+\"; path=\"+_utcp+\";\"+nx+_udo;
 }
 _uInfo(page);
 _ufns=0;
 _ufno=0;
 if (!page || page==\") _uff=1;
}</script>\r\n";

print "D1D\r\n";
print "<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\">
<head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />
        <meta name=\"description\" content=\"HTTrack is an easy-to-use website mirror utility. It allows you to download a World Wide website from the Internet to a local directory,building recursively all structures, getting html, images, and other files from the server to your computer. Links are rebuiltrelatively so that you can freely browse to the local site (works with any browser). You can mirror several sites together so that you can jump from one toanother. You can, also, update an existing mirror site, or resume an interrupted download. The robot is fully configurable, with an integrated help\" />
        <meta name=\"keywords\" content=\"httrack, HTTRACK, HTTrack, winhttrack, WINHTTRACK, WinHTTrack, offline browser, web mirror utility, aspirateur web, surf offline, web capture, www mirror utility, browse offline, local  site builder, website mirroring, aspirateur www, internet grabber, capture de site web, internet tool, hors connexion, unix, dos, windows 95, windows 98, solaris, ibm580, AIX 4.0, HTS, HTGet, web aspirator, web aspirateur, libre, GPL, GNU, free software\" />
        <title>List of available projects - HTTrack Website Copier</title>
        <!-- Mirror and index made by HTTrack Website Copier/3.42-2 [XR&CO'2007] -->

        <style type=\"text/css\">


body {
        margin: 0;  padding: 0;  margin-bottom: 15px;  margin-top: 8px;
        background: #77b;
}
body, td {
        font: 14px \"Trebuchet MS\", Verdana, Arial, Helvetica, sans-serif;
        }

#subTitle {
        background: #000;  color: #fff;  padding: 4px;  font-weight: bold;
        }

#siteNavigation a, #siteNavigation .current {
        font-weight: bold;  color: #448;
        }
#siteNavigation a:link    { text-decoration: none; }
#siteNavigation a:visited { text-decoration: none; }

#siteNavigation .current { background-color: #ccd; }

#siteNavigation a:hover   { text-decoration: none;  background-color: #fff;  color: #000; }
#siteNavigation a:active  { text-decoration: none;  background-color: #ccc; }


a:link    { text-decoration: underline;  color: #00f; }
a:visited { text-decoration: underline;  color: #000; }
a:hover   { text-decoration: underline;  color: #c00; }
a:active  { text-decoration: underline; }

#pageContent {
        clear: both;
        border-bottom: 6px solid #000;
        padding: 10px;  padding-top: 20px;
        line-height: 1.65em;
        background-image: url(backblue.gif);
        background-repeat: no-repeat;
        background-position: top right;
        }

#pageContent, #siteNavigation {
        background-color: #ccd;
        }


.imgLeft  { float: left;   margin-right: 10px;  margin-bottom: 10px; }
.imgRight { float: right;  margin-left: 10px;   margin-bottom: 10px; }

hr { height: 1px;  color: #000;  background-color: #000;  margin-bottom: 15px; }

h1 { margin: 0;  font-weight: bold;  font-size: 2em; }
h2 { margin: 0;  font-weight: bold;  font-size: 1.6em; }
h3 { margin: 0;  font-weight: bold;  font-size: 1.3em; }
h4 { margin: 0;  font-weight: bold;  font-size: 1.18em; }

.blak { background-color: #000; }
.hide { display: none; }
.tableWidth { min-width: 400px; }

.tblRegular       { border-collapse: collapse; }
.tblRegular td    { padding: 6px;  background-image: url(fade.gif);  border: 2px solid #99c; }
.tblHeaderColor, .tblHeaderColor td { background: #99c; }
.tblNoBorder td   { border: 0; }


</style>\r\n";

print "679\r\n";
print "</head>

<body>
<table width=\"76%\" border=\"0\" align=\"center\" cellspacing=\"0\" cellpadding=\"3\" class=\"tableWidth\">
        <tr>
        <td id=\"subTitle\">HTTrack Website Copier - Open Source offline browser</td>
        </tr>
</table>
<table width=\"76%\" border=\"0\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\" class=\"tableWidth\">
<tr class=\"blak\">
<td>
        <table width=\"100%\" border=\"0\" align=\"center\" cellspacing=\"1\" cellpadding=\"0\">
        <tr>
        <td colspan=\"6\">
                <table width=\"100%\" border=\"0\" align=\"center\" cellspacing=\"0\" cellpadding=\"10\">
                <tr>
                <td id=\"pageContent\">
<!-- ==================== End prologue ==================== -->


<h1 ALIGN=Center>Index of locally available projects:</H1>
  <table border=\"0\" width=\"100%\" cellspacing=\"1\" cellpadding=\"0\">
                <TH>
                <BR/>
                        web
                </TH>
                <TR>
                  <TD BACKGROUND=\"fade.gif\">
                    &middot; <A HREF=\"zon/index.html\">zon</A>
                  </TD>
                </TR>
                <TR>
                  <TD BACKGROUND=\"fade.gif\">
                    &middot; <A HREF=\"zon-real/index.html\">zon-real</A>
                  </TD>
                </TR>
        </TABLE>
        <BR>
        <H6 ALIGN=\"RIGHT\">
         <I>Mirror and index made by HTTrack Website Copier [XR&CO'2002]</I>
        </H6>
        <!-- Mirror and index made by HTTrack Website Copier/3.42-2 [XR&CO'2007] -->
        <!-- Thanks for using HTTrack Website Copier! -->

<!-- ==================== Start epilogue ==================== -->
                </td>
                </tr>
                </table>
        </td>
        </tr>
        </table>
</td>
</tr>
</table>

<table width=\"76%\" border=\"0\" align=\"center\" valign=\"bottom\" cellspacing=\"0\" cellpadding=\"0\">
        <tr>
        <td id=\"footer\"><small>&copy; 2002 Xavier Roche & other contributors - Web Design: Leto Kauler.</small></td>
        </tr>
</table>

</body>

</html>\r\n";
print "0\r\n\r\n";

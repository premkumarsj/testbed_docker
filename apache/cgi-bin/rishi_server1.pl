#!/usr/bin/perl

####################
# XML Server Script
####################
$i = 0;

$buffer = $ENV{'QUERY_STRING'};
@pair = split(/=/,$buffer);
$id = $pair[1];
$rand = int(rand(1000)+1000);
$rand="";

$rand = $rand.chr(int(rand(10)+48)).chr(int(rand(10)+48)).chr(int(rand(26)+65)).chr(int(rand(26)+65)).chr(int(rand(26)+97)).chr(int(rand(26)+97));
#print "HTTP/1.1 200\r\n";
print "Content-Length: 11574\r\n";
print "Content-Type: text/html\r\n";
print "\r\n";
print <<EOF;
<html>
<form method="post">
<input type="hidden" name="a0" value="100$id$rand" />
<input type="hidden" name="a1" value="101$id$rand" />
<input type="hidden" name="a2" value="102$id$rand" />
<input type="hidden" name="a3" value="103$id$rand" />
<input type="hidden" name="a4" value="104$id$rand" />
<input type="hidden" name="a5" value="105$id$rand" />
<input type="hidden" name="a6" value="106$id$rand" />
<input type="hidden" name="a7" value="107$id$rand" />
<input type="hidden" name="a8" value="108$id$rand" />
<input type="hidden" name="a9" value="109$id$rand" />
<input type="hidden" name="a10" value="110$id$rand" />
<input type="hidden" name="a11" value="111$id$rand" />
<input type="hidden" name="a12" value="112$id$rand" />
<input type="hidden" name="a13" value="113$id$rand" />
<input type="hidden" name="a14" value="114$id$rand" />
<input type="hidden" name="a15" value="115$id$rand" />
<input type="hidden" name="a16" value="116$id$rand" />
<input type="hidden" name="a17" value="117$id$rand" />
<input type="hidden" name="a18" value="118$id$rand" />
<input type="hidden" name="a19" value="119$id$rand" />
<input type="hidden" name="a20" value="120$id$rand" />
<input type="hidden" name="a21" value="121$id$rand" />
<input type="hidden" name="a22" value="122$id$rand" />
<input type="hidden" name="a23" value="123$id$rand" />
<input type="hidden" name="a24" value="124$id$rand" />
<input type="hidden" name="a25" value="125$id$rand" />
<input type="hidden" name="a26" value="126$id$rand" />
<input type="hidden" name="a27" value="127$id$rand" />
<input type="hidden" name="a28" value="128$id$rand" />
<input type="hidden" name="a29" value="129$id$rand" />
<input type="hidden" name="a30" value="130$id$rand" />
<input type="hidden" name="a31" value="131$id$rand" />
<input type="hidden" name="a32" value="132$id$rand" />
<input type="hidden" name="a33" value="133$id$rand" />
<input type="hidden" name="a34" value="134$id$rand" />
<input type="hidden" name="a35" value="135$id$rand" />
<input type="hidden" name="a36" value="136$id$rand" />
<input type="hidden" name="a37" value="137$id$rand" />
<input type="hidden" name="a38" value="138$id$rand" />
<input type="hidden" name="a39" value="139$id$rand" />
<input type="hidden" name="a40" value="140$id$rand" />
<input type="hidden" name="a41" value="141$id$rand" />
<input type="hidden" name="a42" value="142$id$rand" />
<input type="hidden" name="a43" value="143$id$rand" />
<input type="hidden" name="a44" value="144$id$rand" />
<input type="hidden" name="a45" value="145$id$rand" />
<input type="hidden" name="a46" value="146$id$rand" />
<input type="hidden" name="a47" value="147$id$rand" />
<input type="hidden" name="a48" value="148$id$rand" />
<input type="hidden" name="a49" value="149$id$rand" />
<input type="hidden" name="a50" value="150$id$rand" />
<input type="hidden" name="a51" value="151$id$rand" />
<input type="hidden" name="a52" value="152$id$rand" />
<input type="hidden" name="a53" value="153$id$rand" />
<input type="hidden" name="a54" value="154$id$rand" />
<input type="hidden" name="a55" value="155$id$rand" />
<input type="hidden" name="a56" value="156$id$rand" />
<input type="hidden" name="a57" value="157$id$rand" />
<input type="hidden" name="a58" value="158$id$rand" />
<input type="hidden" name="a59" value="159$id$rand" />
<input type="hidden" name="a60" value="160$id$rand" />
<input type="hidden" name="a61" value="161$id$rand" />
<input type="hidden" name="a62" value="162$id$rand" />
<input type="hidden" name="a63" value="163$id$rand" />
<input type="hidden" name="a64" value="164$id$rand" />
<input type="hidden" name="a65" value="165$id$rand" />
<input type="hidden" name="a66" value="166$id$rand" />
<input type="hidden" name="a67" value="167$id$rand" />
<input type="hidden" name="a68" value="168$id$rand" />
<input type="hidden" name="a69" value="169$id$rand" />
<input type="hidden" name="a70" value="170$id$rand" />
<input type="hidden" name="a71" value="171$id$rand" />
<input type="hidden" name="a72" value="172$id$rand" />
<input type="hidden" name="a73" value="173$id$rand" />
<input type="hidden" name="a74" value="174$id$rand" />
<input type="hidden" name="a75" value="175$id$rand" />
<input type="hidden" name="a76" value="176$id$rand" />
<input type="hidden" name="a77" value="177$id$rand" />
<input type="hidden" name="a78" value="178$id$rand" />
<input type="hidden" name="a79" value="179$id$rand" />
<input type="hidden" name="a80" value="180$id$rand" />
<input type="hidden" name="a81" value="181$id$rand" />
<input type="hidden" name="a82" value="182$id$rand" />
<input type="hidden" name="a83" value="183$id$rand" />
<input type="hidden" name="a84" value="184$id$rand" />
<input type="hidden" name="a85" value="185$id$rand" />
<input type="hidden" name="a86" value="186$id$rand" />
<input type="hidden" name="a87" value="187$id$rand" />
<input type="hidden" name="a88" value="188$id$rand" />
<input type="hidden" name="a89" value="189$id$rand" />
<input type="hidden" name="a90" value="190$id$rand" />
<input type="hidden" name="a91" value="191$id$rand" />
<input type="hidden" name="a92" value="192$id$rand" />
<input type="hidden" name="a93" value="193$id$rand" />
<input type="hidden" name="a94" value="194$id$rand" />
<input type="hidden" name="a95" value="195$id$rand" />
<input type="hidden" name="a96" value="196$id$rand" />
<input type="hidden" name="a97" value="197$id$rand" />
<input type="hidden" name="a98" value="198$id$rand" />
<input type="hidden" name="a99" value="199$id$rand" />
<input type="hidden" name="a100" value="200$id$rand" />
<input type="hidden" name="a101" value="201$id$rand" />
<input type="hidden" name="a102" value="202$id$rand" />
<input type="hidden" name="a103" value="203$id$rand" />
<input type="hidden" name="a104" value="204$id$rand" />
<input type="hidden" name="a105" value="205$id$rand" />
<input type="hidden" name="a106" value="206$id$rand" />
<input type="hidden" name="a107" value="207$id$rand" />
<input type="hidden" name="a108" value="208$id$rand" />
<input type="hidden" name="a109" value="209$id$rand" />
<input type="hidden" name="a110" value="210$id$rand" />
<input type="hidden" name="a111" value="211$id$rand" />
<input type="hidden" name="a112" value="212$id$rand" />
<input type="hidden" name="a113" value="213$id$rand" />
<input type="hidden" name="a114" value="214$id$rand" />
<input type="hidden" name="a115" value="215$id$rand" />
<input type="hidden" name="a116" value="216$id$rand" />
<input type="hidden" name="a117" value="217$id$rand" />
<input type="hidden" name="a118" value="218$id$rand" />
<input type="hidden" name="a119" value="219$id$rand" />
<input type="hidden" name="a120" value="220$id$rand" />
<input type="hidden" name="a121" value="221$id$rand" />
<input type="hidden" name="a122" value="222$id$rand" />
<input type="hidden" name="a123" value="223$id$rand" />
<input type="hidden" name="a124" value="224$id$rand" />
<input type="hidden" name="a125" value="225$id$rand" />
<input type="hidden" name="a126" value="226$id$rand" />
<input type="hidden" name="a127" value="227$id$rand" />
<input type="hidden" name="a128" value="228$id$rand" />
<input type="hidden" name="a129" value="229$id$rand" />
<input type="hidden" name="a130" value="230$id$rand" />
<input type="hidden" name="a131" value="231$id$rand" />
<input type="hidden" name="a132" value="232$id$rand" />
<input type="hidden" name="a133" value="233$id$rand" />
<input type="hidden" name="a134" value="234$id$rand" />
<input type="hidden" name="a135" value="235$id$rand" />
<input type="hidden" name="a136" value="236$id$rand" />
<input type="hidden" name="a137" value="237$id$rand" />
<input type="hidden" name="a138" value="238$id$rand" />
<input type="hidden" name="a139" value="239$id$rand" />
<input type="hidden" name="a140" value="240$id$rand" />
<input type="hidden" name="a141" value="241$id$rand" />
<input type="hidden" name="a142" value="242$id$rand" />
<input type="hidden" name="a143" value="243$id$rand" />
<input type="hidden" name="a144" value="244$id$rand" />
<input type="hidden" name="a145" value="245$id$rand" />
<input type="hidden" name="a146" value="246$id$rand" />
<input type="hidden" name="a147" value="247$id$rand" />
<input type="hidden" name="a148" value="248$id$rand" />
<input type="hidden" name="a149" value="249$id$rand" />
<input type="hidden" name="a150" value="250$id$rand" />
<input type="hidden" name="a151" value="251$id$rand" />
<input type="hidden" name="a152" value="252$id$rand" />
<input type="hidden" name="a153" value="253$id$rand" />
<input type="hidden" name="a154" value="254$id$rand" />
<input type="hidden" name="a155" value="255$id$rand" />
<input type="hidden" name="a156" value="256$id$rand" />
<input type="hidden" name="a157" value="257$id$rand" />
<input type="hidden" name="a158" value="258$id$rand" />
<input type="hidden" name="a159" value="259$id$rand" />
<input type="hidden" name="a160" value="260$id$rand" />
<input type="hidden" name="a161" value="261$id$rand" />
<input type="hidden" name="a162" value="262$id$rand" />
<input type="hidden" name="a163" value="263$id$rand" />
<input type="hidden" name="a164" value="264$id$rand" />
<input type="hidden" name="a165" value="265$id$rand" />
<input type="hidden" name="a166" value="266$id$rand" />
<input type="hidden" name="a167" value="267$id$rand" />
<input type="hidden" name="a168" value="268$id$rand" />
<input type="hidden" name="a169" value="269$id$rand" />
<input type="hidden" name="a170" value="270$id$rand" />
<input type="hidden" name="a171" value="271$id$rand" />
<input type="hidden" name="a172" value="272$id$rand" />
<input type="hidden" name="a173" value="273$id$rand" />
<input type="hidden" name="a174" value="274$id$rand" />
<input type="hidden" name="a175" value="275$id$rand" />
<input type="hidden" name="a176" value="276$id$rand" />
<input type="hidden" name="a177" value="277$id$rand" />
<input type="hidden" name="a178" value="278$id$rand" />
<input type="hidden" name="a179" value="279$id$rand" />
<input type="hidden" name="a180" value="280$id$rand" />
<input type="hidden" name="a181" value="281$id$rand" />
<input type="hidden" name="a182" value="282$id$rand" />
<input type="hidden" name="a183" value="283$id$rand" />
<input type="hidden" name="a184" value="284$id$rand" />
<input type="hidden" name="a185" value="285$id$rand" />
<input type="hidden" name="a186" value="286$id$rand" />
<input type="hidden" name="a187" value="287$id$rand" />
<input type="hidden" name="a188" value="288$id$rand" />
<input type="hidden" name="a189" value="289$id$rand" />
<input type="hidden" name="a190" value="290$id$rand" />
<input type="hidden" name="a191" value="291$id$rand" />
<input type="hidden" name="a192" value="292$id$rand" />
<input type="hidden" name="a193" value="293$id$rand" />
<input type="hidden" name="a194" value="294$id$rand" />
<input type="hidden" name="a195" value="295$id$rand" />
<input type="hidden" name="a196" value="296$id$rand" />
<input type="hidden" name="a197" value="297$id$rand" />
<input type="hidden" name="a198" value="298$id$rand" />
<input type="hidden" name="a199" value="299$id$rand" />
<input type="submit" value="Submit" />

</form>
</html>
EOF

#!/usr/bin/perl -w
use Switch;

my %queryString = ();
my $tmpStr = $ENV{"QUERY_STRING"};
my @parts = split(/\&/, $tmpStr);
my $raw = 0;

foreach $part (@parts) {
    ($name, $value) = split(/\=/, $part);
    $queryString{"$name"} = $value;
}
if ($queryString{"raw"}) {
    $raw = 1;
    print "HTTP/1.1 302 Moved Temporarily\r\n";
    print "Location: /testsite/file5.html\r\n";
    print "Content-Type: text/html\r\n";
    print "charset: UTF-8\r\n";
    print "Server: Apache\r\n";
}
if ($raw == 0) {
    print "HTTP/1.1 200 OK\r\n";
    print "Content-Type: text/html\r\n";
    print "charset: UTF-8\r\n";
    print "Server: Apache\r\n";
}
if ($queryString{"script"} eq "replacehttp_response") {
    switch ($queryString{"case"}) {
        case 1 {
            print "Content-Length: 5\r\n";
            print "\r\nabcde\r\n";
        }
        case 3 {
            print "Transfer-encoding: chunked\r\n\r\n";
            print "23\r\n";

            print "This is the data in the first chunk\r\n";
            sleep(1);
	   print "1B\r\n";
		print "Data in the second chunk it\r\n";
		sleep(1);
            print "0\r\n\r\n";
        }
	case 4{
		print "Transfer-encoding: chunked\r\n\r\n";
		print "7A8\r\n";
		print "<html OT='SiebWebMainWindow'><head><title>Partner Management System</title><script for=\"window\" event=\"onload\" language=\"javascript\">HideWait();OnAppReady();</script><script language=\"javascript\">var winWait = null;function ShowWait(){winWait = window.showModelessDialog(\"wait.html\", null, \"dialogHeight:127px;dialogWidth:266px;center:yes;help:no;resizable:no;scroll:no;status:no\");}function HideWait(){winWait.close();}ShowWait();</script></head><LINK REL='stylesheet' TYPE='text/css' HREF='files/jctrls.css' /><script language=\"javascript\">top._swescript = window;</script><script language=\"javascript\" src=\"19255/scripts/rtcEditor.js\"></script><script language=\"javascript\" src=\"19255/scripts/swecommon_top.js\"></script><script language=\"javascript\" src=\"19255/scripts/swecommon.js\"></script><script language=\"javascript\" src=\"19255/scripts/navctrl.js\"></script><script language=\"javascript\" src=\"19255/scripts/sweutil_keyboard.js\"></script><script language=\"javascript\" src=\"19255/scripts/swecmn_hi_top.js\"></script><script language=\"javascript\" src=\"19255/scripts/objbase.js\"></script><script language=\"javascript\" src=\"19255/scripts/appearance.js\"></script><script language=\"javascript\" src=\"19255/scripts/busobjshadow.js\"></script><script language=\"javascript\" src=\"19255/scripts/buscompshadow.js\"></script><script language=\"javascript\" src=\"19255/scripts/appletshadow.js\"></script><script language=\"javascript\" src=\"19255/scripts/toolbar.js\"></script><script language=\"javascript\" src=\"19255/scripts/serviceshadow.js\"></script><script language=\"javascript\" src=\"19255/scripts/alarm.js\"></script><script language=\"javascript\" src=\"19255/scripts/applicationshadow.js\"></script><script language=\"javascript\" src=\"19255/scripts/trainingQueue.js\"></script><a id=\"jsIncludes\"></a><script for=window event=onstop>SetBusy(false);</script><script>this.ConfirmDeleteMessage ='Are you sure you want to delete this record?'</script><script> this.focus(); </script>\r\n";
		sleep(1);
		
		print "786\r\n";
		print "<script>//<!--var cmdMap = new Array();cmdMap[cmdMap.length] = { Key:\"110221\", Method:\"NextApplet\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"110219\", Method:\"PrevApplet\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"11086\", Method:\"ViewList\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"110187\", Method:\"NextFrame\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"011187\", Method:\"NextFrame\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"110189\", Method:\"PrevFrame\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"011189\", Method:\"PrevFrame\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"11077\", Method:\"GotoAppletMenu\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"11071\", Method:\"GotoAppletMenu\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"01177\", Method:\"GotoApplicationMenu\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"11084\", Method:\"GotoScrnTab\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"01184\", Method:\"GotoViewTab\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"100113\", Method:\"GotoCTIToolBar\", Applet:\"\", Service:\"\", Argument:\"\"};cmdMap[cmdMap.length] = { Key:\"100114\", Method:\"GotoMessageBar\", Applet:\"\", Service:\"\", Argument:\"\"};//--></script><frameset id=frset1 rows='100%,0%' border='0' frameborder='No' onload='if (navigator.userAgent.toUpperCase().match(/MAC/)){frset1.rows=\"*,0\"}'><frame name=\"_sweclient\" src=\"javascript:'<!--1389531469-->'\" marginheight='0' marginwidth='0' noresize scrolling='No'><frame name=\"_swe\" title=\"\" src=\"http://prmdr.tatasky.com:8000/echannelcme_enu/start.swe?SWECmd=GetCachedFrame&SWEACn=27339&SWEC=15&SWEFrame=top._swe\" marginheight='0' marginwidth='0' noresize scrolling='No' tabindex=-1></frameset></html>\r\n";
		sleep(1);
		
		print "0\r\n\r\n";
	}
        case 5 {
            print "Transfer-encoding: chunked\r\n\r\n";
            print "23\r\n";

            print "This is the data in the first chunk\r\n";
            sleep(1);

            print "1A\r\n";

            print "and this is the second one\r\n";
            sleep(1);

            print "3\r\n";

            print "con\r\n";
            sleep(1);
            print "8\r\n";

            print "sequence\r\n";
            sleep(1);
            print "0\r\n\r\n";

        }
        case 6 {
            print "Transfer-encoding: chunked\r\n\r\n";
            print "23\r\n";

            print "This is the data in the first chunk\r\n";
            sleep(1);

            print "1A\r\n";

            print "and this is the second one\r\n";
            sleep(1);

            print "3\r\n";

            print "con\r\n";
            sleep(1);
            print "8\r\n";

            print "sequence\r\n";
            sleep(1);
            print "0\r\n\r\n";
        }
        case 7 {
            print "Content-Length: 1073741824\r\n\r\n";
            for (1..1073741824) {
                print "a";
            }
	}
	case 70 {
                print "\r\n\r\ntestsomething";
        }
        case 8 {
            print "Content-Length: 5\r\n";
            print "\r\nabcde";
        }
        case 9 {
            print "Transfer-encoding: chunked\r\n\r\n";
            print "23\r\n";

            print "This is the data in the first chunk\r\n";
            sleep(1);

            print "0\r\n\r\n";

        }
        case 10 {
            print "Content-Length: 5\r\n\r\n";
            print "sdsadddk";
        }
        case 11 {
            print "Content-Length: 50\r\n";
            print "\r\nsdsadddk";
        }
        case 12 {
            print "\r\nsdsadddk\r\n";
        }
        case 13 {
            print "\r\nsdsadddk\r\n";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}
if ($queryString{"script"} eq "bodyrewrite_response") {
    switch ($queryString{"case"}) {
        case 1 {
            print "Content-Length: 5\r\n";
            print "\r\nAbcde";
        }
        case 3 {
            print "Transfer-encoding: chunked\r\n\r\n";
            print "23\r\n";

            print "This is the data in the first chunk\r\n";
            sleep(1);

            print "0\r\n\r\n";
        }
        case 4 {
            print "HTTP/1.1 200 OK";
            print "\r\n\r\nAAAA";
        }
        case 5 {
            print "\r\n\r\nAAAA";
        }
        case 6 {
            print "HTTP/1.1 200 OK\r\n";
        }
        case 8 {
            print "Content-Length: 30\r\n";
            print "\r\nABCD";
        }
        case 9 {
            print "Content-Length: 5\r\n";
            print "\r\nABCDEFGHIJKLM\r\n";
        }
        case 11 {
            print "Content-Length: 25\r\n";
            print "\r\nJLEwxABCDEFGHIJKLMJLEwxby";
        }
        case 13 {
            print "Content-Length: 255\r\n\r\n";
            for (1..255) {
                print "A";
            }
        }
        case 14 {
            print "Content-Length: 12\r\n\r\n";
            print "ZAAAAAAZTest";
        }
        case 15 {
            print "Content-Length: 9\r\n\r\n";
            print "AAAAATest";
        }
        case 16 {
            print "Content-Length: 9\r\n\r\n";
            print "TestAAAAA";
        }
        case 17 {
            print "Content-Length: 10\r\n\r\n";
            print "TestAAAA";
        }
        case 19 {
            print "Content-Length: 8\r\n\r\n";
            print "AAAAATest";
        }
        case 20 {
            print "Content-Length: 7\r\n\r\n";
            print "XAAAAAZ";
        }
        case 21 {
            print "Content-Length: 2\r\n\r\n";
            print "XZ";
        }
        case 23 {
            print "Content-Length: 3\r\n\r\n";
            print "XYZ";
        }
        case 26 {
            print "Content-Length: 11\r\n\r\n";
            print "XYYYYYZ A Z";
        }
        case 27 {
            print "Content-Length: 10\r\n\r\n";
            print "AAAAAAAAAA";
        }
        case 28 {
            print "Content-Length: 10\r\n\r\n";
            print "AAAAAAAAAAA";
        }
        case 29 {
            print "Content-Length: 6\r\n\r\n";
            print "ATestZ";
        }
        case 30 {
            print "Content-Length: 6\r\n\r\n";
            print "ATest";
        }
        case 33 {
            print "Content-Length: 20\r\n\r\n";
            for (1..20) {
                print "A";
            }
        }
        case 34 {
            print "Content-Length: 20\r\n\r\n";
            for (1..2) {
                print "abcdef12AA";
            }
        }
        case 39 {
            print "Content-Length: 1048576\r\n\r\n";
            for (1..1048576) {
                print "Z";
            }
        }
        case 40 {
            print "Content-Length: 1048580\r\n\r\n";
            for (1..1048580) {
                print "k";
            }
        }
        case 41 {
            print "Content-Length: 1073741924\r\n\r\n";
            for (1..1073741924) {
                print "Z";
            }
	}
	case 42 {
	    print "Content-Length: 65\r\n\r\n";
            print "<html><head><title>Hello World</title></head><body></body></html>";
	 }
	case 43 {
	    print "Content-Length: 75\r\n\r\n";
	    print "{ \"Book\":{ \"author\":{ \"person\":{\"name\":'Dummy_name' } }, \"title\":'Dummy_title' } }";
	}
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}
if ($queryString{"script"} eq "replace_all") {
    switch ($queryString{"case"}) {
        case 1 {
            print "Content-Length: 100\r\n\r\n";
            for (1..25) {
                print "abcd";
            }
        }
        case 4 {
            print "Content-Length: 100\r\n\r\n";
            for (1..25) {
                print "aamm";
            } }
        case 5 {
            print "Content-Length: 100\r\n\r\n";
            print "abcd";
            for (1..24) {
                print "cool";
            } }
        case 6 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "abcd";
        }
        case 7 {
            print "Content-Length: 100\r\n\r\n";
            print "abch";
            for (1..24) {
                print "cool";
            } }
        case 8 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "habc";
        }
        case 11 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "abcd";
            } }
        case 13 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "aaaa";
            } }
        case 15 {
            print "Content-Length: 1073741824\r\n\r\n";
            for (1..268435456) {
                print "abcd";
            } }
        case 16 {
            print "Content-Length: 80\r\n\r\n";
            for (1..20) {
                print "abcd";
            } }
        case 17 {
            print "Content-Length: 200\r\n\r\n";
            for (1..50) {
                print "abcd";
            } }
        case 18 {
            print "Content-Length: 100\r\n\r\n";
            for (1..50) {
                print "aa";
            } }
        case 19 {
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 20 {
            print "Test: wrong\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 21 {
            print "Test: abcd\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 22 {
            print "Test: 123abcd123test\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 23 {
            print "Test: abcdabcd\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 24 {
            print "Test: ";
            for (1..250) {
                print "adcb";
            } print "\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 25 {
            print "Test: abcd\r\n";
            print "Test: dcba\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 26 {
            print "Test: dcba\r\n";
            print "Test: abcd\r\n";
            print "Content-Length: 1\r\n\r\n";
            print "1";
        }
        case 27 {
            print "Test: abcd\r\n";
            print "Content-Length: 2\r\n\r\n";
            print "1";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "insertbefore_all")
{
    switch ($queryString{"case"}) {

        case 1 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "abcd123456";
            } }
        case 4 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "aacd123456";
            } }
        case 5 {
            print "Content-Length: 100\r\n\r\n";
            print "abcd";
            for (1..24) {
                print "cool";
            } }
        case 6 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "abcd";
        }
        case 7 {
            print "Content-Length: 100\r\n\r\n";
            print "abch";
            for (1..24) {
                print "cool";
            } }
        case 8 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "habc";
        }
        case 11 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..6400) {
                print "abcd1234";
            } }
        case 12 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "abcd";
            } }
        case 13 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "aaaa";
            } }
        case 15 {
            print "Content-Length: 1073741824\r\n\r\n";
            for (1..268435456) {
                print "abcd";
            } }
        case 16 {
            print "Content-Length: 90\r\n\r\n";
            for (1..9) {
                print "abcd123456";
            } }
        case 17 {
            print "Content-Length: 101\r\n\r\n";
            for (1..10) {
                print "abcd123456";
            } print "6";
        }
        case 18 {
            print "Content-Length: 100\r\n\r\n";
            for (1..50) {
                print "aa";
            } }
        case 19 {
            print "Content-Length: 2\r\n\r\n";
            print "11";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "insertafter_all")
{
    switch ($queryString{"case"}) {

        case 1 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "abcd123456";
            } }
        case 4 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "aacd123456";
            } }
        case 5 {
            print "Content-Length: 100\r\n\r\n";
            print "abcd";
            for (1..24) {
                print "cool";
            } }
        case 6 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "abcd";
        }
        case 7 {
            print "Content-Length: 100\r\n\r\n";
            print "abch";
            for (1..24) {
                print "cool";
            } }
        case 8 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "habc";
        }
        case 11 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..6400) {
                print "abcd1234";
            } }
        case 12 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "abcd";
            } }
        case 13 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "aaaa";
            } }
        case 15 {
            print "Content-Length: 1073741824\r\n\r\n";
            for (1..268435456) {
                print "abcd";
            } }
        case 16 {
            print "Content-Length: 90\r\n\r\n";
            for (1..9) {
                print "abcd123456";
            } }
        case 17 {
            print "Content-Length: 101\r\n\r\n";
            for (1..10) {
                print "abcd123456";
            } print "6";
        }
        case 18 {
            print "Content-Length: 100\r\n\r\n";
            for (1..50) {
                print "aa";
            } }
        case 19 {
            print "Content-Length: 2\r\n\r\n";
            print "11";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "delete_all")
{
    switch ($queryString{"case"}) {

        case 1 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "abcd123456";
            } }
        case 2 {
            print "Content-Length: 100\r\n\r\n";
            for (1..10) {
                print "aacd123456";
            } }
        case 3 {
            print "Content-Length: 100\r\n\r\n";
            print "abcd";
            for (1..24) {
                print "cool";
            } }
        case 4 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "abcd";
        }
        case 5 {
            print "Content-Length: 100\r\n\r\n";
            print "abch";
            for (1..24) {
                print "cool";
            } }
        case 6 {
            print "Content-Length: 100\r\n\r\n";
            for (1..24) {
                print "cool";
            } print "habc";
        }
        case 7 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "abcd";
            } }
	case 8 {
            print "Content-Length: 102400\r\n\r\n";
            for (1..25600) {
                print "aaaa";
            } }
        case 10 {
            print "Content-Length: 1073741824\r\n\r\n";
            for (1..268435456) {
                print "abcd";
            } }
        case 11 {
            print "Content-Length: 90\r\n\r\n";
            for (1..9) {
                print "abcd123456";
            } }
        case 12 {
            print "Content-Length: 110\r\n\r\n";
            for (1..11) {
                print "abcd123456";
            } }
        case 13 {
            print "Content-Length: 100\r\n\r\n";
            for (1..50) {
                print "aa";
            } }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "strip_chars")
{
    switch ($queryString{"case"}) {
         
        case 15 {
            print "Content-Length: 100\r\n\r\n";
            print '123%%^^^@@@/S//@/T@zzzz%%%zzzyyyyyyR@/I@/P/^^^^_...C1.23@/H//A@/R/S_zWyOz123@/R.K.S//1/2//!/!zy@/!..';
        }
        case 16 {
            print "Content-Length: 100\r\n\r\n";
            print 'xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxzSTRIP_START_CHARS_WORKS!!!';
        }
        case 17 {
            print "Content-Length: 100\r\n\r\n";
            print 'STRIP_END_CHARS_WORKS!!!xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxz';
        }
        case 18 {
            print "Content-Length: 100\r\n\r\n";
            print ' STRIP_START_WS_WORKS!!!';
        }
        case 19 {
            print "Content-Length: 100\r\n\r\n";
            print 'STRIP_END_WS_WORKS!!! ';
        }
        case 25 {
            print "Content-Length: 100\r\n";
            print 'Test: 123%%^^^@@@/S//@/T@zzzz%%%zzzyyyyyyR@/I@/P/^^^^_...C1.23@/H//A@/R/S_zWyOz123@/R.K.S//1/2//!/!zy@/!..';
            print "\r\n\r\n";
            print '123%%^^^@@@/S//@/T@zzzz%%%zzzyyyyyyR@/I@/P/^^^^_...C1.23@/H//A@/R/S_zWyOz123@/R.K.S//1/2//!/!zy@/!..';
        }
        case 26 {
            print "Content-Length: 100\r\n";
            print 'Test: xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxzSTRIP_START_CHARS_WORKS!!!';
            print "\r\n\r\n";
            print 'xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxzSTRIP_START_CHARS_WORKS!!!';
        }
        case 27 {
            print "Content-Length: 100\r\n";
            print 'Test: STRIP_END_CHARS_WORKS!!!xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxz';
            print "\r\n\r\n";
            print 'STRIP_END_CHARS_WORKS!!!xyxyxyxyzz/@zy^123%.zzzz^^^^^yxz@@@xyzxzxzxz////xzzxzzyzx%%zz...zxzxzxzzxz';
        }
        case 28 {
            print "Content-Length: 100\r\n";
            print 'Test:STRIP_START_WS_WORKS!!!';
            print "\r\n\r\n";
            print ' STRIP_START_WS_WORKS!!!';
        }
        case 29 {
            print "Content-Length: 100\r\n";
            print 'Test: STRIP_END_WS_WORKS!!! ';
            print "\r\n\r\n";
            print 'STRIP_END_WS_WORKS!!! ';
        }
        case 30 {
            print "Content-Length: 100\r\n";
            print "Date: Thu, 06 Jan 2011 09:37:54 GMT\r\n";
            print 'Test: STRIP_CHARS_TYPECAST_WORKS!!! ';
            print "\r\n\r\n";
            print 'STRIP_END_WS_WORKS!!! ';
        }
        case 36 {
            print "Content-Length: 206\r\n\r\n";
            print ' ^, ,^,^, . . . . . .. ,...,,...... ,,,.,.^^ ^z1/z@z@11@z1zz1/@/*@z@1/11A@1/L@/L@z/@_@/@I1@1/@Z@/z@Z1/_/W@/@1E@/z1@L@/Lz@/z@!z1/!/zz1@zz1z!/zz^^^^^^....................^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ';
        }
        case 37 {
            print 'Test:^, ,^,^, . . . . . .. ,...,,...... ,,,.,.^^ ^z1/z@z@11@z1zz1/@/*@z@1/11A@1/L@/L@z/@_@/@I1@1/@Z@/z@Z1/_/W@/@1E@/z1@L@/Lz@/z@!z1/!/zz1@zz1z!/zz^^^^^^....................^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ,^ ';
            print "\r\n\r\n";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}
if ($queryString{"script"} eq "replace_response")
{
    switch ($queryString{"case"}) {

        case 6 {
            print "Content-Length: 5\r\n";
            print "Content-Location: http://citrix.com/myResource?format=xml\r\n";
            print "\r\nAbcde";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}
if ($queryString{"script"} eq "cache_control")
{
    switch ($queryString{"case"}) {
        case 1 {
			print "Cache-Control: max-age=10\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 2 {
			print "Cache-Control: no-cache\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 3 {
			print "Cache-Control: s-maxage=10\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 4 {
			print "Cache-Control: max-stale=10, max-age=-20\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 5 {
			print "Cache-Control: public\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 6 {
			print "Cache-Control: private\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 7 {
			print "Cache-Control: no-store\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 8 {
			print "Cache-Control: no-transform\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 9 {
			print "Cache-Control: must-revalidate\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 10 {
			print "Cache-Control: proxy-revalidate\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 11 {
			print "Cache-Control: m=12345\r\n";
			print "Content-Length: 5\r\n";
			print "\r\nJLEwx";
        }
		case 12{
			print "Cache-Control: min-fresh=24, max-age=-20\r\n";
                        print "Content-Length: 5\r\n";
                        print "\r\nJLEwx";
	}
		case 13 {
                        print "Cache-Control: max-age=10800, public, max-stale=10\r\n";
                        print "Content-Length: 5\r\n";
                        print "\r\nJLEwx";
	}
    }
}
if ($queryString{"script"} eq "cookie")
{
	switch($queryString{"case"}){
		case 1 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11;Name12=Value12\r\n";
                        print "\r\nJLEwx";
					}
		case 2 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE2: Name11=Value11;Name12=Value12\r\n";
                        print "\r\nJLEwx";
					}
		case 3 {
                        print "Content-Length: 5\r\n";
			for(1..16){
			print "SET-COOKIE: Name11=Value"."$_"."1;Name12=Value"."$_"."2\r\n";
			}
                        print "\r\nJLEwx";
					}
		case 4 {
                        print "Content-Length: 5\r\n";
			for(1..20){
			print "SET-COOKIE: Name11=Value"."$_"."1;Name12=Value"."$_"."2\r\n";			
			}
                        print "\r\nJLEwx";
					}
		case 5 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11\r\n";
                        print "\r\nJLEwx";
					}
		case 6 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11\r\n";
                        print "\r\nJLEwx";
					}
		case 7 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11;Domain=\"ttttt\"uuuu;Domain=\"ttttt\"dddddd;Name12=Value12\r\n";
                        print "\r\nJLEwx";
					}
		case 8 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11;Domain=\"ttttt\";Name12=Value12\r\n";
                        print "\r\nJLEwx";
					}
		case 9 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11;expires=Sun, 06-Nov-1994 08:49:37 GMT;Name12=Value12\r\n";
                        print "\r\nJLEwx";
					}
		case 10 {
                        print "Content-Length: 5\r\n";
			print "SET-COOKIE: Name11=Value11;expires=Sun, 06-Nov-1994 08:49:37 GMT;Path=\"\/ue12\";=rrrr;eeeee\r\n";
                        print "\r\nJLEwx";
					}
		case 11 {
                        print "Content-Length: 5\r\n";
                        print "SET-COOKIE: Name11=Value11;Port=80,70;Version=\"40\"\r\n";
                        print "\r\nJLEwx";
					}

	}
}
if ($queryString{"script"} eq "delayed_response")
{
    switch ($queryString{"case"}) {
        case 10 {
            print "Content-Length: 5\r\n";
            sleep(10);
            print "\r\nJLEwx";
        }
        case 50 {
            print "Content-Length: 5\r\n";
            sleep(20);
            print "\r\nJLEwx";
        }

    }
}
if ($queryString{"script"} eq "unicode")
{
    switch ($queryString{"case"}) {
        case 1 {
            print "Content-Length: 31\r\n";
            print "\r\n你好，这是华人世界test";
        }

    }
}
if ($queryString{"script"} eq "list_t")
{
    switch ($queryString{"case"}) {

        case 2 {
            print "Content-Length: 29\r\n";
            print "\r\nGET#vfvkjfvf#vrtvtrv trvv####";}
        case 5 {
            print "Content-Length: 29\r\n";
            print "\r\nGET;vfvkjfvf;vrtvtrv trvv;;;;";}
        case 10 {
            print "Content-Length: 2000\r\n\r\n";
            for (1..254) {
                print "abcd$_:";
            } }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "nvlist_t")
{
    switch ($queryString{"case"}) {

        case 2 {
            print "Content-Length: 56\r\n\r\n";
            print 'ret@65&set@12&aaa@2w;-&&yup@4&aaa@09&aaa@34&was@ret/////';}
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }

}

if ($queryString{"script"} eq "time_t")
{
    switch ($queryString{"case"}) {

        case 2 {
            print "Content-Length: 30\r\n\r\n";
            print 'Sunday, 06-Nov-94 08:49:37 GMT';}
        case 4 {
            print "\r\n\r\n";
        }
        case 6 {
            print "Content-Length: 21\r\n\r\n";
            print 'Dec 18 2011, 16:44:18';}
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }

}

if ($queryString{"script"} eq "http_version_t")
{
    switch ($queryString{"case"}) {

        case 4 {
            print "Content-Length: 15\r\n\r\n";
            print "HTTP/1.1 200 OK";} 
        case 6 {
            print "Content-Length: 271\r\n\r\n";
            print "evcrvtrvrv/.rr/yt
            yt
            btyb
            tbtb
            tnbt
            nn
            nyt";}
        case 12 {
            print "Test: HTTP/1.1 200 OK \r\n\r\n";
        }
        else {
            print "Wrong Option Entered - $queryString {'case'}";
            return 0;
        }
    }
}

if ($queryString{"script"} eq "http_url_t")
{
    switch ($queryString{"case"}) {

        case 8 {
            print "Set-Cookie: test=123;url=/testsite/123?abc=123;url=/cool/test?abc=123\r\n";
            print "Content-Length: 15\r\n\r\n";
            print "HTTP/1.1 200 OK";}
        case 13 {
            print "Set-Cookie: test=123;url=/testsite/123?abc=123;url=/cool/test?abc=123\r\n";
            print "Content-Length: 48\r\n\r\n";
            print "/ssssssssss/ssssssssssssssss/sssssssssssssss/s/s";}
    }
}

if ($queryString{"script"} eq "html5_headings")
{
    switch ($queryString{"case"}) {

        case 8 {
            print "Content-Length: 45\r\n";
            print "\r\n<h2>CoolWork </h2> <h1>Works great</h1><hr>\r\n";
        }
        case 9 {
            print "Content-Length: 65\r\n";
            print "\r\n<title>123</title>\r\n<h2>CoolWork </h2> <h1>Wroks great</h1><hr>\r\n";
        }
        case 10 {
            print "Content-Length: 80\r\n";
            print "\r\n<title>123</title>\r\n<h2>CoolWork <h1>Nested</h1></h2> <h1>Wroks great</h1><hr>\r\n";
        }
        case 15 {
            print "Content-Length: 75\r\n";
            print "\r\n<title>123</title>\r\n<h2>CoolWork <h1>Nested</h1> <h1>Wroks great</h1><hr>\r\n";
        }
    }
}

if ($queryString{"script"} eq "cissues")
{
    switch ($queryString{"case"}) {
        case 63672 {
	print "Content-Length: 900\r\n\r\n";
            for (1..20) {
                print "<a href=http://gwweb.vansd.org>Link</a><br>\r\n";
            }
        }
    }
}

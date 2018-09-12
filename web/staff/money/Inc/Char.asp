<%
Function strkill(fString)
if not isnull(fString) and fString <> "" then
fString = Replace(fString, ">", "&gt;")
fString = Replace(fString, "<", "&lt;")
fString = Replace(fString, CHR(32), "&nbsp;")
fString = Replace(fString, CHR(9), "&nbsp;")
fString = Replace(fString, CHR(34), "&quot;")
fString = Replace(fString, CHR(39), "&#39;")
fString = Replace(fString, CHR(13), "") 
fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
fString = Replace(fString, CHR(10), "<BR> ")
strkill = fString
end if
End Function

function HTMLEncode2(fString)
	fString = Replace(fString, CHR(13), "")
	fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
	fString = Replace(fString, CHR(10), "<BR>")
	HTMLEncode2 = fString
end function

function killstr(str) '过滤非法字符函数
dim tempstr
if str="" then exit function
tempstr=replace(str,chr(34),"") ' "
tempstr=replace(tempstr,chr(39),"") ' '
tempstr=replace(tempstr,chr(60),"") ' <
tempstr=replace(tempstr,chr(62),"") ' >
tempstr=replace(tempstr,chr(37),"") ' %
tempstr=replace(tempstr,chr(38),"") ' &
tempstr=replace(tempstr,chr(40),"") ' (
tempstr=replace(tempstr,chr(41),"") ' )
tempstr=replace(tempstr,chr(59),"") ' ;
tempstr=replace(tempstr,chr(43),"") ' +
tempstr=replace(tempstr,chr(45),"") ' -
tempstr=replace(tempstr,chr(91),"") ' [
tempstr=replace(tempstr,chr(93),"") ' ]
tempstr=replace(tempstr,chr(123),"") ' {
tempstr=replace(tempstr,chr(125),"") ' }
killstr=tempstr
end function

function UBBCode(strContent)
	on error resume next
	strContent = strkill(strContent)
	dim objRegExp
	Set objRegExp=new RegExp
	objRegExp.IgnoreCase =true
	objRegExp.Global=True

	objRegExp.Pattern="(\[URL\])(.*)(\[\/URL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")

	objRegExp.Pattern="(\[URL=(.*)\])(.*)(\[\/URL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")

	objRegExp.Pattern="(\[EMAIL\])(.*)(\[\/EMAIL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""mailto:$2"">$2</A>")
	objRegExp.Pattern="(\[EMAIL=(.*)\])(.*)(\[\/EMAIL\])"
	strContent= objRegExp.Replace(strContent,"<A HREF=""mailto:$2"" TARGET=_blank>$3</A>")

	if strflash= "1" then
	objRegExp.Pattern="(\[FLASH\])(.*)(\[\/FLASH\])"
	strContent= objRegExp.Replace(strContent,"<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")
	end if

	objRegExp.Pattern="(\[IMG\])(.*)(\[\/IMG\])"
	strContent=objRegExp.Replace(strContent,"<IMG SRC=""$2"" border=0>")

        objRegExp.Pattern="(\[HTML\])(.*)(\[\/HTML\])"
	strContent=objRegExp.Replace(strContent,"<SPAN><p><IMG src=pic/code.gif align=absBottom>该篇文章附带的 HTML 代码片段如下:<BR><TEXTAREA style=""WIDTH: 94%; BACKGROUND-COLOR: #f7f7f7"" name=textfield rows=10>$2</TEXTAREA><BR><INPUT onclick=runEx() type=button value=运行此代码 name=Button> [Ctrl+A 全部选择   提示:你可先修改部分代码，再按运行]</SPAN><BR>")

	objRegExp.Pattern="(\[color=(.*)\])(.*)(\[\/color\])"
	strContent=objRegExp.Replace(strContent,"<font color=$2>$3</font>")
	objRegExp.Pattern="(\[face=(.*)\])(.*)(\[\/face\])"
	strContent=objRegExp.Replace(strContent,"<font face=$2>$3</font>")
	objRegExp.Pattern="(\[align=(.*)\])(.*)(\[\/align\])"
	strContent=objRegExp.Replace(strContent,"<div align=$2>$3</div>")

	objRegExp.Pattern="(\[QUOTE\])(.*)(\[\/QUOTE\])"
	strContent=objRegExp.Replace(strContent,"<BLOCKQUOTE><font size=1 face=""Verdana, Arial"">quote:</font><HR>$2<HR></BLOCKQUOTE>")
	objRegExp.Pattern="(\[fly\])(.*)(\[\/fly\])"
	strContent=objRegExp.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$2</marquee>")
	objRegExp.Pattern="(\[move\])(.*)(\[\/move\])"
	strContent=objRegExp.Replace(strContent,"<MARQUEE scrollamount=3>$2</marquee>")
	objRegExp.Pattern="(\[glow=(.*),(.*),(.*)\])(.*)(\[\/glow\])"
	strContent=objRegExp.Replace(strContent,"<table width=$2 style=""filter:glow(color=$3, strength=$4)"">$5</table>")
	objRegExp.Pattern="(\[SHADOW=(.*),(.*),(.*)\])(.*)(\[\/SHADOW\])"
	strContent=objRegExp.Replace(strContent,"<table width=$2 style=""filter:shadow(color=$3, direction=$4)"">$5</table>")
    
	objRegExp.Pattern="(\[i\])(.*)(\[\/i\])"
	strContent=objRegExp.Replace(strContent,"<i>$2</i>")
	objRegExp.Pattern="(\[u\])(.*)(\[\/u\])"
	strContent=objRegExp.Replace(strContent,"<u>$2</u>")
	objRegExp.Pattern="(\[b\])(.*)(\[\/b\])"
	strContent=objRegExp.Replace(strContent,"<b>$2</b>")
	objRegExp.Pattern="(\[fly\])(.*)(\[\/fly\])"
	strContent=objRegExp.Replace(strContent,"<marquee>$2</marquee>")

	objRegExp.Pattern="(\[size=1\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=1>$2</font>")
	objRegExp.Pattern="(\[size=2\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=2>$2</font>")
	objRegExp.Pattern="(\[size=3\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=3>$2</font>")
	objRegExp.Pattern="(\[size=4\])(.*)(\[\/size\])"
	strContent=objRegExp.Replace(strContent,"<font size=4>$2</font>")

	strContent = doCode(strContent, "[list]", "[/list]", "<ul>", "</ul>")
	strContent = doCode(strContent, "[list=1]", "[/list]", "<ol type=1>", "</ol id=1>")
	strContent = doCode(strContent, "[list=a]", "[/list]", "<ol type=a>", "</ol id=a>")
	strContent = doCode(strContent, "[*]", "[/*]", "<li>", "</li>")
	strContent = doCode(strContent, "[code]", "[/code]", "<pre id=code><font size=1 face=""Verdana, Arial"" id=code>", "</font id=code></pre id=code>")

	set objRegExp=Nothing
	UBBCode=strContent
end function


%>
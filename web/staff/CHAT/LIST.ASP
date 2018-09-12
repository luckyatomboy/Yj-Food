<%
response.buffer=true
Response.Expires=0
Add
Sub Add 
  toname=trim(Request.Form ("towho"))
  mecolor=trim(request.form("addwordcolor"))
  saycolor=trim(request.form("sayscolor"))
'  addsign=trim(request.form("addsign"))
  addsays=trim(request.form("addsays"))
    if session("username")="" then session("username")=Request.form("from")

u_list=application("userlist")
for i=1 to ubound(u_list)
ua_list=ua_list&u_list(i)
next
if Instr(ua_list,session("username"))=0 then 
Response.Write "<script Language=Javascript>alert('" & session("username") & "：您已经被管理员请出会议室！请遵守发言规则并重新登陆！');</script>"
response.write "<OBJECT id=closes type='application/x-oleobject' classid='clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11'><param name='Command' value='Close'></object>"
response.write "<script Language=Javascript>closes.Click();</script>"
end if
    if request.form("towho")<>"" then toname=request.form("towho")
    if Request.Form ("says")<>"" then
         Message=Request.Form ("says")
		 else
		 Message="走进会议室"
		end if
         if Message="" then exit sub
         application.lock
    	 if request.form("says")="" then 
		 application("show")=application("show")&"<br>"&"<font color=blue>【浏览器刷新】</font>"&"热烈欢迎<font color=blue>〖"&session("username")&"〗</font>来到《会议大厅》！<font color=blue>"&gettime()&"</font>"
		 else
u_list=application("userlist")
for i=1 to ubound(u_list)
ua_list=ua_list&u_list(i)
next
if Instr(ua_list,toname)=0 and toname<>"大家" then
 Response.Write "<script Language=Javascript>alert('“" & toname & "”不在会议室中，不能对其发言。');parent.say.document.say.towho.value='大家';parent.online.location.reload();</script>"
exit sub
else
		   if left(Message,2)="//" then
		    says=Replace(Message,"//","<a href=# onclick=javascript:parent.say.document.say.towho.value="&"&quot;"&session("username")&"&quot;"&"><font color="&mecolor&">"&session("username")&"</font></a>")
		    says=Replace(says,"%%","<a href=# onclick=javascript:parent.say.document.say.towho.value="&"&quot;"&ToName&"&quot;"&"><font color=FF0088>"&toname&"</font></a>")
		    application("show")=application("show")&"<br>"&says
		   else
		    application("show")=application("show")&"<br><B>"
		    application("Show")=application("show")&"<a href=# onclick=javascript:parent.say.document.say.towho.value="&"&quot;"&session("username")&"&quot;"&"><font color="&mecolor&">"&session("username")&"</font></a>"
		    Application("Show")=application("show")&addsays&"对<a href=# onclick=javascript:parent.say.document.say.towho.value="&"&quot;"&ToName&"&quot;"&"><font color=660099>"&ToName&"</font></a>"
		    Application("show")=application("show")&"说：</B><font color="&saycolor&">"
		    application("show")=application("show")& Message &"</font>　<font class=t>("&gettime()&")</font>"
		 end if
		end if
end if
show=application("show")
I=len(show)
for N=1 to 20
I=instrrev(show,"<br>",i,vbTextCompare)-1
if i=0 then exit for
next
if not(i=0) then 
application("show")=right(show,len(show)-i+1)
application.unlock
end if
End sub
application("u_id")=application("u_id")+1
session("u_id")=application("u_id")
function getTime()
dim y,m,d,h,n,s
y=Year(date())
m=Month(date())
d=Day(date())
h=Hour(time())
n=Minute(time())
s=Second(time())  '当为是一位的 时候在前面加0
if len(m)=1 then m="0" & m
if len(d)=1 then d="0" & d
if len(h)=1 then h="0" & h
if len(n)=1 then n="0" & n
if len(s)=1 then s="0" & s
'getTime=y&"/"&m&"/"&d &" " & h&":"& n&":"&s
gettime=h&":"& n&":"&s
end function
%>
<SCRIPT LANGUAGE=javascript>
<!--
function test(){
	window.top.talk.document.location.reload()
}
function wh(fn){
fn.open();
fn.writeln("<html><head><title>对话区</title><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\">");
fn.writeln("<style type=text/css>.t{color:003366;font-size:10px;}.pic{font-size:17px;}body{font-size:14px;line-height:130%}A{text-decoration:none;font-size: 14px;}A:Hover{text-decoration:underline;font-size: 14px;}.p{font-size:20px}.l{line-height:125%}.t{color:FF00FF;font-size:14px;}</style></head><\Script Language=\"JavaScript1.1\">");
fn.writeln("var autoScrollOn=1;var scrollOnFunction;var scrollOffFunction;");
fn.writeln("function towho(un){document.say.towho.value.text=un;document.say.says.focus();return;}function scrollit(){ if(!parent.say.say.as.checked){autoScrollOn=0;return true;}else{autoScrollOn=1;StartUp();return true;}}function scrollWindow(){if(autoScrollOn==1){this.scroll(0,65000);setTimeout('scrollWindow()',200);}}function scrollOn(){autoScrollOn=1;scrollWindow();}function scrollOff(){autoScrollOn=0;}function StartUp(){parent.onblur=scrollOnFunction;parent.onfocus=scrollOffFunction;scrollWindow();}");
fn.writeln("scrollOnFunction=new Function('scrollOn()');");
fn.writeln("scrollOffFunction=new Function('scrollOff()');");
fn.writeln("StartUp();</\script>");return;
}
function write(){ 
wh(parent.talk.document);
parent.talk.document.writeln("<body bgcolor=FFFFFF text=000000>");

}
//-->
</SCRIPT>
<script language="javascript">
test();
write();
parent.talk.document.write ('<%=application("show")%>');
</script>

<head>
</head>


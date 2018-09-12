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
parent.talk.document.writeln("<body bgcolor=fef7eb text=660099>");

}
//-->
</SCRIPT>
<%
u_id=application("u_id")
username=session("username")
if u_id<>session("u_id") then
%>
<script language="javascript">
test();
write();
parent.talk.document.write ('<%=application("show")%>');
</script>
<%
session("u_id")=u_id
end if%>
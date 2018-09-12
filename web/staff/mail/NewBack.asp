<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--回复邮件</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>

</HEAD>

<script language="javascript">
function showImg()
{ 
	if(document.all.BodyBG){	
		BodyBG.style.top=document.body.offsetHeight-245;
		BodyBG.style.left=document.body.offsetWidth-279;
		BodyBG.style.visibility="visible";
	} 
}	
</script>
<!--menu-->

<!--menu-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;回复邮件</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>
<!---->
<%
Emp=split(Request("Emp"),"|")
EmpId=Emp(0)
EmpName=Emp(1)

MailId=Request("MailId")
Set Rs=conn.execute("SELECT Body FROM Tbl_Mailbox WHERE MailId="&MailId)
Body=vbcrlf & vbcrlf & vbcrlf & vbcrlf & "以下是原文内容" & vbcrlf
Body=Body & "--------------------------------------------" & vbcrlf
Body=Rs("Body")


%>
<script language="javascript">
	//
	function InsAdd(){
		var qF = "to";

		var _R = showModalDialog('To.asp?to='+frm.to.value,0,"dialogWidth:540px;dialogHeight:410px;status:no");
		if ("undefined" != typeof(_R) ){
			frm.to.value = _R.to;
			frm.toId.value = _R.toId;
		}
		frm.elements[qF].focus();
	}
	//
	function MM_Do(action){
		var checkflag=true;

		if(action=="sent"){
			document.frm.action.value="sent";
		}else if(action=="save"){
			document.frm.action.value="save";
		}
		//
		if(document.frm.toId.value==""){
			alert("请选择收件人！");
			document.frm.to.value=="";
			document.frm.to.focus();
			checkflag=false;
		}
		if(document.frm.subject.value==""){
			alert("请填写主题！");
			document.frm.subject.focus();
			checkflag=false;
		}
		if(checkflag)	document.frm.submit();
	}
</script>
<form name="frm" method="post" action="NewOk.asp">
<input type="hidden" name="action" value="">
<table border="0" width="100%">
  <tr>
	<td width="13"></td>
	<td>
	<table cellspacing=0 cellpadding=0 border=0 width=580>
	  <tr>
		<td nowrap width=70><a href="javascript:InsAdd()">收件人：</a> </td>
		<td width=500 align=right>
		<input type="hidden" name="toId" value="<%=EmpId%>" style="width:500">
		<input type="text" name="to" value="<%=EmpName%>" readonly value="" size=100 maxlength=1000 style="width:500" tabindex=1 title="收件人" class="C">
		</td>
		<td width=10></td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	  <tr>
		<td nowrap><label for="subject">主题</label>：</td>
		<td align=right><input type="text" id="subject" name="subject" value="" size=100 maxlength=80 style="width:500" tabindex=4 class="C"></td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	  <tr>
		<td nowrap><label for="subject">附件</label>：</td>
		<td>
		<input type="text" name="Doc" style="width:180px;COLOR:navy;">
		<iframe name="upload" frameborder=0 width=100% height=30 scrolling=no src="Public/UploadDoc.asp?filepath=../Doc/&formname=frm&textname=Doc"></iframe>
		</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	</table>
	<table cellpadding=0 cellspacing=0 border=0 width=580>
	  <tr>
		<td align=center>
			

<textarea rows="15" name="body" style="display:none"><%=rs("body")%></textarea>
              <iframe ID="body" src="../rededit/ewebeditor.htm?id=body&style=coolblue" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe> 			
		
 </td>
	  </tr>
	  <tr>
		<td align=center>
		<input type="button" name="btnSent" value="发送" onclick="javascript:MM_Do('sent')" style="width:80px">
		<input type="button" name="btnSave" value="保存" onclick="javascript:MM_Do('save')" style="width:80px">
		</td>
	  </tr>
	</table>
	</td>
  </tr>
</table>
</form>
<!---->
</BODY>
</HTML>
<%
Set Rs=nothing
%>
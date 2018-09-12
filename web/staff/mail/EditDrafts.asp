<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--编辑邮件</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="css/main.css" type="text/css" rel="stylesheet"><LINK href="style.css" type=text/css rel=stylesheet>
</HEAD>


<SCRIPT language="JavaScript" src="Jscript/ToolsBar.js"></SCRIPT>
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
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
  <tr>
	<td vAlign="bottom" bgColor="#f1f1f1" height="60">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	  <tr>
		<td align="middle">
		<table cellSpacing="0" cellPadding="0" width="98%" border="0">
		  <tr>
			<td width="36%" rowSpan="2"></td>
			<td height="27">&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		</table>
		</td>
	  </tr>
	  <tr>
		<td>
		<table cellSpacing="0" cellPadding="0" width="162" background="../images/tab04.gif" border="0">
		  <tr>
			<td vAlign="bottom" width="27"><IMG height="20" src="../images/tab01.gif" width="27"></td>
			<td vAlign="bottom" align="middle"><font color="#ff6600"><b>编辑邮件</b></font></td>
			<td vAlign="bottom" width="27"><IMG height="20" src="../images/tab03.gif" width="27"></td>
		  </tr>
		</table>
		</td>
	  </tr>
	</table>
	</td>
	<td width="1" bgColor="#ffffff" height="61" rowSpan="2"></td>
  </tr>
  <tr>
	<td bgColor="#cccccc" height="1"></td>
  </tr>
</table>
<!---->
<%
MailId=Request("MailId")
Set Rs=conn.execute("SELECT ShareEmpIds,ShareEmpNames,subject,body,Doc FROM Tbl_Mailbox WHERE MailId="&MailId)
%>
<script language="javascript">
	//
	function InsAdd(){
		var qF = "to";

		var _R = showModalDialog('To.asp?toId='+frm.toId.value,0,"dialogWidth:540px;dialogHeight:410px;status:no");
		if ("undefined" != typeof(_R) ){
			frm.to.value = _R.to;
			frm.toId.value = _R.toId;
		}
		frm.elements[qF].focus();
	}
	//
	function MM_Do(action){
		var checkflag=true;

		if(action=="edit_sent"){
			document.frm.action.value="edit_sent";
		}else if(action=="edit_save"){
			document.frm.action.value="edit_save";
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
<input type="hidden" name="MailId" value="<%=MailId%>">
<table border="0" width="100%">
  <tr>
	<td width="13"></td>
	<td>
	<table cellspacing=0 cellpadding=0 border=0 width=580>
	  <tr>
		<td nowrap width=70><a href="javascript:InsAdd()">收件人：</a> </td>
		<td width=500 align=right>
		<input type="hidden" name="toId" value="<%=Rs("ShareEmpIds")%>" style="width:500">
		<input type="text" name="to" value="<%=Rs("ShareEmpNames")%>" readonly value="" size=100 maxlength=1000 style="width:500" tabindex=1 title="收件人" class="C">
		</td>
		<td width=10><input type="button" style="width:60px;height:22px;" name="btnTo" value="选择. . ." onclick="javascript:InsAdd()"></td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	  <tr>
		<td nowrap><label for="subject">主题</label>：</td>
		<td align=right><input type="text" value="<%=Rs("subject")%>" id="subject" name="subject" value="" size=100 maxlength=80 style="width:500" tabindex=4 class="C"></td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	  <tr>
		<td nowrap><label for="subject">附件</label>：</td>
		<td>
		<input type="text" name="Doc" value="<%=Rs("Doc")%>" style="width:180px;COLOR:navy;">
		<iframe name="upload" frameborder=0 width=100% height=30 scrolling=no src="../Public/UploadDoc.asp?filepath=../Office/Doc/&formname=frm&textname=Doc"></iframe>
		</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td height=12>&nbsp;</td>
	  </tr>
	</table>
	<table cellpadding=0 cellspacing=0 border=0 width=580>
	  <tr>
		<td align=center><textarea name="body" rows=13 cols=60 wrap="soft" style="font-size:9pt;width:580px;" tabindex=7 title="键入邮件文本" ><%=Rs("Body")%></textarea></td>
	  </tr>
	  <tr>
		<td align=center>
		<input type="button" name="btnSent" value="发送" onclick="javascript:MM_Do('edit_sent')" style="width:80px">
		<input type="button" name="btnSave" value="保存" onclick="javascript:MM_Do('edit_save')" style="width:80px">
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
set rs=nothing
set conn=nothing
%>
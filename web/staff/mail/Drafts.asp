<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--草稿箱</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/main.css" type="text/css" rel="stylesheet">
<SCRIPT language="JavaScript" src="../Jscript/Control.js"></SCRIPT>
</HEAD>

<SCRIPT language=JavaScript src='../Menu/MainMenu.js' type=text/javascript></SCRIPT>
<SCRIPT language="JavaScript" src="../Jscript/ToolsBar.js"></SCRIPT>
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
			<td vAlign="bottom" align="middle"><font color="#ff6600"><b>草稿箱</b></font></td>
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
<BR>
<SCRIPT language="JavaScript">
	function MM_Do(id,action){
		if(action=="delete"){
			if(confirm("确定要删除该条信息吗？\n注意：删除后不能恢复！")){
				document.frm.action="DeleteDrafts.asp";
			}
		}else if(action=="brow"){
			document.frm.action="BrowDrafts.asp";
		}else if(action=="edit"){
			document.frm.action="EditDrafts.asp";
		}

		document.frm.MailId.value=id;
		document.frm.submit();
	}
</SCRIPT>
<form name="frm" method="post" action="">
<input type="hidden" name="MailId" value="">
</form>
<table align="center" cellSpacing="0" cellPadding="0" width="100%" border="0">
  <tr>
	<td width="13"></td>
	<td>
	<table style="word-break:break-all;" class="EE" border="0" width="660" cellpadding="0" cellspacing="0">
	  <tr height="26" bgcolor="#DBEAF5" align="center">
		<td width="30"><img src="../Images/attach.gif"></td>
		<!--<td width="100"><font color="#10659E">发件人</font></td>-->
		<td width="210"><font color="#10659E">主题</font></td>
		<td width="150"><font color="#10659E">收件人</font></td>
		<td width="150"><font color="#10659E">日期</font></td>
		<td width="100"></td>
	  </tr>
	  <%
	  EmpId=session("EmpId")
	  CheckedNum = 0
	  TotalRecords = 0
	  sqlstr = "SELECT MailId,DeptName,EmpName,ShareEmpNames,Subject,Doc,MailDate FROM Tbl_Mailbox WHERE ShareFlag='0' AND EmpId="&EmpId
	  Set Rs = server.createobject("adodb.recordset")
	  Rs.open sqlstr,conn,1,1
	  TotalRecords = Rs.recordcount
	  Rs.pagesize = 20
	  If TotalRecords>0 Then
		'Set RsChecked = conn.execute("select count(*) as NotReadNum from Tbl_Mailbox where CheckFlag=False")
		'CheckedNum = RsChecked("CheckedNum")
		'Set RsChecked = nothing
		CurrentPage = 1
		Rs.absolutepage = CurrentPage
		  Do While Not Rs.Eof
		  %>
		  <tr height="23" align="center">
			<td align="center"><%=Rs("Doc")%></td>
			<!--<td align="center"><%=Rs("DeptName")%><%=Rs("EmpName")%></td>-->
			<td align="center"><%=Rs("Subject")%></td>
			<td>&nbsp;<%=Rs("ShareEmpNames")%></td>
			<td>&nbsp;<%=Rs("MailDate")%></td>
			<td>
			<a href="javascript:MM_Do(<%=Rs("MailId")%>,'brow');" title="浏览详细"><img border="0" src="../images/brow.gif"></a>&nbsp;
			<a href="javascript:MM_Do(<%=Rs("MailId")%>,'edit');" title="编辑"><img border="0" src="../images/edit.gif"></a>&nbsp;
			<a href="javascript:MM_Do(<%=Rs("MailId")%>,'delete');" title="删除"><img border="0" src="../images/delete.gif"></a>&nbsp;
			</td>
		  </tr>
		  <%
			Rs.MoveNext
		  Loop
	  End If
	  %>
	</table>
	<!--分页-->
	<table border=0 cellpadding=0 cellspacing=0 width=660 style="BORDER-TOP:1px solid #C1CDD8;PADDING-LEFT:7px;PADDING-RIGHT:7px;PADDING-TOP:2px;PADDING-BOTTOM:2px;">
	  <tr>
		<td><%=TotalRecords%> 封邮件</td>
		<td align=right>
		<!--#include file="../Public/ShowPage.asp"-->
		</td>
	  </tr>
	</table>
	<form name="frmpage" method="post">
	<input type="hidden" name="mepage" value="">
	</form>
	</td>
  </tr>
</table>
<BR>
<!---->
</BODY>
</HTML>
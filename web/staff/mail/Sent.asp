<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--发件箱</TITLE>
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
      <td>&nbsp;发件夹</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

<!---->
<BR>
<SCRIPT language="JavaScript">
	function MM_Do(id,action){
		if(action=="delete"){
			if(confirm("确定要删除该条信息吗？\n注意：删除后不能恢复！")){
				document.frm.action="DeleteSent.asp";
			}
		}else if(action=="edit"){
			document.frm.action="EditSent.asp";
		}else if(action=="brow"){
			document.frm.action="BrowSent.asp";
		}

		document.frm.MailId.value=id;
		document.frm.submit();
	}
</SCRIPT>
<form name="frm" method="post" action="">
<input type="hidden" name="MailId" value="">
</form>
<table align="center" cellSpacing="0" cellPadding="0" width="100%"  class="toptable grid" border="1">
  <tr>
	<td width="13"></td>
	<td>
	<table  class="toptable grid" border="1" width="660" cellpadding="0" cellspacing="0">
	  <tr height="26" bgcolor="#4455aa" align="center">
		<td  class="category" width="30"><img src="Images/attach.gif"></td>
		<!--<td width="100"><font color="#10659E">发件人</font></td>-->
		<td  class="category" width="210">主题</font></td>
		<td  class="category" width="150">收件人</font></td>
		<td  class="category" width="150">日期</font></td>
		<td  class="category" width="100"></td>
	  </tr>
	  <%
	  EmpId=session("EmpId")
	  CheckedNum = 0
	  TotalRecords = 0
	  sqlstr = "SELECT MailId,DeptName,EmpName,ShareEmpNames,Subject,Doc,MailDate FROM Tbl_Mailbox WHERE ShareFlag='1' AND DeleteFlag='0' AND EmpId="&EmpId
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
			<td align="center"><%if Rs("Doc")<>"" then%><a title="下载附件" target="_blank" href="Doc/<%=Rs("Doc")%>"><img border="0" src="Images/attach.gif"></a><%end if%></td>
			<!--<td align="center"><%=Rs("DeptName")%><%=Rs("EmpName")%></td>-->
			<td align="center"><%=Rs("Subject")%></td>
			<td>&nbsp;<%=Rs("ShareEmpNames")%></td>
			<td>&nbsp;<%=Rs("MailDate")%></td>
			<td>
			<a href="javascript:MM_Do(<%=Rs("MailId")%>,'brow');" title="浏览详细"><img border="0" src="images/brow.gif"></a>&nbsp;
			<a href="javascript:MM_Do(<%=Rs("MailId")%>,'delete');" title="删除"><img border="0" src="images/delete.gif"></a>&nbsp;
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
		<!--#include file="Public/ShowPage.asp"-->
		</td>
	  </tr>
	</table>
	<form name="frmpage" method="post">
	<input type="hidden" name="mepage" value="">
	</form>
	</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>　</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

<BR>
<!---->
</BODY>
</HTML>

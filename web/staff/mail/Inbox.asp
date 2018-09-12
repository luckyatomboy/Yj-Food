<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--收件箱</TITLE>
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
      <td>&nbsp;收件夹</td>
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
				document.frm.action="DeleteInbox.asp";
			}
		}else if(action=="brow"){
			document.frm.action="BrowInbox.asp";
		}

		document.frm.MailId.value=id;
		document.frm.submit();
	}
</SCRIPT>
<form name="frm" method="post" action="">
<input type="hidden" name="MailId" value="">
<input type="hidden" name="ReadFlag" value="">
</form>
<table align="center" cellSpacing="0" cellPadding="0" width="100%"  class="toptable grid" border="1">
  <tr>
	<td width="13"></td>
	<td>
	<table  class="toptable grid" border="1" width="660" cellpadding="0" cellspacing="0">
	  <tr height="26"  align="center">
		<td  class="category" width="30"><img src="Images/attach.gif"></td>
		<td  class="category" width="100">发件人</font></td>
		<td  class="category" width="210">主题</font></td>
		<!--<td width="150"><font color="#10659E">收件人</font></td>-->
		<td  class="category" width="150">日期</font></td>
		<td  class="category" width="100"></td>
	  </tr>
	  <%
	  EmpName=session("EmpName")
	  CheckedNum = 0
	  TotalRecords = 0
	  sqlstr = "SELECT MailId,DeptName,EmpName,ShareEmpNames,ReadEmpNames,Subject,Doc,MailDate FROM Tbl_Mailbox WHERE ShareFlag='1' AND ShareEmpNames like '%"&EmpName&"%' AND DeleteEmpNames Not like '%"&EmpName&"%'"
	  'response.write sqlstr
	  Set Rs = server.createobject("adodb.recordset")
	  Rs.open sqlstr,conn,1,1
	  TotalRecords = Rs.recordcount
	  Rs.pagesize = 20
	  If TotalRecords>0 Then
		Set RsReaded = conn.execute("select count(*) as ReadedNum from Tbl_Mailbox  WHERE ShareFlag='1' AND ShareEmpNames like '%"&EmpName&"%' AND ReadEmpNames like '%"&EmpName&"%' AND DeleteEmpNames Not like '%"&EmpName&"%'")
		ReadedNum = RsReaded("ReadedNum")
		Set RsReaded = nothing
		CurrentPage = 1
		Rs.absolutepage = CurrentPage
		  Do While Not Rs.Eof
		  %>
		  <tr height="23" <%If InStr(Rs("ReadEmpNames"),Session("EmpName"))>=1 Then Response.Write("bgcolor=#80ffff")%> align="center">
			<td align="center"><%if Rs("Doc")<>"" then%><a title="下载附件" target="_blank" href="Doc/<%=Rs("Doc")%>"><img border="0" src="Images/attach.gif"></a><%end if%></td>
			<td align="center"><%=Rs("DeptName")%><%=Rs("EmpName")%></td>
			<td align="center"><%=Rs("Subject")%></td>
			<!--<td>&nbsp;<%=Rs("ShareEmpNames")%></td>-->
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
		<td><%=TotalRecords%> 封邮件 　　<%=TotalRecords-ReadedNum%> 封未读邮件</td>
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

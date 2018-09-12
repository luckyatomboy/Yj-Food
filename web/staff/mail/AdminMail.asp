<!--#include file="Conn.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla96="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
set conn=nothing
end if
%>
<%
%>
<HTML>
<HEAD>
<TITLE>电机厂Market--邮件管理</TITLE>
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
      <td>&nbsp;邮件管理</td>
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
				document.frm.action="AdminDeleteMail.asp";
			}
		}else if(action=="brow"){
			document.frm.action="AdminDetailMail.asp";
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
	<table  class="toptable grid" border="1" width="760" cellpadding="0" cellspacing="0">
	  <tr height="26" bgcolor="#4455aa" align="center">
		<td  class="category" width="30"><img src="Images/attach.gif"></td>
		<td  class="category" width="100">发件人</font></td>
		<td  class="category" width="210">主题</font></td>
		<td  class="category" width="250">收件人</font></td>
		<td class="category"  width="150">日期</font></td>
		<td  class="category" width="100"></td>
	  </tr>
	  <%
	  TotalRecords = 0
	  TotalPages=0
	  intPagesize = 20
	  sqlstr = "SELECT MailId,DeptName,EmpName,ShareEmpNames,Subject,Doc,MailDate FROM Tbl_Mailbox"

	  Set Rs = server.createobject("adodb.recordset")
	  Rs.open sqlstr,conn,1,1
	  TotalRecords = Rs.recordcount
	  Rs.pagesize = intPagesize
	  TotalPages=Rs.pagecount
	  If TotalRecords>0 Then
		CurrentPage=request.form("mepage")
		if isnull(CurrentPage) or CurrentPage="" then CurrentPage=1
		if not isnumeric(CurrentPage) then CurrentPage=1
		CurrentPage=cint(CurrentPage)
		if CurrentPage<1 or CurrentPage>TotalPages then CurrentPage=1
		'CurrentPage = 1
		Rs.absolutepage = CurrentPage
		  for ii=1 to Rs.pagesize
		  %>
		  <tr height="23" align="center">
			<td align="center"><%if Rs("Doc")<>"" then%><a title="下载附件" target="_blank" href="Doc/<%=Rs("Doc")%>"><img border="0" src="Images/attach.gif"></a><%end if%></td>
			<td align="center">[<%=Rs("DeptName")%>] <%=Rs("EmpName")%></td>
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
			if Rs.Eof then exit for
		  next
	  End If
	  %>
	</table>
	<!--分页Start-->
	<form name="frmpage" method="post">
	<table border=0 cellpadding=0 cellspacing=0 width=760 style="BORDER-TOP:1px solid #C1CDD8;PADDING-LEFT:7px;PADDING-RIGHT:7px;PADDING-TOP:2px;PADDING-BOTTOM:2px;">
	  <tr>
		<td><%=TotalRecords%> 封邮件，每页<%=intPagesize%>封邮件，显示 <%=CurrentPage%>/<%=TotalPages%>页　　</td>
		<td align=right>
		<!--#include file="Public/ShowPage.asp"-->
		<input type="text" name="mepage" value="<%=CurrentPage%>" value="" style="width:30px;">
		<input type="submit" name="btnGo" value="Go" class="btnA" style="width:30px;">
		</td>
	  </tr>
	</table>
	</form>
	<!--分页End-->
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

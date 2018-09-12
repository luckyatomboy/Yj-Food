<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--信息提示</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/main.css" type="text/css" rel="stylesheet">
<SCRIPT language="JavaScript" src="../Jscript/Control.js"></SCRIPT>
</HEAD>
<BODY onresize="window_onresize();showImg();" bgColor="#ffffff" leftMargin="0" topMargin="0" scroll="no" onload="window_onload();showImg();">
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
<!--#include file="../menu/menu.ini"-->
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
		<table cellSpacing="0" cellPadding="0" width="132" background="../images/tab04.gif" border="0">
		  <tr>
			<td vAlign="bottom" width="27"><IMG height="20" src="../images/tab01.gif" width="27"></td>
			<td vAlign="bottom" align="middle" width="78"><font color="#ff6600"><b>系统首页</b></font></td>
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

<DIV id="BodyBG" style="Z-INDEX: -1; LEFT: 0px; VISIBILITY: hidden; WIDTH: 279px; POSITION: absolute; TOP: 120px; HEIGHT: 245px" name="LeftBG"><IMG height="245" src="images/info.gif" width="279"></DIV>
<DIV id="divMain" style="OVERFLOW: auto; WIDTH: 100%" align="center" name="divMain">
<table cellSpacing="0" cellPadding="0" width="97%" border="0">
  <tbody>
  <tr>
	<td bgColor="#ffffff" colSpan="2" height="20"></td>
  </tr>
  <tr>
	<td><IMG height="24" src="../images/icon_w.gif" width="24" align="absMiddle">&nbsp;<b><font class="text_px14" color="#ff6600"><span id="InfoTitle">欢迎进入电机厂市场管理系统</span></font></b></td>
	<td align="right"></td>
  </tr>
  <tr>
	<td colSpan="2" height="10"></td>
  </tr>
  <tr align="middle">
	<td colSpan="2" height="50">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tbody>
	  <tr>
		<td vAlign="top" align="right" width="245" rowSpan="3"><IMG src="../images/ok.gif"></td>
		<td vAlign="top" align="left" width="18" rowSpan="3"><IMG src="../images/sys_error_dotline.gif" width="12"></td>
		<td width="30" rowSpan="3"></td>
		<td vAlign="top" height="13"></td>
	  </tr>
	  <tr>
		<td vAlign="top" height="25"><b><span class="px14">您的个人资料</span></b></td>
	  </tr>
	  <tr>
		<td vAlign="top" width="0">
		<p><BR>
		<%
		EmpName=session("EmpName")
		DeptName=session("DeptName")
		%>
		<span id="txtUser">
		姓名：<%=EmpName%><br>
		部门或网点：<%=DeptName%><br><br>
		登录时间：<%=now()%>
		</span><BR>&nbsp;</p>
		<%
		NewMailNum=0
		
		Set RsNewMail = conn.execute("select count(*) as NewMailNum from Tbl_Mailbox  WHERE ShareFlag='1' AND ShareEmpNames like '%"&EmpName&"%' AND ReadEmpNames Not like '%"&EmpName&"%' AND DeleteEmpNames Not like '%"&EmpName&"%'")
		NewMailNum = RsNewMail("NewMailNum")
		Set RsNewMail = nothing
		If NewMailNum>0 Then
			Response.Write("<a href='../Office/Inbox.asp' title='阅读新邮件'><img src='images/mail.gif' border='0'>您有封" & NewMailNum & "新邮件！</a>")
		End If
		%>
		<P>&nbsp;</P>
		</td>
	  </tr>
	  </tbody>
	</table>
	</td>
  </tr>
  </tbody>
</table>
<br>
</DIV>
</BODY>
</HTML>

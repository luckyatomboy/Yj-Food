<HTML><HEAD><TITLE>系统桌面</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="style/Style.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
BODY {
	MARGIN: 0px 0px; 
	BACKGROUND-COLOR: #ffffff;
}
</STYLE>
</HEAD>
<!--#include file="conn.asp"-->
<!--#include file="info/include/tools.asp"-->
<%
oabusyname=Session("EmpName")
oabusyusername=Session("ManageName")
oabusyuserdept=Session("DeptName")
session("id")=Session("EmpId")

%>
<SCRIPT language="JavaScript">
	function MM_Do(id,action){
		if(action=="delete"){
			if(confirm("确定要删除该条信息吗？\n注意：删除后不能恢复！")){
				document.frm.action="mail/DeleteInbox.asp";
			}
		}else if(action=="brow"){
			document.frm.action="mail/BrowInbox.asp";
		}

		document.frm.MailId.value=id;
		document.frm.submit();
	}
</SCRIPT>

<script language="javascript">
  function OpenSmallWindows(strURL)
  {
     window.open (strURL,"_blank",
     "status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=130,height=300,left=600,top=125");
  }
function openwinfun(hrefvalue,winname,heightvalue,widthvalue)
{
	var statusstr;
	statusstr='location=no,height='+heightvalue+', width='+widthvalue+', toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no'
	window.open(hrefvalue,winname,statusstr);
}

</script>
<BODY>
<TABLE  cellSpacing=0 cellPadding=0 width="98%" align=center class="toptable grid" border="1">
  <TBODY>
    <TR> 
      <TH class="category" colSpan=2 height=22>常 用 工 具</TH>

    <TR> 
      <TD class=forumRow width="50%" 
      height=23>&nbsp;&nbsp;<a href="tools/rl/cal.htm">万年日历</a></TD>
      <TD class=forumRow width="50%"><a href="tools/rl/time.htm">&nbsp;&nbsp;世界时间</a></TD>
    </TR>
    <TR> 
      <TD class=forumRow width="50%" 
      height=23>&nbsp;&nbsp;<a href="tools/yzqh/default.asp">邮政编码</a></TD>
      <TD class=forumRow width="50%">&nbsp;&nbsp;<a href="tools/shouji/index.asp">手机网络</a></TD>
    </TR>
    <TR>     	
      <TD class=forumRow width="50%" 
      height=23>&nbsp;&nbsp;<a href="#" onclick ="javascript:openwinfun('tools/rl/js1.html','qymlwin',400,550);">在线计算器</a></TD>
<!--    	<TD class=forumRow width="50%">&nbsp;&nbsp;<a href="system/user_modi_mima.asp">修改密码</a></TD>-->
    </TR>
    <TR>     	

  </TBODY>
</TABLE>
</BODY>
</HTML>
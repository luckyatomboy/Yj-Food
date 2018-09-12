<%@language="VBscript"%>
<%Response.Expires=0%>
<%
id=request.querystring("id")
title=request.querystring("title")
'response.write request.ServerVariables("HTTP_REFERER")
'response.write request.ServerVariables("SERVER_NAME")
'response.write request.ServerVariables("SERVER_PORT")
if request.ServerVariables("SERVER_PORT")=80 then
	host = "http://"&request.ServerVariables("SERVER_NAME")
else
	host = "http://"&request.ServerVariables("SERVER_NAME")&":"&request.ServerVariables("SERVER_PORT")
end if
url=host & "/news/docc/news_detail.asp?id="&id
%>
<title>推荐给朋友</title>
<style>
	td{font-size:13px; color: #215DC6; }
</style>
<script language="javascript">
	function doSubmit(){
		var obj=document.frmrecommend;

		if(obj.yourname.value==""){
			alert("请输入您的名字！");
			obj.yourname.focus();
			return false;
		}
		if(!isEmail(obj.yourmail.value)){
			alert("请输入您的信箱！");
			obj.yourmail.focus();
			return false;
		}
		if(!isEmail(obj.friendmail.value)){
			alert("请输入朋友的信箱！");
			obj.friendmail.focus();
			return false;
		}
	}
	//isemail
	function isEmail(vEMail){
		var regInvalid=/(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;
		var regValid=/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/;
		return (!regInvalid.test(vEMail)&&regValid.test(vEMail));
	}
</script>
<body topmargin=0 marginheight=0 leftmargin=0 marginwidth=0>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="24" background="images/bg1.gif"><font style="font-size:13px;" color="#215DC6"><b>　发邮件，推荐新闻给朋友</b></font></td>
  </tr>
</table>
<table align="center" border="0" cellpadding="1" cellspacing="1" width="90%" bgcolor="e8e8e8">
  <form name="frmrecommend" action="news_recommend_ok.asp" method="post" onsubmit="javascript:return doSubmit();">
  <input type="hidden" name="action" value="news_recommend">
  <input type="hidden" name="title" value="<%=title%>">
    <tr bgcolor="#FFFFFF"> 
      <td height="30">推荐内容：</td>
      <td><textarea readonly name="content" style="width:380px;height:60px;"><%=title%><BR><a target="_blank" href="<%=url%>"><%=url%></a></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">您的名字：</td>
      <td><input type="text" name="yourname" style="width:280px;"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">您的信箱：</td>
      <td><input type="text" name="yourmail" style="width:280px;"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">朋友信箱：</td>
      <td><input type="text" name="friendmail" style="width:280px;"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">您的留言：</td>
      <td><textarea name="yourcontent" style="width:380px;height:60px;"></textarea></td>
    </tr>
    <tr> 
      <td colspan="2" height="26" align="center"> <input type="submit" name="btnSubmit" value="确定" style="width:60px;"> 
        <input type="reset" name="btnReset" value="取消" style="width:60px;"> <input type="button" name="btnClose" onclick="javascript:window.close();" value="关闭" style="width:60px;"> 
      </td>
    </tr>
  </form>
</table>
<%@language="VBscript"%>
<%Response.Expires=0%>
<%
id=request.querystring("id")
oabusyusername=request.cookies("oabusyusername")
%>
<title>发表评论</title>
<style>
	td{font-size:13px; color: #215DC6; }
</style>
<script language="javascript">
	function doSubmit(){
		var obj=document.frmrecommend;

		if(obj.content.value==""){
			alert("请输入评论内容！");
			obj.content.focus();
			return false;
		}
	}
</script>
<body topmargin=0 marginheight=0 leftmargin=0 marginwidth=0>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="24" background="images/bg1.gif"><font style="font-size:13px;" color="#215DC6"><b>　发表评论</b></font></td>
  </tr>
</table>
<table align="center" border="0" cellpadding="1" cellspacing="1" width="90%" bgcolor="e8e8e8">
  <form name="frmrecommend" action="news_review_ok.asp" method="post" onsubmit="javascript:return doSubmit();">
  <input type="hidden" name="action" value="news_review">
  <input type="hidden" name="id" value="<%=request.querystring("id")%>">
    <tr bgcolor="#FFFFFF"> 
      <td height="30" width="120">评论内容：</td>
      <td><textarea name="content" style="width:380px;height:60px;"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">您的名字：</td>
      <td><input type="text" name="yourname" value="<%=Session("ManageName")%>" style="width:280px;" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">您的信箱：</td>
      <td><input type="text" name="yourmail" style="width:280px;"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2" height="26" align="center"> <input type="submit" name="btnSubmit" value="确定" style="width:60px;"> 
        <input type="reset" name="btnReset" value="取消" style="width:60px;"> <input type="button" name="btnClose" onclick="javascript:window.close();" value="关闭" style="width:60px;"> 
      </td>
    </tr>
  </form>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="24" background="images/bg1.gif"><font style="font-size:13px;" color="#215DC6"><b>　注意</b></font></td>
  </tr>
</table>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
  <tr> 
    <td height="109" bgcolor="#FFFFFF"><font color=#7B7B7B>· 尊重网上道德，遵守《全国人大常委会关于维护互联网安全的决定》及中华人民共和国其他各项有关法律法规<br>
      · 尊重网上道德，遵守中华人民共和国的各项有关法律法规<br>
      · 承担一切因您的行为而直接或间接导致的民事或刑事法律责任<br>
      · 新闻留言板管理人员有权保留或删除其管辖留言中的任意内容 <br>
      · 您在留言板发表的作品，有权在网站内转载或引用<br>
      · 参与本留言即表明您已经阅读并接受上述条款 </font></td>
  </tr>
</table>

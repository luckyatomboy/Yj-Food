<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"--><!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<%
id=request.querystring("id")
if id="" or isnull(id) or not isnumeric(id) then
	response.write("<p align=center>信息编号错误！</p>")
	response.end
end if
set rs=conn.execute("select * from tbl_news where id="&id)
if rs.eof then
	response.write("<p align=center>信息不存在或者信息已经被删除！</p>")
	response.end
end if
conn.execute "update tbl_news set hits=hits+1 where id="&id
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>信息发布系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function doZoom(size){
		document.getElementById('zoom').style.fontSize=size+'px';
	}
	function doRecommend(id,title){//2.0弹出显示 
		mewin=window.open("news_recommend.asp?id="+id+"&title="+title,"recommend","menubar=no,toolsbar=no,scrollbars=0,top=100,left=100,width=544,height=320,location=no");
		mewin.focus();
	}
	function doReview(id){//2.0弹出显示 
		mewin=window.open("news_review.asp?id="+id,"review","menubar=no,toolsbar=no,scrollbars=0,top=100,left=100,width=544,height=420,location=no");
		mewin.focus();
	}
</script>
</head>

<body>
<br>
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    
  </tr>
</table>
<table width="550" height="243" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="e8e8e8">
  <tr> 
    
		<table align="center" border="0" width="96%">
		  <tr>
			<td height="26" align="center"><b style="font-size:15px;"><%=rs("title")%><b></td>
		  </tr>
		  <tr>
			<td height="26" align="center"><%=rs("regdate")%></td>
		  </tr>
		  <tr>
			<td height="1" bgcolor="#D6DFF7"></td>
		  </tr>
		  <tr>
			<td height="26" align="center">
			<%if rs("imgname")<>"" then%>
			<img src="../newsimgages/<%=rs("imgname")%>">
			<%end if%>
			</td>
		  </tr>
		  <tr>
			<td id="zoom" height="26"><%=txt2html(rs("content"))%></td>
		  </tr>
		  <tr>
			<td height="26" align="right">【<a href="javascript:doReview(<%=id%>);">评论</a>】【<a href="javascript:doZoom(16);">大</a> <a href="javascript:doZoom(14);">中</a> <a href="javascript:doZoom(12);">小</a>】【<a href="javascript:window.print();">打印</a>】【<a href="JavaScript:history.go(-1);">返回</a>】</td>
		  </tr>
		</table>
    </td>
  </tr>
</table>
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    
  </tr>
</table>
<br>
</body>
</html>

<%@LANGUAGE="VBScript" CODEPAGE="936"%>
<!--#include file="Config.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla95="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
set conn=nothing
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>oa</title>
<link href="upstyle.css" rel="stylesheet" type="text/css">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script src="Images/up.Js"></script>
<style>
<!--
#glowtext{
filter:glow(color=Black,strength=2);
width:100%;
}
-->
</style>
<script language="JavaScript1.2">
function glowit(which){
if (document.all.glowtext[which].filters[0].strength==2)
document.all.glowtext[which].filters[0].strength=1
else
document.all.glowtext[which].filters[0].strength=2
}
function glowit2(which){
if (document.all.glowtext.filters[0].strength==2)
document.all.glowtext.filters[0].strength=1
else
document.all.glowtext.filters[0].strength=2
}
function startglowing(){
if (document.all.glowtext&&glowtext.length){
for (i=0;i<glowtext.length;i++)
eval('setInterval("glowit('+i+')",150)')
}
else if (glowtext)
setInterval("glowit2(0)",150)
}
if (document.all)
window.onload=startglowing
</script>
</head>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;文件管理</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF"  topmargin="0" leftmargin="0" " >

<table border="0" width="100%">
  <tr>
    <td width="80%"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#0153A3"><tr class="text"> 
          
    <td align="center" bgcolor="#FFFFFF" width="487"><span id="glowtext"></span></td>
        </tr>
  <tr class="text"> 
          
    <td align="center" bgcolor="#FFFFFF" width="487">[ <a href="index.asp">返回首页</a>      
      ] [<a href="Admin_main.asp"> 系统设置</a> ]&nbsp;</td>     
        </tr>
<form name="del" action="del.asp" method="post">
  <tr> 
    <td height="25" bgcolor="#FFFFFF" width="90%"> <%
	set frst = Server.CreateObject("adodb.recordset")
	sql = "select * from info order by uploadtime desc"
	frst.open sql,myconn,1,1
	fcount = frst.recordcount
	if fcount > 0 then 	
		''显示参数
		dim tbbgcolor
		''分页参数
		dim maxperpage,pages,page
		maxperpage = 15
		frst.pagesize = maxperpage
		pages = frst.pagecount
		''页面参数设置
		page = Request.QueryString("page")
		if not isnumeric(page) then page = 1 else page = cint(page)
		if page < 1 then page = 1
		if page > pages then page = pages
		frst.absolutepage = page
		''显示内容
'Set Isize=Server.CreateObject("WinImg.ImgSize")
		for i = 1 to maxperpage
			if frst.eof then exit for
			if i mod 2 = 0 then tbbgcolor = "" else tbbgcolor = "#0066cc"
			fid = frst("id").Value
			ftitle = frst("fileTitle").Value
			fdesc = frst("fileDesc").Value
			ftype = frst("fileType").Value
			fpath = frst("filePath").Value
			fsize = frst("filesize").Value
			fhits = frst("hits").Value
			fuploadtime = frst("uploadTime").Value
'FileNameStr=Server.Mappath(fpath)
'Isize.GetImgSize Cstr(FileNameStr)
	%>
      <table width="87%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr class="text"> 
          <td width="63"><div align="right"><img border="0" src="Images/isexists.gif" width="16" height="16"> 
              文件名称：</div></td>
          <td width="162"><a href="<%=fpath%>" target="_NEWwIN"><%=ftitle%>( 文件大小： bytes)</a> </td>        
          <td width="147">删除         
              <input type="checkbox" name="DelID" value="<%=fid&"|"&fpath%>">
          </td>
        </tr>
        <tr class="text"> 
          <td width="63"><div align="right">文件类型：</div></td>
          <td width="162"><%=ftype%><a href="<%=fpath%>" target="_NEWwIN"><%=fsize%></a> </td>
            <td width="147"></td>
        </tr>
        <tr class="text"> 
          <td width="63"><div align="right">上传日期：</div></td>
          <td width="162"><%=fuploadtime%></td>
            <td width="147"></td>
        </tr>
        <tr class="text"> 
          <td width="63"><div align="right">说明：</div></td>
          <td colspan="2" width="317"><%=fdesc%>1</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td height="1" width="63"></td>
          <td height="1" colspan="2" width="317"></td>
        </tr>
      </table>
      <%
		  	frst.movenext
		next
	  else
	  %> 
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr class="text"> 
          <td bgcolor="#336699"><font color="#FFFFFF">还没有上传的内容！</font></td>
        </tr>
      </table>
      <%
	  end if
	  frst.close
	  set frst = nothing
	  myconn.close
	  set myconn = nothing
	  %>
	  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr class="text"> 
            <td align="right" class="heading">有<img src="Images/isexists.gif" width="16" height="16">标记则代表文件存在        
              <%
		  If Page > 2 Then Response.Write ("<a href='?page=1'>首页</a><a href='?page="& Page - 1 &"'>上一页</a>")
		  If page < pages Then Response.Write ("&nbsp;<a href='?page="& Page + 1 &"'>下一页</a>&nbsp;<a href='?page="& Pages &"'>末页</a>")
		  %>
            选中所有<input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)>       
              <input type="submit" name="Submit" value="删除所选">   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        </tr>
      </table></td>
  </tr></form>
</table>
</td>
  </tr>
  <tr>
    <td width="66%"></td>
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

</body>
</html>

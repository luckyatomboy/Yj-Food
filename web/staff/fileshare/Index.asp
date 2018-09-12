<%@LANGUAGE="VBScript" CODEPAGE="936"%>
<!--#include file="Config.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla94="0" and session("redboy_id")<>"1" then
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
<link href="../gbook/style.css" rel="stylesheet" type="text/css">
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

<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF"  topmargin="0" leftmargin="0" " >


<script>

var currentpos,timer; 


function initialize() 

{ 

timer=setInterval("scrollwindow()",10);

} 

function sc(){

clearInterval(timer); 

}

function scrollwindow() 

{ 

currentpos=document.body.scrollTop; 

window.scroll(0,++currentpos); 

if (currentpos != document.body.scrollTop) 

sc();

} 

document.onmousedown=sc

document.ondblclick=initialize</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;文件共享</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" height="74">
  <tr> 
    <td height="2" bgcolor="#FFFFFF" class="text" width="776" colspan="4">
      <p align="center"><span id="glowtext"></span>
    </td>
  </tr>
  <tr> 
    <td height="52" bgcolor="#FFFFFF" width="521" rowspan="2" valign="top">
      <p align="left">       
      <img border="0" src="images/fileshare1.gif">
    </td>
    <td height="34" bgcolor="#FFFFFF" width="87" >
      <p align="center"><a href="index.asp"><img border="0" src="Images/filemana.gif">     
      </a>     
    </td>
    <td height="34" bgcolor="#FFFFFF" width="87" >
      <p align="center"><a onclick=window.open("up.asp",null,"toolsbar=no,statusbar=no,resizable=no,scrollbars=no,width=500,height=258")><img border="0" src="Images/soft.gif"></a>         
    </td>
    <td height="34" bgcolor="#FFFFFF" width="87" >
      <p align="center"><%

%>
<%
%>       
    </td>
    <td height="52" bgcolor="#FFFFFF" width="33" rowspan="2" >
      　       
    </td>
  </tr>
  <tr>
    <td height="18" bgcolor="#FFFFFF" width="87" >
      <p align="center"><a href="index.asp">刷新本页</a></p>
    </td>
    <td height="18" bgcolor="#FFFFFF" width="87" >
      <p align="center"><a onclick=window.open("up.asp",null,"toolsbar=no,statusbar=no,resizable=no,scrollbars=no,width=500,height=258")>文件上传</a>       
    </td>

    <td height="18" bgcolor="#FFFFFF" width="87" >

    </td>
  </tr>
  <tr> 
    <td height="10" bgcolor="#FFFFFF" class="text" width="776" colspan="4">
      <hr color="#FFFFFF" size="1">
    </td>
  </tr>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#0153A3">
  <tr> 
    <td height="25" bgcolor="#FFFFFF"> <%
	set frst = Server.CreateObject("adodb.recordset")
	sql = "select * from info order by uploadtime desc"
	frst.open sql,myconn,1,1
	fcount = frst.recordcount
	if fcount > 0 then 	
		''显示参数
		dim tbbgcolor
		''分页参数
		dim maxperpage,pages,page
		maxperpage = 10
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
      <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" height="40">
        <tr class="text"> 
          <td width="53" bgcolor="#FFFFFF" height="21">&nbsp; <img border="0" src="images/arrow_yellow.gif"></td>    
          <td width="166" bgcolor="#FFFFFF" height="21"><div align="right">文件名称：</div></td>
          <td bgcolor="#FFFFFF" width="186" height="21"><a href="<%=fpath%>" target="_NEWwIN"><%=ftitle%>（<font color="#7BAAE7">点击下载</font>）</a> </td>                                
          <td bgcolor="#FFFFFF" width="77" height="21">文件大小： </td>                             
          <td bgcolor="#FFFFFF" width="161" height="21"><%=fsize%>字节 </td>                             
          <td bgcolor="#FFFFFF" width="76" height="21">文件类型： </td>                         
          <td bgcolor="#FFFFFF" width="188" height="21"><%=ftype%> </td>                         
        </tr>
        <tr class="text"> 
          <td width="53" bgcolor="#E7EBF7" height="21">　</td>
          <td width="166" bgcolor="#E7EBF7" height="21"><div align="right">文件说明：</div></td>
          <td bgcolor="#E7EBF7" width="406" colspan="3" height="21"><%=fdesc%></td>
          <td bgcolor="#E7EBF7" width="76" height="21">上传日期：</td>
          <td bgcolor="#E7EBF7" width="188" height="21"><%=fuploadtime%></td>
        </tr>
      </table>
      <%
		  	frst.movenext
		next
	  else
	  %> 
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr class="text"> 
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp; 目前还没有上传的文件！</td>
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
          <td align="right">
<%
		  If Page > 1 Then Response.Write ("<a href='?page=1'>首页</a><a href='?page="& Page - 1 &"'>上一页</a>")
		  If page < pages Then Response.Write ("&nbsp;<a href='?page="& Page + 1 &"'>下一页</a>&nbsp;<a href='?page="& Pages &"'>末页</a>")
		  %></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#003366">
  <tr> 
    <td height="25" bgcolor="#FFFFFF">
        　
      </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

</body>
</html>

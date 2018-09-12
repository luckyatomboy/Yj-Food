<%@LANGUAGE="VBScript" CODEPAGE="936"%>
<!--#include file="Config.asp"-->
<%
session("Admin") = ""
%>
<html>
<head>
<title>添加附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link href="../gbook/style.css" rel="stylesheet" type="text/css">
<script src="Images/up.Js"></script>
</head>


<body bgcolor="#FFFFFF" text="#000000"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="images/mainSkinBG.gif" >

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

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="45" style="background-image: url('images/pageHeaderBG_Details.gif'); background-repeat: no-repeat; background-attachment: fixed; background-color: left; background-position: top 50%">
  <tr>
      <td colspan=4 align="center" class="Shadow_white_14px" nowrap background="images/pageHeaderBG_Details.gif"><font color="#BB2F00">上 
        传 文 件</font></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#336699" height="1"></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF" height="1" bordercolor="#FFFFFF"></td>
  </tr>
</table>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center" bgcolor="#F0F0F0" bordercolor="#FFFFFF">
 <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#006699"><form action="SaveUpload.asp" method="post" enctype="multipart/form-data" name="form1">
          <tr bgcolor="#006699" class="text"> 
            <td width="33%" height="25" bordercolor="#FFFFFF" bgcolor="#FFFFFF"> <div align="left">　
		</div></td>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><%
		Response.Write "  允许上传的文件类型: "
		Set Fs = Server.CreateObject("Scripting.FileSystemObject")
		For Each str In OKAr
		If Fs.FileExists(Server.MapPath("Images\"& Str &".gif")) Then
		Response.Write "<img src='Images/" & str & ".gif' alt='" & str & "文件'> "
		Else
		Response.Write "<img src='Images/X.gif' alt='" & str & "文件'> "
		End If
		Next
		Set Fs = Nothing
		Response.Write "<br>  允许上传的文件最大:"&Oksize / 1024&"KB"
		%></td>
          </tr>
          <tr class="text"> 
            <td width="33%" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="right"><strong>文件名称：</strong></div></td>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="filetitle" type="text" class="TextBoxT" size="27"> 
              <select name="filetype" class="TextBoxT" id="filetype" size="1"> 
                <option value="图片">图片</option>
                <option value="文档">文档</option>
                <option value="资料">资料</option>
              </select> </td>
          </tr>
          <tr class="text"> 
            <td valign="top" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><div align="right"><strong>上传文件：</strong></div></td>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="filedata" type="file" class="TextBoxT" id="filedata" size="27"></td>
          </tr>
          <tr class="text"> 
            <td valign="top" bordercolor="#FFFFFF" bgcolor="#FFFFFF"> <div align="right"><strong>文件说明：</strong><br>
              </div></td>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><textarea name="filedesc" cols="36" rows="4" class="TextBoxT" id="filedesc"></textarea></td>
          </tr>
          <tr> 
            <td bgcolor="#336699" bordercolor="#FFFFFF">&nbsp;</td>
            <td bgcolor="#336699" bordercolor="#FFFFFF"><input type="submit" name="Submit" value="上传文件"></td>
          </tr></form>
        </table>
      </td>
  </tr>
</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f7f7f7">
	  <tr> 
	    <td bgcolor="#999999" height="1"></td>
	  </tr>
	  <tr> 
	    <td bgcolor="#FFFFFF" height="1"></td>
	  </tr>
	
	</table>
</form>
</body>
</html>






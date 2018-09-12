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

<!--#include file="Config.asp"-->
<%
Dim GetID,ID
GetID = split(Trim(Request.Form("DelID")),",")
Set Fs = Server.CreateObject("Scripting.FileSystemObject")
For each Str in GetID
VarStr = Split(Str,"|")
ID = VarStr(0)
Path = VarStr(1)
myconn.execute("Delete From Info Where ID="&ID)
If Fs.FileExists(server.mappath(Path)) Then
Set Os = Fs.GetFile(server.mappath(Path))
Os.Delete
Response.Write Path&"已被删除！<br>"
Else
Response.Write Path&"此图片不存在！数据已被删除<br>"
End If
Next
%>

<head>
<meta http-equiv="refresh" content="0;URL=Admin_List.asp">
<link href="upstyle.css" rel="stylesheet" type="text/css">
<title>oa</title>
</head>

<body bgcolor="#FFFFFF">
<p align="center">
<span class=smtext>本页将在3秒后返回<br>
如果您的浏览器没有反应，请<a href=Admin_List.asp><font color=000000><b>点击此处返回</b></font></a></span>
<p align="center">　</p>
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
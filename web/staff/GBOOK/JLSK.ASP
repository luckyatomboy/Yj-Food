<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<meta http-equiv="REFRESH" content="<%=reset%>">
<title></title>
</head>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线论坛</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

<table width="778" height="367" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td background="im/TABLE3.gif" bgcolor="#FFFFFF"> 
      <table width="760" border="0" cellspacing="0" cellpadding="0">
        <tr valign="bottom"> 
          <td width="419" height="20" colspan="2"> 
          </td>
          <td width="341" height="20" colspan="3"> 
          </td>
        </tr>
        <tr valign="bottom"> 
          <td width="419" height="20" colspan="2"> 
            <p align="left"><img border="0" src="im/header_NewBulletin.gif"></td>
          <td width="341" height="20" colspan="3"> 
            <p align="center"><a href="write.asp"><img border="0" src="im/write.gif"> 
            发表新留言</a></td>
        </tr>
        <tr valign="bottom"> 
          <td width="760" height="20" colspan="5"> 
          </td>
        </tr>
        <tr valign="bottom"> 
          <td width="40" height="20"> 
            <div align="center">状态</div></td>
          <td width="380"> 
            <div align="center">主题</div></td>
          <td width="120"> 
            <div align="center">作者</div></td>
          <td width="100"> 
            <div align="center">回复/浏览</div></td>
          <td width="120"> 
            <div align="center">更新时间</div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td valign="top" bgcolor="#FFFFFF"> 
      <%If request("PageNo")="" then
   PageNo=1
Else
   PageNo=request("PageNo")
End If

if request("ssql")<>"" then
  sql=request("ssql")
else
sql="SELECT * from body order by lasttime desc"
end if
rs.open sql,conn,1,3
rs.Pagesize=30
if rs.eof then
PageNo=0
else
rs.absolutepage=PageNo
end if
x = 0  
For x = 1 to rs.Pagesize
If rs.eof then
Exit For  
Else%>
      <table width="760" border="0" cellpadding="0" cellspacing="0">
        <tr bgcolor="f6f9ff"> 
          <td width="40" height="30"> 
            <div align="center"> 
              <%if rs("time")>date and rs("lasttime")=rs("time") then'绿色
response.write "<img src=im/new.gif alt=今日新贴>"
end if
if rs("time")<date and rs("lasttime")<date then'黄色
response.write "<img src=im/old.gif alt=非今日贴>"
end if
if rs("lasttime")>date and rs("lasttime")>rs("time") then'红色
response.write "<img src=im/re.gif alt=今日回复>"
end if%>
            </div></td>
          <td width="380"><A HREF="body.asp?id=<%=rs("id")%>" title="<%="内容："&left(rs("body"),50)&"……"%>"></A> 
            <table border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><a href="body.asp?id=<%=rs("id")%>" title="<%="内容："&left(rs("body"),50)&"……"%>"><%=server.htmlencode(trim(rs("title")))%></a></td>
                <td>　</td>
                <td> 
                  <%x=0
if x=0 then Medium=""
if instr(rs("body"),"[IMG]")<>0 and instr(rs("body"),"[/IMG]")<>0 and instr(rs("body"),"[IMG]")<instr(rs("body"),"[/IMG]") then
  x=cint(x)+1
  if x=1 then Medium="<img src=images/type_img.gif alt=Image>"
end if
if instr(rs("body"),"[MP]")<>0 and instr(rs("body"),"[/MP]")<>0 and instr(rs("body"),"[MP]")<instr(rs("body"),"[/MP]") then
  x=cint(x)+1
  if x=1 then Medium="<img src=images/type_mp.gif alt=Media>"
end if
if instr(rs("body"),"[RM=")<>0 and instr(rs("body"),",")<>0 and instr(rs("body"),"]")<>0 and instr(rs("body"),"[/RM]")<>0 and instr(rs("body"),"[RM=")<instr(rs("body"),",") and instr(rs("body"),",")<instr(rs("body"),"]") and instr(rs("body"),"]")<instr(rs("body"),"[/RM]") then
  x=cint(x)+1
  if x=1 then Medium="<img src=images/type_rm.gif alt=Real>"
end if
if instr(rs("body"),"[FLASH=")<>0 and instr(rs("body"),",")<>0 and instr(rs("body"),"]")<>0 and instr(rs("body"),"[/FLASH]")<>0 and instr(rs("body"),"[FLASH=")<instr(rs("body"),",") and instr(rs("body"),",")<instr(rs("body"),"]") and instr(rs("body"),"]")<instr(rs("body"),"[/FLASH]") then
  x=cint(x)+1
  if x=1 then Medium="<img src=images/type_flash.gif alt=Flash>"
end if
if x>1 then Medium="<img src=images/type_some.gif alt=some>"
response.write Medium
%>
                </td>
              </tr>
            </table>
          </td>
          <td width="120""> 
            <div align="center"><%=server.htmlencode(trim(rs("writer")))%></div></td>
          <td width="100"> 
            <div align="center"><%=rs("recount")%>/<%=rs("lookcount")%></div></td>
          <td width="120"><%=rs("lasttime")%></td>
        </tr>
      </table>
      <%rs.MoveNext  
End If  
Next
%>
    </td>
  </tr>
  <tr> 
    <td height="32" background="im/TABLE4.gif" bgcolor="#FFFFFF"> 
      <table width="760" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="40" height="20"> 
            <div align="center">状态</div></td>
          <td width="380"> 
            <div align="center">主题</div></td>
          <td width="120"> 
            <div align="center">作者</div></td>
          <td width="100"> 
            <div align="center">回复/浏览</div></td>
          <td width="120"> 
            <div align="center">更新时间</div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <table width="760" height="35" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="35"> 
            <div align="center">共<%=rs.recordcount%>条留言，<%=PageNo%>/<%=Int(rs.pagecount)%>页，        
              每页<%=rs.Pagesize%>。<span lang="zh-cn"><a href="jlsk.asp?PageNo=1">首页</a> 
              <%If PageNo > 1 then       
%>
              <a href="jlsk.asp?PageNo=<%=PageNo-1%>">上一页</a>        
              <%       
Else  
    response.write " "  
End If  
If int(PageNo)<>Int(rs.pagecount) then%>
              <a href="jlsk.asp?PageNo=<%=PageNo+1%>">下一页</a>        
              <%Else         
    response.write " "  
End If %>
              <a href="jlsk.asp?PageNo=<%=Int(rs.pagecount)%>">尾页</a>        
              <%rs.close%>       
            </div></span></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="12" bgcolor="#FFFFFF"> 
      <div align="center"> </div></td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="40">
  <tr> 
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

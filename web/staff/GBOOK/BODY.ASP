
<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->

<%
oabusyname=Session("ManageName")
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
function admin(text,url)
{
if(confirm(text)){location=url}
}
</SCRIPT>
</head>

<body  topmargin="0">
<div align="center"></div>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="778" valign="top"> 
      <%id=request("id")
sql="SELECT * from body where id ="&id&""
rs.open sql,conn,1,3
rs("lookcount")=cint(rs("lookcount"))+1
rs.update
zt=rs("title")
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线论坛-回复</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>

      <table width="760" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="760" colspan="2" height="20"> </td>
        </tr>
        <tr> 
          <td width="760" colspan="2"> <img border="0" src="im/header_NewBulletin.gif">&nbsp;&nbsp;&nbsp; 
            <a href="write.asp"><img border="0" src="im/write.gif"> 
            发表新留言</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="jlsk.asp"><img border="0" src="im/old.gif"> 
            回讨论区首页</a></td>
        </tr>
        <tr> 
          <td width="760" colspan="2" height="15"> </td>
        </tr>
        <tr> 
          <td width="210"> <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="178" height="20">作者：<%=server.htmlencode(trim(rs("writer")))%></td>
              </tr>
            </table></td>
          <td width="550"> <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="576" height="20">主题：<%=server.htmlencode(trim(rs("title")))%>&nbsp;    
                  
                </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td valign="top"> <table width="217" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="217"><table width="183" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="178" height="20">IP&nbsp;&nbsp; ：<%=rs("ip")%>    
                        <%if session("admin")<>"" then%>   
                        <a onclick='admin("你确定要屏蔽此用户吗","lockip.asp?ip=<%=rs("ip")%>")' onMouseMove="this.style.cursor='hand'"></a>    
                        <%end if%>   
                      </td>
                    </tr>
                    <tr> 
                      <td height="20">Time ：<%=rs("time")%></td>   
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td valign="top" style="word-wrap:break-word;word-break:break-all;width:550;"> 
                  <%nr=rs("body")'输出代码转换
nr=server.htmlencode(trim(nr))
nr=replace(nr,chr(32),"&nbsp;")
nr=replace(nr,chr(13)&chr(10),"<br>")

Function img(Str)
     do while instr(str,"[IMG]")<>0 and instr(str,"[/IMG]")<>0 and instr(str,"[IMG]")<instr(str,"[/IMG]")
       str=replace(str,"[IMG]","<IMG SRC=")
       str=replace(str,"[/IMG]",">")
     loop
     img=str
   End Function
   nr= img(nr)

   Function url(Str)
     do while instr(str,"[URL]")<>0 and instr(str,"[/URL]")<>0 and instr(str,"[URL]")<instr(str,"[/URL]")
       first=instr(str,"[URL]")
       last= instr(str,"[/URL]")
       strold= mid(str,first,last-first+6)
       strurl= mid(strold,6,last-first-5)
       strnew= "<A target=_blank HREF=" & strurl & "><B>" & strurl & "</B></A>"
       str=replace(str,strold,strnew)
     loop
     url=str
   End Function
   nr= url(nr)
   
   Function mp(Str)
     do while instr(str,"[MP]")<>0 and instr(str,"[/MP]")<>0 and instr(str,"[MP]")<instr(str,"[/MP]")
       str=replace(str,"[MP]","<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer><param name=ShowStatusBar value=-1><param name=Filename value=")
       str=replace(str,"[/MP]","></object>")
     loop
     mp=str
   End Function
   nr= mp(nr)
   
   Function rm(Str)
     do while instr(str,"[RM=")<>0 and instr(str,",")<>0 and instr(str,"]")<>0 and instr(str,"[/RM]")<>0 and instr(str,"[RM=")<instr(str,",") and instr(str,",")<instr(str,"]") and instr(str,"]")<instr(str,"[/RM]")
       first=instr(str,"[RM=")
       last= instr(str,"[/RM]")
       width=mid(str,first+4,instr(str,",")-first-4)
       str=replace(str,"[RM=","<br><object classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=")
       str=replace(str,","," height=")
       str=replace(str,"[/RM]","><param name=CONSOLE value=Clip1><param name=CONTROLS value=imagewindow><param name=AUTOSTART value=true></object><br><object classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA id=video2 width="&width&" height=32><param name=AUTOSTART value=-1><param name=CONTROLS value=controlpanel><param name=CONSOLE value=Clip1></object><br>")
       str=replace(str,"]","><param name=SRC value=")
     loop
     rm=str
   End Function
   nr= rm(nr)
   
   Function flash(Str)
     do while instr(str,"[FLASH=")<>0 and instr(str,",")<>0 and instr(str,"]")<>0 and instr(str,"[/FLASH]")<>0 and instr(str,"[FLASH=")<instr(str,",") and instr(str,",")<instr(str,"]") and instr(str,"]")<instr(str,"[/FLASH]")
       first=instr(str,"[FLASH=")
       last= instr(str,"[/FLASH]")
       str=replace(str,","," height=")
       str=replace(str,"[FLASH=","<object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0 width=")
       str=replace(str,"[/FLASH]","><param name=quality value=high></object>")
       str=replace(str,"]","><param name=movie value=")
     loop
     flash=str
   End Function
   nr= flash(nr)

response.write nr
%>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <%rs.close
sql="SELECT * from re where reid ="&id&" order by retime"
rs.open sql,conn,1,3
color_bg=bgcolor
color_border=tablecolor
do while not rs.eof
  if color_bg=tablecolor then
    color_bg=bgcolor
  else
    color_bg=tablecolor
  end if

  if color_border=tablecolor then
    color_border=bgcolor
  else
    color_border=tablecolor
  end if
%>
      <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFCC">
        <tr> 
          <td width="204"> <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="178" height="20">作者：<%=server.htmlencode(trim(rs("rewriter")))%></td>
              </tr>
            </table></td>
          <td width="556"> <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="576" height="20">RE：<%=server.htmlencode(trim(zt))%>&nbsp;    
                  <%if session("admin")<>"" then%>
                  <a onclick='admin("你确定要删除此回复吗?","delone.asp?bodyid=<%=rs("id")%>&id=<%=id%>")' onMouseMove="this.style.cursor='hand'"><font color="#CC0000">[删除]</font></a>    
                  <%end if%>   
                  <%if session("admin")<>"" then%>   
                  <a onclick='admin("你确定要删除此回复吗?","delone.asp?bodyid=<%=rs("id")%>&id=<%=id%>")' onMouseMove="this.style.cursor='hand'"><font color="#CC0000">[</font></a><a onclick="location.href='editone.asp?bodyid=<%=rs("id")%>'" onMouseMove="this.style.cursor='hand'"><font color="#CC0000">修改</font></a><a onclick='admin("你确定要删除此回复吗?","delone.asp?bodyid=<%=rs("id")%>&id=<%=id%>")' onMouseMove="this.style.cursor='hand'"><font color="#CC0000">]</font></a>    
                  <%end if%>   
                </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td valign="top"> <table width="177" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="178" height="20">IP&nbsp; ：<%=rs("reip")%>    
                  <%if session("admin")<>"" then%>   
                  <a onclick='admin("你确定要屏蔽此用户吗","lockip.asp?ip=<%=rs("reip")%>")' onMouseMove="this.style.cursor='hand'"></a>    
                  <%end if%>   
                </td>
              </tr>
              <tr> 
                <td height="20">Time：<%=rs("retime")%></td>
              </tr>
            </table></td>
          <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
            <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td style="word-wrap:break-word;word-break:break-all;width:550;" valign="top">
                  <%re=rs("rebody")
re=server.htmlencode(trim(re))
re=replace(re,chr(32),"&nbsp;")'转换段落
re=replace(re,chr(13)&chr(10),"<br>")
response.write re%>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <%
rs.movenext
loop 
rs.close
%>
      <table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <form name="form1" method="post" action="re.asp?id=<%=id%>" onSubmit="form1.Submit.disabled=true">
            <td width="760"> <table width="760" border="0" cellpadding="0" cellspacing="0" bordercolor="<%=tablecolor%>">
                <tr> 
                  <td width="205"> <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="178" height="20"><strong><font color="#990000">回复这个留言</font></strong></td>
                      </tr>
                    </table></td>
                  <td width="555"> <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="576" height="20">RE：<%=server.htmlencode(trim(zt))%></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="178" height="20">作者:                      
                     <select size="1" name="textfield">
                      <option value="<%=oabusyname%>"><%=oabusyname%></option>
                      &nbsp; 
                      </select>
                   
                        </td>
                      </tr>
                    </table></td>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="576" valign="top"><textarea name="textarea" cols="70" rows="5"></textarea> 
                          <input type="submit" name="Submit" value="回复"> <input type="reset" name="Submit2" value="重置">    
                        </td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <table width="760" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="760">&nbsp;</td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp; </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="40">
  <tr> 
  </tr>
</table>
</body>

<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->
<%
oabusyname=Session("ManageName")
%>

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
<%
if request("hiddenField")<>"" then
   function k(str,name,size)'isSize
     k=str
     if str="" then
        call errmsg(name&"不能为空")
     end if
     if len(str)>size then
        call errmsg(name&"字符宽度不能大于"& size)
     end if
   end function

   zz=k(request("zz"),"作者",10)
   zt=k(request("zt"),"主题",25)
   nr=k(request("nr"),"内容",10000)
   
   sql="SELECT * from body"
   rs.open sql,conn,1,3
   rs.addnew
   rs("writer")=zz
   rs("title")=zt
   rs("body")=nr
   rs("ip")=request.servervariables("remote_addr")
   rs.update
   rs.close
   session("user")=zz
   response.redirect"jlsk.asp"
response.end
end if
%>
<SCRIPT LANGUAGE="JavaScript">
function insert(name,left,right)
{
var text=prompt("请输入"+name+"地址","");
if(text){form1.textarea.value=form1.textarea.value+left+text+right}
}
function insert2(name,left,right,size)
{
var text2=prompt("请输入"+name+"宽度，高度",size);
if (text2){
  var text=prompt("请输入"+name+"地址","");
  if(text){form1.textarea.value=form1.textarea.value+left+text2+"]"+text+right}
  }
}
</SCRIPT>
</head>

<body  topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;发表留言</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td> </td>
  </tr>
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="20"></td>
        </tr>
        <tr> 
          <td><img border="0" src="im/header_NewBulletin.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
            <a href="jlsk.asp"><img border="0" src="im/old.gif"> 
            回讨论中心首页</a></td>    
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
      </table>
      <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <form name="form1" method="post" action="" onSubmit="form1.Submit.disabled=true">
            <td> <table border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="42" height="23"> 主题： </td>
                  <td> <input name="zt" type="text" id="zt" size="48" maxlength="25">
                    作者：&nbsp;                         
                     <select size="1" name="zz">
                      <option value="<%=oabusyname%>" selected><%=oabusyname%></option>
                      &nbsp; </select>
                   
                  </td>
                </tr>
                <tr> 
                  <td height="13">&nbsp;</td>
                  <td><img src="im/type_img.gif" width="13" height="16" alt="Image" onClick='insert("图片","[IMG]","[/IMG]")' onMouseMove="this.style.cursor='hand'">&nbsp; 
                    <img src="im/type_url.gif" alt="URL" width="16" height="16" onClick='insert("链接","[URL]","[/URL]")' onMouseMove="this.style.cursor='hand'">&nbsp; 
                    <img src="im/type_flash.gif" width="13" height="16" alt="Flash" onClick='insert2("Flash","[FLASH=","[/FLASH]","500,300")' onMouseMove="this.style.cursor='hand'">&nbsp; 
                    <img src="im/type_rm.gif" width="16" height="16" alt="Real" onClick='insert2("Real","[RM=","[/RM]","352,288")' onMouseMove="this.style.cursor='hand'">&nbsp; 
                    <img src="im/type_mp.gif" width="16" height="16" alt="Media" onClick='insert("Media","[MP]","[/MP]")' onMouseMove="this.style.cursor='hand'"> 
                  </td>
                </tr>
                <tr> 
                  <td height="60" valign="top">内容：</td>
                  <td valign="top"> <textarea name="nr" cols="77" rows="10" id="textarea"></textarea></td>
                </tr>
                <tr> 
                  <td height="25" valign="top">　</td>
                  <td> <input type="submit" name="Submit" value="留言"> <input type="reset" name="Submit22" value="重置"> 
                    <input name="hiddenField" type="hidden" value="hiddenField"> 
                  </td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>　</td>
        </tr>
      </table></td>
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
      <td>&nbsp;</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

</body>

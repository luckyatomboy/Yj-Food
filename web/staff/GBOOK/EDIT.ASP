<!--#include file="admin_yz.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->
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
<%
if request("Submit")<>"" then
   function k(str,name,size)
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
   
   sql="SELECT * from body where id="&request("id")&""
   rs.open sql,conn,1,3
   rs("writer")=zz
   rs("title")=zt
   rs("body")=nr
   rs.update
   rs.close
   response.redirect"body2.asp?id="&request("id")
response.end
end if
%>
<%
sql="select * from body where id="&request("id")&""
rs.open sql,conn,1,3
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
<body >
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td> 
       </td>
  </tr>
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table> 
      <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <form name="form1" method="post" action="">
            <td>
<table border="0" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="42" height="23"> 主题： </td>
                  <td>
<input name="zt" type="text" id="zt" value="<%=rs("title")%>" size="48" maxlength="25">
                    作者： 
                    <input name="zz" type="text" id="textfield2" value="<%=rs("writer")%>" size="20" maxlength="10">
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
                  <td valign="top"> <textarea name="nr" cols="77" rows="10" id="textarea"><%=rs("body")%></textarea></td>
                </tr>
                <tr> 
                  <td height="25" valign="top">&nbsp;</td>
                  <td> <input type="submit" name="Submit" value="修改"> <input type="reset" name="Submit22" value="重置">
                    <input name="button" type='button' onclick=history.back() value='返回'>
                  </td>
                </tr>
              </table>
            </td>
          </form>
        </tr>
      </table><%rs.close%>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp; </td>
  </tr>
</table>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center" height="40">
  <tr> 
    <td width="40" background="im/footleft.jpg">&nbsp;</td>
    <td width="711" background="im/footmid.jpg"> <div align="center"></div></td>
    <td width="27" background="im/footright.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>
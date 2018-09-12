<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="style.css">
<%
if request("Submit_select")<>"" then
  writer=request("writer")
  title=request("title")
  times=request("times")
  sql="select * from body where time>#"&times&"#"
  if writer<>"" then
  sql=sql&" and writer='"&writer&"'"
  end if
  if title<>"" then
  sql=sql&" and title like '%"&title&"%'"
  end if
  sql=sql&" order by lasttime desc"
  response.redirect "default.asp?ssql="&server.urlencode(sql)
response.end
end if
%>
<body >
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td valign="top"> <!--#include file="top.asp"--></td>
  </tr>
  <tr> 
    <td height="175"> <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <form name="form1" method="post" action="">
            <td valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr> 
                  <td>按作者： 
                    <input name="writer" type="text" id="writer" maxlength="10"></td>
                </tr>
                <tr> 
                  <td>按主题： 
                    <input name="title" type="text" id="title" maxlength="25">
                    (关键字)</td>
                </tr>
                <tr> 
                  <td>按时间： 
                    <select name="times" id="times">
                      <option value="<%=date-1%>">前一天</option>
                      <option value="<%=date-7%>">前一周</option>
                      <option value="<%=date-30%>">前一月</option>
                      <option value="2002-1-1" selected>所有日期</option>
                    </select></td>
                </tr>
                <tr> 
                  <td> <div align="center"> 
                      <input name="Submit_select" type="submit" id="Submit_select" value="查找">
                      <input type="reset" name="Submit2" value="重置">
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>
<table width="778" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="im/tops.gif">
  <tr> 
    <td width="40">&nbsp;</td>
  </tr>
</table>
</body>
</html>
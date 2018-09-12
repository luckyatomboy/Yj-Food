<!--#include file="admin_yz.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="pageset.asp"-->
<!--#include file="lock.asp"-->
<!--#include file="css.asp"-->
<%
if request("Submit")<>"" then
  function k(str,name,size)
   k=str
   if str="" then'不能为空
   call errmsg(name&"不能为空！")
   end if
   if len(str)>size then'字符宽度不能超过限制
   call errmsg(name&"字符宽度不能大于"& size)
   end if
  end function

  rewriter=k(request("rewriter"),"作者",10)
  rebody=k(request("rebody"),"回复内容",10000)
  
  sql="select * from re where id="&request("bodyid")&""
  rs.open sql,conn,1,3
  rs("rewriter")=rewriter
  rs("rebody")=rebody
  rs.update
  id=rs("reid")
  rs.close
  call connclose
  response.Redirect"body.asp?id="&id
response.end
end if
%>
<%
sql="select * from re where id="&request("bodyid")&""
rs.open sql,conn,1,3
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="762" valign="top"> <!--#include file="top.asp"--></td>
  </tr>
  <tr> 
    <td valign="top">
<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr><form name="form1" method="post" action="">
            <td width="760" bgcolor="#FFFFCC"> 
              <table width="760" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="178"> <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="178" height="20"><strong><font color="#990000">修改这个回复</font></strong></td>
                      </tr>
                    </table></td>
                  <td width="576"> <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="576" height="20">RE：</td>
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
                          <input name="rewriter" type="text" id="rewriter" value="<%=rs("rewriter")%>" size="18" maxlength="10"></td>
                      </tr>
                    </table></td>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="576" valign="top"><textarea name="rebody" cols="90" rows="5" id="rebody"><%=rs("rebody")%></textarea>
                          <input type="submit" name="Submit" value="修改">
                          <input type="reset" name="Submit2" value="重置">
						  <input type='button' value='返回' onclick=history.back()>
                        </td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table><%rs.close%>
              <table width="760" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="760">&nbsp;</td>
                </tr>
              </table>
            </td>
          </form>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>  </td>
  </tr>
</table>
</body>
</html>
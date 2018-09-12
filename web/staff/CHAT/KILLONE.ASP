<% 
    names=trim(request.form("names"))
if names<>"" then
   Application.Lock 
   UserList=application("userlist")
     for i=1 to Ubound(UserList)
       if names=UserList(i) then exit for
     next
       If not(i>Ubound(UserList)-1) then
         for N=i to UBOUND(UserList)-1
           UserList(i)=UserList(i+1)
         next
       Else
         I=Ubound(UserList)-1
       end if
   Redim Preserve UserList(i)
   Application("userlist")=UserList
   Application.UnLock 
application.Lock
application("show")=application("show")&"<br><font color=red>【浏览器刷新】</font>"
application("show")=application("show")&"<font color=red>〖"&names&"〗</font>因违反聊天纪律，被版主一脚踹出了聊天室！~~~~~~  <font class=t>"&time&"</font>"
application.unlock
%>
<div align="center"><%=names%>已踢出聊天室 </div>
<table width="660" border="1" align="center" cellpadding="0">
  <tr> 
    <td>您要将谁踢出聊天室：</td>
  </tr>
  <tr>
    <td><form name="form1" method="post" action="">
        <input name="names" type="text" id="names">
        <input type="submit" name="Submit" value=" 确定 ">
      </form></td>
  </tr>
</table>
<%else%>
<table width="660" border="1" align="center" cellpadding="0">
  <tr> 
    <td>您要将谁踢出聊天室：</td>
  </tr>
  <tr>
    <td><form name="form1" method="post" action="">
        <input name="names" type="text" id="names">
        <input type="submit" name="Submit" value=" 确定 ">
      </form></td>
  </tr>
</table>
<%end if%>
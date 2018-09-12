 <% 
'Application("name")=""
'Response.End 
  if session("username")="" then 
    name=trim(request.form("from"))
  else
    Name=session("username")
  end if
if name<>"" then
   Application.Lock 
   UserList=application("userlist")
     for i=1 to Ubound(UserList)
       if name=UserList(i) then exit for
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
application("show")=application("show")&"<font color=red>〖"&name&"〗</font>兴冲冲地冲出聊天室，扬长而去~~~~~~  <font class=t>"&time&"</font>"
application.unlock
session("username")=""
session("u_id")=""
end if
'Response.Redirect ("index.asp")
%>
<script language="JavaScript" type="text/JavaScript">
window.close()
</script>

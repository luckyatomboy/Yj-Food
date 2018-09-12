<!--#include file="admin_yz.asp"-->
<!--#include file="conn.asp"-->
<% id =request("id")
   bodyid=request("bodyid")
   sql="SELECT * from re where id="&bodyid&""
   rs.open sql,conn,1,3
   if rs.eof then
   call errmsg("ÒÑ¾­É¾³ý£¡")
   else
   rs.delete
   end if
   rs.close
   sql="SELECT * from body where id="&id&""
   rs.open sql,conn,1,3
   rs("recount")=cint(rs("recount"))-1
   rs.update
   lasttime=rs("time")
   rs.close
   sql="SELECT * from re where reid="&id&" order by retime desc"
   rs.open sql,conn,1,3
   if not(rs.eof and rs.bof) then
     lasttime=rs("retime")
   end if
   rs.close
   sql="SELECT * from body where id="&id&""
   rs.open sql,conn,1,3
   rs("lasttime")=lasttime
   rs.update
   rs.close
   call connclose
response.redirect"body.asp?id="&id&""
%>
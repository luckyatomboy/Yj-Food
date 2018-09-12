<!--#include file="conn.asp"-->
<% 
id =request("id")
sql="SELECT * from body where id="&id&""
rs.open sql,conn,1,3
if rs.eof then
   call errmsg("´ËÌùÒÑ¾­É¾³ý£¡")
else
rs.delete
rs.close
sql="SELECT * from re where reid="&id&""
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then
rs.close
conn.execute("delete * from re where reid="&id&"")
else
rs.close
end if
call connclose
end if
response.redirect"jlsk2.asp"
%>
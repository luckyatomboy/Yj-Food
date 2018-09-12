<!--#include file="admin_yz.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="lock.asp"-->
<%
conn.execute("insert into lockip (ip) values('"&request("ip")&"')")
call connclose
call errmsg("该用户IP已经成功锁定")
%>
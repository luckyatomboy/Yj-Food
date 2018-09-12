<!-- #include file="../conn2.asp" -->
<%
set rs=conn.execute("select * from gys where id="&request("id"))
session("gys_username")=rs("company")
session("gys_id")=rs("id")
response.redirect "../gys_main.asp"
response.end
%>
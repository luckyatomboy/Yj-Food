<%
if session("redboy_username")="" then
%>
<script language="javascript">
top.location.href="../index.asp"
</script>
<%  
  response.end
end if
%>
<!-- #include file="../conn2.asp" -->
<%
id=replace(request("id")," ","")
id=split(id,",")
for i=0 to UBound(id)
  sql="delete from money_smallclass where id_bigclass="&id(i)
  conn.execute(sql)
  sql="delete from redboy_money where id_bigclass="&id(i)
  conn.execute(sql)
  sql="delete from money_bigclass where id="&id(i)
  conn.execute(sql)
next
response.redirect "bigclass.asp"
%>


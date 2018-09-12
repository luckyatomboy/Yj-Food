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
sql="select * from produit where id_ku="&request("id")&""
set rs=conn.execute(sql)
if rs.eof=false then
%>
  <script language="javascript">
    alert("此仓库中还存有产品，不能删除！")
	window.history.go(-1)
  </script>
<%
  response.end
end if
id=replace(request("id")," ","")
id=split(id,",")
for i=0 to UBound(id)
  conn.execute("delete from produit where id_ku="&id(i))
  sql="delete from ku where id="&id(i)
  conn.execute(sql)
next
response.redirect "ku.asp"
%>


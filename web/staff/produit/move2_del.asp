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
  sql="delete from kcpd where bianhao='"&id(i)&"'"
  conn.execute(sql)
next
response.redirect "move2.asp?page="&request("page")&"&startdate="&request("startdate")&"&enddate="&request("enddate")&"&ku="&request("ku")&"&keyword="&request("keyword")&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")
%>


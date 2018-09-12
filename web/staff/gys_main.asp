<%
if session("gys_username")="" then
  response.redirect "index.asp"
  response.end
end if
%>
<!-- #include file="conn.asp" -->
<!-- #include file="gys_const.asp" -->
<%
sql="select * from config"
set rs_config=conn.execute(sql)
dianming=rs_config("dianming")
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=dianming%></title>
</head><frameset rows="63,*,32" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="gys_top.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frame src="gys_desk.asp" name='right' scrolling='yes' noresize='noresize' />
  <frame src="gys_bottom.asp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>

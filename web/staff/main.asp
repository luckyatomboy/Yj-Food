<%
if session("redboy_username")="" then
  response.redirect "index.asp"
  response.end
end if
%>
<!-- #include file="conn.asp" -->
<!-- #include file="const.asp" -->
<%
sql="select * from config"
set rs_config=conn.execute(sql)
dianming=rs_config("dianming")
%>

<!-- #include file="inc/function.asp" -->
<%
sql="select * from produit"
set rs_produit=conn.execute(sql)
nowbaojin=""
do while rs_produit.eof=false
	  sql="select * from produit where huohao='"&rs_produit("huohao")&"'"
	  set rs_shulian=conn.execute(sql)
	  nowshulian=0
	  do while rs_shulian.eof=false
	    nowshulian=nowshulian+rs_shulian("shulian")
	    rs_shulian.movenext
	  loop
	  if nowshulian<rs_produit("baojin") then
	    nowbaojin=nowbaojin&"<tr bgcolor=#ececec onMouseOver=this.bgColor='#ffffff' onMouseOut=this.bgColor='#ececec'><td align=center height=25>"&rs_produit("title")&"</td><td>"&rs_produit("huohao")&"</td><td>"&nowshulian&"</td></tr>"
	  end if
      rs_produit.movenext	   
loop
sql="select * from huiyuan where ((month(shenri)>="&month(date())&" and month(shenri)<="&month(date()+tiqian)&") and (day(shenri)>="&day(date())&" and day(shenri)<="&day(date()+tiqian)&") and year(wenhou)<>"&year(date())&" and yinyan='阳') or ((month(shenri)>="&WDateToEDate(now(),"1")&" and month(shenri)<="&WDateToEDate(now()+tiqian,"1")&") and (day(shenri)>="&WDateToEDate(now(),"2")&" and day(shenri)<="&WDateToEDate(now()+tiqian,"2")&") and year(wenhou)<>"&year(date())&" and yinyan='阴')"
set rs_baojin2=conn.execute(sql)
if nowbaojin<>"" and baojin="yes" then
%>
<script language="javascript">
window.open('baojin.asp','库存报警','width=853,height=220,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes');
</script>
<%
end if	  

if rs_baojin2.eof=false and baojin2="yes" then
%>
<script language="javascript">
window.open('baojin2.asp','会员生日报警','width=853,height=215,top=431,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes');
</script>
<%
end if	  
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=dianming%> - 后台管理系统</title>
</head><frameset rows="63,*,32" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frame src="desk.asp" name='right' scrolling='yes' noresize='noresize' />
<!--  <frame src="top.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
<!--  <frameset rows="*" cols="177,*" framespacing="0" frameborder="no" border="0">
<!--    <frame src="menu.asp" name='left' scrolling='yes' noresize='noresize' />
<!--    <frame src="desk.asp" name='right' scrolling='yes' noresize='noresize' />
<!--  </frameset> -->
  <frame src="bottom.asp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>

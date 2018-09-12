<!--#include file="admin_yz.asp"-->
<!--#include file="conn.asp"--><%
sql="select * from pageset"
rs.open sql,conn,1,3
rs("boardname")=" "
rs("bgcolor")="#ffffff"
rs("tablecolor")="#FFCC66"
rs("textcolor")="#000000"
rs("logo")="<div align=center><img src=images/logo.gif width=180 height=60 border=0></div>"
rs("banner")="<div align=center><object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0 width=468 height=60><param name=movie value=images/banner.swf><param name=quality value=high><embed src=images/banner.swf quality=high pluginspage=http://www.macromedia.com/go/getflashplayer type=application/x-shockwave-flash width=468 height=60></embed></object></div>"
rs("email")="zha0615@sina.com"
rs("message")=""
rs("messagetime")=now
rs("copyright")="</p><p align=center>Email:<a href=mailto:zha0615@sina.com></a>"
rs("counts")=true
rs("reset")=60
rs("locktime")=1
rs.update
conn.execute("delete from body")
conn.execute("delete from re")
conn.execute("delete from online")
conn.execute("update logincount set logincount=1")
rs.close
call connclose
response.redirect "default.asp"
%>
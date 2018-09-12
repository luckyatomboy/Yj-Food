<%
sql="SELECT * from pageset"
rs.open sql,conn,1,3
name=rs("boardname")
bgcolor=rs("bgcolor")
tablecolor=rs("tablecolor")
textcolor=rs("textcolor")
logo=rs("logo")
banner=rs("banner")
email=rs("email")
message=rs("message")
mgetime=rs("messagetime")
copyright=rs("copyright")
counts=rs("counts")
reset=rs("reset")
locktime=rs("locktime")
rs.close
%>
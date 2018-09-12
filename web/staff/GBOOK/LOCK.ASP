<%
Response.Expires=-1
if request.cookies("ip")="lock" then
  call errmsg("您的IP已经被管理员屏蔽")
response.end
end if
sql="SELECT ip from lockip where ip='"&request.servervariables("remote_addr")&"'"
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then
response.cookies("ip")="lock"
response.cookies("ip").expires=dateadd("h",locktime,now)
rs.delete
rs.close
response.redirect "default.asp"
end if
rs.close
%>
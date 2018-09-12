<!--#include file="conn.asp"-->
<!--#include file="lock.asp"-->
<%
id=request("id")
function k(str,name,size)
   k=str
   if str="" then'不能为空
   call errmsg(name&"不能为空！")
   end if
   if len(str)>size then'字符宽度不能超过限制
   call errmsg(name&"字符宽度不能大于"& size)
   end if
end function

textfield=k(request("textfield"),"作者",10)
textarea=k(request("textarea"),"回复内容",10000)

sql="SELECT * from re"
rs.open sql,conn,1,3
rs.addnew
rs("reid")=id
rs("rewriter")=textfield
rs("rebody")=textarea
rs("reip")=request.servervariables("remote_addr")
rs.update
rs.close
sql="SELECT * from body where id="&id&""
rs.open sql,conn,1,3
rs("recount")=cint(rs("recount"))+1
rs("lookcount")=cint(rs("lookcount"))-1
rs("lasttime")=now
rs.update
rs.close
call connclose
session("user")=textfield
response.redirect"body.asp?id="&id&""
%>
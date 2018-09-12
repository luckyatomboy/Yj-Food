<%
If Session("ManageName")="" or Session("ManagePwd")="" or Session("ManageLevel")="" Then
				response.write("<script language='javascript'>alert('登陆信息过期！请重新登陆!');self.close();</script>")
			response.end	
end if
		Session("Employee_Name") = "系统管理员"
		Session("Employee_ID") = 1
if Trim(Session("Employee_ID")) = "" then
	response.write "<script language=""JavaScript"" type=""text/javascript"">"
	response.write "alert('您没有登录或者操作超时，请先登录。');"
	response.write "</script>"
	response.end
end if
%>
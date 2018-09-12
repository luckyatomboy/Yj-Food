<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<%
Dim adu,adp,adl,chk_id
Dim mlev,lev1,lev2,lev3,lev4,lev5,lev6,lev7
Dim chk
adu = Replace(Session("ManageName"),"'","")
adp = Replace(Session("ManagePwd"),"'","")
adl = Replace(Session("ManageLevel"),"'","")   
If Session("ManageName")="" or Session("ManagePwd")=""  Then
			response.write("<script language='javascript'>alert('登陆信息过期！请重新登陆!');self.close();</script>")
			response.end	
end if
%>
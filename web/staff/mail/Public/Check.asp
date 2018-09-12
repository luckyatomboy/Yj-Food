<%
Call Check

Sub Check()
	If isnull(Session("EmpName")) or Session("EmpName")="" Then
		Response.Redirect "../Public/LoginError.asp"
	End If
		if isnull(Session("Menu")) or Session("Menu")="" then
			Session("Menu")="0000"
		end if
		If instr(Session("Menu"),MenuNo)<=0 Then
			Response.Redirect "../Public/MenuError.asp"
		End If
End Sub
%>
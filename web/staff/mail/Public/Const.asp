<%
Function htmlencode(inString)
	Dim Ret

	If inString & "a" ="a" Then
		Exit Function
	End If

	Ret = inString
	'Ret = Replace(Ret,vbcrlf,"<br>")

	htmlencode = Ret
End Function
%>
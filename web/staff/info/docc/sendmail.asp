<%
sFrom = request.form("sFrom")
sTo = request.form("sTo")
sSubject = request.form("sSubject")
sContent = request.form("sContent")

if sFrom<>"" and sTo<>"" then
    if sendmail(sFrom,sTo,sSubject,sContent) then
		Flag="OK"
    else
		Flag="FALSE"
    end if
else
	Flag="FALSE"
end if
response.redirect request.ServerVariables("HTTP_REFERER")&"?Flag="&Flag

Function sendmail(stringFrom,stringTo,stringSubject,stringContent)
	On error resume next
	Set newmail = Server.CreateObject ("cdonts.newmail")
	newmail.BodyFormat = 0
	newmail.MailFormat = 0
	newmail.From       = stringFrom
	newmail.To         = stringTo
	newmail.Subject    = stringSubject
	newmail.Body       = stringContent
	newmail.Send
	Set newmail = Nothing
	If err.description="" Then
		sendmail=true
	Else
		sendmail=false
	End If
End Function
%>
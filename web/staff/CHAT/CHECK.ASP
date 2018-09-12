
<%
'Response.Buffer=true
'Response.Expires=-1
username=trim(request.form("username"))
username=username&session("sx")
if not(isarray(application("userlist"))) then
dim u()
redim u(0)
u(0)="&acute;¡§&reg;&frac14;&Ograve;"
application.lock
application("userlist")=u
application.unlock
end if
userlist=application("userlist")
n=ubound(userlist)+1
for i=0 to ubound(userlist)
if left(userlist(i),len(userlist(i))-1)=trim(request.form("username")) then same=true
next
if same=true  then 
     session("username")=trim(request.form("username"))
    redim preserve userlist(n)
	userlist(n)=username
	application.lock
	application("userlist")=userlist
	application.unlock
response.redirect "main.asp"
else
    session("username")=trim(request.form("username"))
    redim preserve userlist(n)
	userlist(n)=username
	application.lock
	application("userlist")=userlist
	application.unlock
    end if
response.redirect "main.asp"
%>
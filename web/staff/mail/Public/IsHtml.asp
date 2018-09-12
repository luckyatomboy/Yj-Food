<%
function htmlshow(body)
	htmlshow=body
	if ishtml(body) then
		htmlshow=replace(htmlshow,"[HTML]","")
		htmlshow=replace(htmlshow,"[/HTML]","")
	else
		htmlshow=replace(htmlshow,vbcrlf,"<BR>")
	end if
end function
function ishtml(body)
	if instr(body,"[HTML]")>0 and instr(body,"[/HTML]")>0 then
		ishtml=true
	else
		ishtml=false
	end if
end function
%>
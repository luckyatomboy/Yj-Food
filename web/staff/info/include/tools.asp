<%
function txt2html(txt)
	txt2html=txt
end function

function ishtml(txt)
	if txt="" or isnull(txt) then
		ishtml=false
		exit function
	end if

	if instr(txt,"[HTML]")>0 and instr(txt,"[/HTML]")>0 then
		ishtml=true
	else
		ishtml=false
	end if
end function
%>
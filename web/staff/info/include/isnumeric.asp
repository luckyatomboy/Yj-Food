<%
function txt2num(n)
	if n="" or isnull(n) or not isnumeric(n) then
		txt2num=0
		exit function
	else
		txt2num=n
	end if
end function
%>
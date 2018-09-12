<%
response.buffer=true



private function cRequest(byval strName)
	cRequest=replace(trim(Request(trim(strName))),"'","''")
end function

%>
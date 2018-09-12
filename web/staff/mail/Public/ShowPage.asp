<%if TotalPages>1 and CurrentPage>1 then%>
<a href="javascript:viewpage(1);" title="首页"><img border="0" src="Images/firstpg.gif"></a> &nbsp; 
<a href="javascript:viewpage(<%=CurrentPage-1%>);" title="上一页"><img border="0" src="Images/prevpg.gif"></a> &nbsp; 
<%else%>
<img src="Images/firstpg.d.gif"> &nbsp; 
<img src="Images/prevpg.d.gif"> &nbsp; 
<%end if%>


<%if TotalPages>1 and CurrentPage<TotalPages then%>
<a href="javascript:viewpage(<%=CurrentPage+1%>);" title="下一页"><img border="0" src="Images/nextpg.gif"></a> &nbsp; 
<a href="javascript:viewpage(<%=TotalPages%>);" title="尾页"><img border="0" src="Images/lastpg.gif"></a> &nbsp; 
<%else%>
<img src="Images/nextpg.d.gif"> &nbsp; 
<img src="Images/lastpg.d.gif"> &nbsp; 
<%end if%>

<script language="javascript">
	function viewpage(iPage){
		document.frmpage.mepage.value=iPage;
		document.frmpage.submit();
	}
</script>
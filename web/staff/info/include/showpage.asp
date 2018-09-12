第<%=intPage%>页/总<%=intPagecount%>页
| 总<%=intRecordcount%>条
<%if intPage>1 then%>
| <a href="javascript:goPage(1);">首页</a>
| <a href="javascript:goPage(<%=intPage-1%>);">上页</a>
<%else%>
| 首页
| 上页
<%end if%>
<%if intPagecount>1 and intPage<intPagecount then%>
| <a href="javascript:goPage(<%=intPage+1%>);">下页</a>
| <a href="javascript:goPage(<%=intPagecount%>);">尾页</a>
<%else%>
| 下页
| 尾页
<%end if%>
转到第<input type="text" name="intPage" value="<%=intPage%>" style="width:30px;height:20px;">页
<input type="submit" name="btnSubmit" value="GoTo" style="width:40px;">
<script language="javascript">
	function goPage(intPage){
		document.frmpage.intPage.value=intPage;
		document.frmpage.submit();
	}
</script>
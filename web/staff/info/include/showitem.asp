第<%=editpage%>条/总<%=editpagecount%>条
<%if editpage>1 then%>
| <a href="javascript:goItem(1);">第一条</a>
| <a href="javascript:goItem(<%=editpage-1%>);">上一条</a>
<%else%>
| 第一条
| 上一条
<%end if%>
<%if editpagecount>1 and editpage<editpagecount then%>
| <a href="javascript:goItem(<%=editpage+1%>);">下一条</a>
| <a href="javascript:goItem(<%=editpagecount%>);">最后一条</a>
<%else%>
| 下一条
| 最后一条
<%end if%>
转到第<input type="text" name="editpage" value="<%=editpage%>" style="width:30px;height:20px;">条

<script language="javascript">
	function goItem(editpage){
		document.frmitem.editpage.value=editpage;
		document.frmitem.submit();
	}
</script>
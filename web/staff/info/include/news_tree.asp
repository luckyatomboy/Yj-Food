<link href="../../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>

<%
set rs_root=server.CreateObject("adodb.recordset")
rs_root.Open "select columnid,columnname from tbl_news_column where columnparentid=0 order by columnid desc",conn,1,1

function repSquote(srcstr)
	if srcstr="" then
		repSquote="" 
		exit function 
	end if
	dim targetstr
	targetstr=trim(srcstr)
	targetstr=replace(targetstr,"'","\'")
	repSquote=targetstr
end function
%>
<SCRIPT language="JavaScript">
	//tree
	function display1(Q_subtree,Q_img){
		if(Q_subtree.style.display=="none"){ 
			Q_subtree.style.display="";     
			Q_img.src="../images/tree_collapse.gif";
		}else{
			Q_subtree.style.display="none";      
			Q_img.src="../images/tree_expand.gif";
		} 
	}
	//delete
	function doDelete(columnid){
		  var msg=window.confirm ("该栏目下的相关内容也会被删除,\n你真的要删除该栏目吗?");
		  if(msg==true){
			  document.frmdelete.columnid.value=columnid;
			  document.frmdelete.submit();
		  }
	}
	//rename
	function doRename(columnid,columnname){
		document.frmedit.columnid.value=columnid;
		document.frmedit.old_columnname.value=columnname;
	}
</SCRIPT>

<TABLE cellSpacing=0 cols=5 cellPadding=0 width=230 border=0 style="font-size: 9pt">  
  <TBODY>  
  <FORM name="frmdelete" action="add_news_catalog_ok.asp"  method="post">
  <INPUT type=hidden name=columnid>
  <INPUT type=hidden name=action value=delete>
  <TR> 
    <TD style="line-height:16px" width=16></TD>
    <TD style="line-height:16px" width=16></TD>
    <TD style="line-height:16px" width=15></TD>
    <TD style="line-height:16px" width="140"></TD>    
    <TD style="line-height:16px" width=23></TD>
  </TR>
  <TR> 
    <TD style="line-height:16px" width="16"><IMG src="../images/tree_collapse.gif" border=no></TD>
    <TD style="line-height:16px" colSpan=4>目录<img src="../images/spacer.gif" width="158" height="1">删除</TD>    
  </TR>
  <%
  n=1
  for i=1 to rs_root.RecordCount
      set rs_child=server.CreateObject("adodb.recordset")
      rs_child.Open "select columnid,columnname from tbl_news_column where columnparentid="&rs_root("columnid")&" order by columnid",conn,1,1
      if rs_child.RecordCount=0 then
  %>
  <TR> 
	<TD style="line-height:16px" width="16"><IMG src="../images/<%if i=rs_root.RecordCount then%>tree_end.gif<%else%>tree_split.gif<%end if%>"></TD>
	<TD style="line-height:16px" width="16"><IMG src="../images/tree_leaf.gif" border=0 width="15" height="16"></TD>
	<TD style="line-height:16px" colSpan=2><A href="#here" onclick="javascript:doRename('<%=rs_root("columnid")%>','<%=repSquote(rs_root("columnname"))%>');"><%=rs_root("columnname")%></A></TD>
	<TD style="line-height:16px" width="23"><a href="javascript:doDelete(<%=rs_root("columnid")%>)"><b>×</b></a></TD>
  </TR>
    <%else%>
  <TR>
	<TD style="line-height:16px" width="16"><img src="../images/<%if i=rs_root.RecordCount then%>tree_end.gif<%else%>tree_split.gif<%end if%>" border=no width="16" height="16"></TD>
	<TD style="line-height:16px" width="16"><SPAN id=zhugan<%=n%> style="CURSOR: hand;" onclick="javascript:display1(document.all.subtree<%=n%>,document.all.img<%=n%>);"><IMG src="../images/tree_collapse.gif" border=no name=img<%=n%>></SPAN></TD>
	<TD style="line-height:16px" colSpan=2><A href="#here" onclick="javascript:doRename('<%=rs_root("columnid")%>','<%=repSquote(rs_root("columnname"))%>');"><%=rs_root("columnname")%></A></TD>
	<TD style="line-height:16px" width="23"></TD>
  </TR>
  <TR id="subtree<%=n%>">
	<TD style="line-height:16px" colspan=5>
	<TABLE cellSpacing=0 cols=5 cellPadding=0 width=100% border=0 style="font-size: 9pt">
	  <tbody>
	  <%
	  for j=1 to rs_child.RecordCount
	  %>
	  <TR> 
		<TD style="line-height:16px" width="16"><%if i=rs_root.RecordCount then%>&nbsp;<%else%><img src="../images/tree_vertline.gif" border=0><%end if%></TD>
		<TD style="line-height:16px" width="16"><IMG src="../images/<%if j=rs_child.RecordCount then%>tree_end.gif<%else%>tree_split.gif<%end if%>"></TD>
		<TD style="line-height:16px" width="15"><img src="../images/tree_leaf.gif" border=0 width="15" height="16"></TD>
		<TD style="line-height:16px" width="140"><A href="#here" onclick="javascript:doRename('<%=rs_child("columnid")%>','<%=repSquote(rs_child("columnname"))%>');"><%=rs_child("columnname")%></a></TD>
		<TD style="line-height:16px" width="23"><a href="javascript:doDelete(<%=rs_child("columnid")%>)"><b>×</b></a></TD>
	  </TR>               
	  <%
			rs_child.MoveNext
			if rs_child.EOF then exit for
	  next
	  %>
	  </tbody>
	</TABLE>
	</TD>
  </TR>   
	<%end if%>
  
<%
	rs_child.Close 
	set rs_child=nothing
	rs_root.MoveNext
	if rs_root.EOF then exit for
	n=n+1
next
rs_root.Close 
set rs_root=nothing
%>
  </FORM>
  </TBODY>
</TABLE>
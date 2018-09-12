<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=javascript>
var itemp;
var tobj="";
itemp="";
function leftBgOver(obj){//菜单
	obj.style.background="url(images/left_bg02.gif) center no-repeat";
	//obj.style.position="center";
	//obj.style.repeat="no-repeat":
}

function leftBgOut(obj,sty){
	//alert( (sty)?"url(" + sty + ")":"");
if (tobj!="")
{
sty="images/left_bg01.gif";
obj.style.background= (sty)?"url(" + sty + ")":"";
}
else 
{
obj.style.background= (sty)?"url(" + sty + ")":"";
}
}
</script>
<script language="javascript">
function collapse(objid)
{
	var obj = document.getElementById(objid);
	collapseAll();
	obj.style.display = '';
}
function collapseAll()
{
	for (var i=0; i<8; i++)
	{
		var obj = document.getElementById('g_' + i.toString());
		if (obj) obj.style.display = 'none';
	}
}
function expandAll()
{
	for (var i=0; i<8; i++)
	{
		var obj = document.getElementById('g_' + i.toString());
		if (obj) obj.style.display = '';
	}
}
</script>
<link href="style/style.css" rel="stylesheet" type="text/css">
<style rel="stylesheet" type="text/css">
body {margin:0px 5px;}
img{border:none;}
.menuall{text-align:center;width:149px;background:#ffffff;}
.menuall div{margin:0px 0 5px 10px;text-align:left;}
</style>
</head>
<body>
<SCRIPT language=JavaScript>
				nereidFadeObjects = new Object();
				nereidFadeTimers = new Object();
				function nereidFade(object, destOp, rate, delta){
				if (!document.all)
				return
					if (object != "[object]"){ 
						setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
						return;
					}
					clearTimeout(nereidFadeTimers[object.sourceIndex]);
					diff = destOp-object.filters.alpha.opacity;
					direction = 1;
					if (object.filters.alpha.opacity > destOp){
						direction = -1;
					}
					delta=Math.min(direction*diff,delta);
					object.filters.alpha.opacity+=direction*delta;
					if (object.filters.alpha.opacity != destOp){
						nereidFadeObjects[object.sourceIndex]=object;
						nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
					}
				}
				</SCRIPT>
<table border="0" cellpadding="0" cellspacing="0" class="menuall">
<tr>
<td><img src="images/left_top.gif" alt="" /></td>
</tr>
<tr>
<td>
<a href="javascript:expandAll()" target="_self"><img src="images/extand.gif" alt="展开菜单" onMouseOver=nereidFade(this,100,10,5) style="FILTER:alpha(opacity=50)" onMouseOut=nereidFade(this,50,10,5) /></a>&nbsp;<a href="javascript:collapseAll()" target="_self"><img src="images/collapse.gif" alt="收拢菜单" onMouseOver=nereidFade(this,100,10,5) style="FILTER:alpha(opacity=50)" onMouseOut=nereidFade(this,50,10,5) /></a></td>
</tr>
<tr>

<td onClick="collapse('g_0')" style="cursor:hand;"><img src="images/menu_h.gif" border="0" /></td>
</tr>
<tr>
<td id="g_0"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='info/docc/news.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>浏览通告</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='info/manage/list_news.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>通告管理</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='GBOOK/JLSK.ASP';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>在线论坛</td></tr></table></td>
    </tr>

    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='GBOOK/JLSK2.ASP';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>论坛管理</td></tr></table></td>
    </tr>


    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='txl/findinfo.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>在线通迅录</td></tr></table></td>
    </tr>

    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='txl/default.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>通迅录管理</td></tr></table></td>
    </tr>


    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='chat/index.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>在线会议</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='fileshare/index.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>文件共享</td></tr></table></td>
    </tr>

	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='fileshare/Admin_List.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>共享管理</td></tr></table></td>
    </tr>

	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='mail/new.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>新邮件</td></tr></table></td>
    </tr>
    
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='mail/inbox.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>收件夹</td></tr></table></td>
    </tr>
    
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='mail/sent.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>发件夹</td></tr></table></td>
    </tr>        
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='mail/AdminMail.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>邮件管理</td></tr></table></td>
    </tr>        

	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>


<td onClick="collapse('g_1')" style="cursor:hand;"><img src="images/menu_a.gif" border="0" /></td>
</tr>
<tr>
<td id="g_1"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_add.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>产品入库</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/buy.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>入库记录查询</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_tui.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>退回公司</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/tui.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>退货记录查询</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/gys.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>供应商管理</td></tr></table></td>
    </tr>
	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_2')" style="cursor:hand;"><img src="images/menu_b.gif" border="0" /></td>
</tr>
<tr>
<td id="g_2"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>库存查询</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_move.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>调拨盘点</td></tr></table></td>
    </tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/move.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>调拨记录</td></tr></table></td>
    </tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/move2.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>盘点记录</td></tr></table></td>
    </tr>

    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='baojin.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>库存报警</td></tr></table></td>
    </tr>
	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_3')" style="cursor:hand;"><img src="images/menu_c.gif" border="0" /></td>
</tr>
<tr>
<td id="g_3"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_sell.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>产品销售</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/sell.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>销售记录查询</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_back.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>销售退货</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/back.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>退货记录查询</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/produit_fei.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>产品报废</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='produit/fei.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>报废记录查询</td></tr></table></td>
    </tr>		
	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_4')" style="cursor:hand;"><img src="images/menu_d.gif" border="0" /></td>
</tr>
<tr>
<td id="g_4"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_buy.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>进货统计</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_sell.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>销售统计</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_tui.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>公司退货统计</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_back.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>销售退货统计</td></tr></table></td>
    </tr>	
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_fei.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>报废统计</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='count/count_login.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>员工工资统计</td></tr></table></td>
    </tr>		
	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_5')" style="cursor:hand;"><img src="images/menu_e.gif" border="0" /></td>
</tr>
<tr>
<td id="g_5"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='huiyuan/huiyuan_add.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>添加会员</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='huiyuan/huiyuan.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>会员管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='huiyuan/zu.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>会员组管理</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='baojin2.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>会员生日提醒</td></tr></table></td>
    </tr>
	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_6')" style="cursor:hand;"><img src="images/menu_f.gif" border="0" /></td>
</tr>
<tr>
<td id="g_6"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/config.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>基本信息设置</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/user.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>员工管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/zu.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>员工部门管理</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/ku.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>仓库管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/bigclass.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>产品大类管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/smallclass.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>产品小类管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='system/danwei.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>计量单位管理</td></tr></table></td>
    </tr>
	<tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='CopyData/data.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>数据备份</td></tr></table></td>
    </tr>



	<tr><td height="5"></td></tr>
  </tbody>
</table></td>
</tr>
<tr>
<td onClick="collapse('g_7')" style="cursor:hand;"><img src="images/menu_g.gif" border="0" /></td>
</tr>
<tr>
<td id="g_7"><table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tbody>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/bigclass.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>帐务大类</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/smallclass.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>帐务小类</td></tr></table></td>
    </tr>		
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/money_add.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>添加帐务</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/money.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>帐务查询</td></tr></table></td>
    </tr>


    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/cwlb.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>科目定义</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/cwpz.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>凭证管理</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/pzsh.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>凭证审核</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/pzreport.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>凭证统计</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/pzmx.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>凭证明细</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/pzreport2.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>凭证报表</td></tr></table></td>
    </tr>
    <tr>
      <td height="30" align="center" background="images/left_bg01.gif" style="cursor:hand"  onclick="javascript:parent.right.location.href='money/gdzc_list.asp';" onMouseOver="leftBgOver(this);" onMouseOut="leftBgOut(this,'images/left_bg01.gif');"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50">　</td><td>固定资产</td></tr></table></td>
    </tr>



  </tbody>
</table></td>
</tr>
<tr>
<td><img src="images/left_bottom.gif" alt="" /></td>
</tr>
</table>
<div style="font-size:11px;font-family:Tahoma; color:#CEE6FA" align="center">Powered
by<a href="http://www.qiyejinxiaocun.com" target="_blank"> <b style="color:#CEE6FA">甘肃腾龙科技</b></a></div>
<script>
collapseAll();
collapse('g_1')
</script>
</body></html>
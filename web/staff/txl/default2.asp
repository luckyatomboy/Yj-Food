<% @language="vbscript" %>
<!--#include file="../conn2.asp"-->
<%
'版权所有：北京在线
'程序制作：燕衔泥

response.buffer=true
Response.Expires=0
%>

<HTML>
<HEAD>
<TITLE>企业在线</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>A:active {
	TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: none
}
A:link {
	TEXT-DECORATION: none
; color: #000000}
A:visited {
	TEXT-DECORATION: none
}
TD {
	FONT-SIZE: 9pt; FONT-FAMILY: "宋体"
}
.p1 {
	FONT-SIZE: 9pt; FONT-FAMILY: "宋体"
}
.p2 {
	FONT-SIZE: 12pt; LINE-HEIGHT: 20pt; FONT-FAMILY: "宋体"
}
.p3 {
	FONT-SIZE: 9pt; LINE-HEIGHT: 18pt
}
.p4 {
	FONT-SIZE: 9pt; COLOR: #666666; FONT-FAMILY: "宋体"
; font-style: normal; line-height: 5mm; text-decoration: none}
.unnamed1 {
	FONT-SIZE: 2pt; COLOR: #ffffff; TEXT-DECORATION: none
}
.p5 {
	FONT-SIZE: 1pt
}
.p9 {  font-family: "宋体"; font-size: 9pt; font-style: normal; line-height: 8mm; text-decoration: none}
</STYLE>
<script                    
  language="javascript">
<!--
function winopen(url)                    
     {                    
        window.open(url,"search","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=450,top=0,left=0");                    
      }

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</HEAD>
<BODY bgColor=#FFFFFF leftMargin=4 topMargin=2>
<TABLE class=unnamed1 cellSpacing=0 cellPadding=3 width=765 align=center
border=0>
  <TR> 
    <TD rowSpan=3 width="178" valign="top"> <a href="../"><img src="images/logo.gif" width="160" height="60" border="0" alt="欢迎光临北京在线"></a> 
    </TD>
    <TD rowSpan=3 width="462" valign="top"><IMG height=60 width=460 src="images/guanggao.gif" border="0"> 
    </TD>
    <TD rowspan="2" valign="middle" height="35"> 
      <div align="center"><font color="#004a94"><span class="p4">加入收藏<br>
        关于我们<br>
        <font class=p1>联系我们</font></span></font></div>
    </TD>
  </TR>
  <TR vAlign=top> </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=765 align=center border=0>
  <TR>
    <TD width=12><IMG height=19 src="images/jiao5.jpg" width=13></TD>
    <TD class=p1 bgColor=#a7b3c3 colSpan=2>
      <div align="right"><%
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT * From fenlei Order By id"
RS.open sql,Conn,3,3
 do while not rs.eof %><a href=leibie.asp?fenlei=<%=rs("leibie")%>><font color=#000000><%=rs("leibie")%></font></a>&nbsp;&nbsp;&nbsp; 
        <%
RS.MoveNext
Loop
rs.close
%> </div>
    </TD>
  </TR></TABLE>
<TABLE cellSpacing=0 cellPadding=2 width=765 align=center border=0>
  <TR>
    <TD width="22%" bgColor=#340301 height=16>
      <DIV align=center><FONT color=#ffffff>
      <SCRIPT language="">
nt=new Date( );
arrayday=["日" , "一" , "二" , "三" , "四" , "五" , "六" ];
document.write((nt.getMonth()+1) + "月" + nt.getDate() + "日&nbsp;");
document.write("星期" + arrayday[nt.getDay()] );

</SCRIPT>
      </FONT></DIV></TD>
    <TD class=p1 align=left bgColor=#dbe0e6 colSpan=2 height=16 width="78%">企业搜索-&gt;<font color="#FFFFFF">&nbsp;关键字：
      </font>
      <input style="font-size:9pt;height:15pt" type="text" size="10" name="keyword">
      <select style="font-size:9pt" size=1 name="hangyue">
        <option value="0" selected>不限</option>
        <option value="1">计算机业</option>
        <option value="2">旅游娱乐</option>
        <option value="3">广告，中介，房产</option>
        <option value="4">通讯、电子、图书</option>
        <option value="5">服务业</option>
        <option value="6">鞋革、服装、工艺</option>
        <option value="7">食品、日用品</option>
        <option value="8">律师、会计、审计</option>
        <option value="9">机械、化工、建材</option>
        <option value="91">其他 </option>
      </select>
      <select style="font-size:9pt" size=1 name="where">
        <option value="0" selected>不限</option>
        <option value="中国">中国</option>
      </select>
      <span id=ok>
      <input type="image" name=ok  src="images/go.GIF" border="0" alt="查询" width="24" height="18">
      </span>&nbsp;<a href="searchinfo.htm" target="_blank"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
    </TD>
  </TR></TABLE>
<TABLE class=p1 cellSpacing=0 cellPadding=0 width=765 align=center border=0>
  <TR>
    <TD vAlign=top width=165 rowSpan=2 bgcolor="#dbe0e6">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

        <TR>
          <TD>
            <DIV align=center><IMG height=121 src="images/qy.GIF"
            width=168 border=0></DIV>
          </TD></TR>
        <TR bgColor=#dbe0e6>
          <TD>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <div align="center"><br>
                    <img src="images/dqdh.GIF" width="147" height="19"></div>
                </td>
              </tr>
              <tr>
                <td><%
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT * From diqu Order By id"
RS.open sql,Conn,3,3
%> 
                  <form name="form1" action=diqu.asp?diqu=<%=rs("id")%>>
                    <div align="center"><br>
           请选择：<select name="diqu">
                      <option selected>区县</option><%
do while not rs.eof %>
                        
<OPTION value=<%=rs("id")%>><%=rs("diqu")%></OPTION>
                     <%
RS.MoveNext
Loop
rs.close
%> </select>
<input type="submit" value="GO">
                    </div>
                  </form>
                </td>
              </tr>
            </table>
            <BR>
          </TD>
        </TR>
        <TR bgColor=#dbe0e6>
          <TD><BR>
            <TABLE cellSpacing=1 cellPadding=0 width="82%" align=center
            bgColor=#a7b3c3 border=0>

              <TR vAlign=top bgColor=#dbe0e6>
                <TD class=p4>
                  <table width="152" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#999999" bordercolordark="#FFFFFF">
                    <tr bgcolor="#CCCCCC"> 
                      <td>● 政策法规</td>
                    </tr>
                    <tr> 
                      <td class="p4"> →<a href="zcfg/001.htm" target="_blank">中国招标投标法</a> 
                        <br>
                        →<a href="zcfg/012.htm" target="_blank">中国城市规划法</a> <br>
                        →<a href="zcfg/013.htm" target="_blank">中国城市房地产管理法</a> 
                        <br>
                        →<a href="zcfg/016.htm" target="_blank">住房公积金管理条例</a> 
                        <br>
                        →<a href="zcfg/004.htm" target="_blank">商品房销售面积计量监督 　管理办法 
                        </a><br>
                        →<a href="zcfg/005.htm" target="_blank">商品住宅性能认定管理办法（试行）</a> 
                      </td>
                    </tr>
                  </table>
                </TD>
              </TR></TABLE></TD></TR>
        <TR bgColor=#dbe0e6>
          <TD>
            <DIV align=center><BR>
              <IMG
            height=83 src="images/jiayuan.jpg" width=152
            border=0><BR>
              <BR></DIV></TD></TR>
        <TR vAlign=top bgColor=#dbe0e6 align="center"> 
          <TD height=60> 
            <table width="152" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#999999" bordercolordark="#FFFFFF">
              <tr bgcolor="#CCCCCC"> 
                <td>● 相关服务</td>
              </tr>
              <tr>
                <td class="p4"> →帮助你的企业上网<br>
                  →为您在北京企业网安家<br>
                  →企业网上办公室 <br>
                  →画个圈占块地 </td>
              </tr>
            </table>
            <br>
            <TABLE cellSpacing=0 cellPadding=1 width="79%" align=center
            bgColor=#a7b3c3 border=0>

              <TR>
                <TD>
                  <TABLE class=p3 cellSpacing=0 cellPadding=0 width="97%"
                  bgColor=#ffffff border=0>

                    <TR vAlign=top align=middle bgColor=#dbe0e6>
                      <TD> <IMG height=19
                        src="images/t21.jpg" width=147><BR>
                        xiaomi@bjxx.net </TD>
                    </TR></TABLE></TD></TR></TABLE></TD></TR></TABLE>
     
    </TD>
    <TD vAlign=top align=middle width=468 height=592 rowSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>

        <TR>
          <TD>
            <DIV align=center>
            <TABLE cellSpacing=0 cellPadding=0 width=407 border=0>

              <TR>
                  <TD width="8"><IMG height=1 src="" width=8 border=0></TD>
                  <TD width="400"><IMG height=1 src="" width=391 border=0></TD>
                  <TD width="8"><IMG height=1 src="" width=8 border=0></TD>
                  <TD width="1"><IMG height=1 src="" width=1 border=0></TD>
                </TR>
              <TR vAlign=top>
                  <TD colSpan=3> 
                    <div align="right"><IMG height=22 src="images/qyzh.GIF"
                  width=406 border=0 name=n1_r1_c1></div>
                  </TD>
                  <TD width="1"><IMG height=21 src="" width=1 border=0></TD>
                </TR>
              <TR vAlign=top>
                  <TD width="8"> <IMG height=162 src="images/1_r2_c1.jpg" width=8
                  border=0 name=n1_r2_c1></TD>
                  <TD width="400">
                    <TABLE class=p1 cellSpacing=0 cellPadding=0 width="100%"
                  border=0>

                    <TR vAlign=top>
                        <TD height=10>&nbsp; </TD>
                      </TR>
                      <TR valign="top"> 
                        <TD height=28> 
                          <DIV align=right>
                            <table width="360" border="0" cellspacing="0" cellpadding="0" align="center" class="p9">
                              <tr valign="top"> 
                                <td colspan="2"><%
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT * From diqu Order By id"
RS.open sql,Conn,3,3
 do while not rs.eof %> <a href=diqu.asp?diqu=<%=rs("diqu")%>><font color=#000000>◆ <%=rs("diqu")%> </font></a> 
                                  <%
RS.MoveNext
Loop
rs.close
%></td>
                              </tr>
                            </table>
                            
                          </DIV>
                        </TD></TR></TABLE></TD>
                  <TD width="8"><IMG height=162 src="images/1_r2_c3.jpg" width=8
                  border=0 name=n1_r2_c3></TD>
                  <TD width="1"><IMG height=126 src="" width=1 border=0></TD>
                </TR>
              <TR vAlign=top>
                <TD colSpan=3>
                    <div align="center"><IMG height=9 src="images/1_r3_c1.jpg"
                  width=407 border=0 name=n1_r3_c1></div>
                  </TD>
                  <TD width="1"><IMG height=9 src="" width=1 border=0></TD>
                </TR></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width=406 border=0>

              <TR>
                <TD><IMG height=1 src="" width=10 border=0></TD>
                <TD><IMG height=1 src="" width=381 border=0></TD>
                <TD><IMG height=1 src="" width=15 border=0></TD>
                <TD><IMG height=1 src="" width=1 border=0></TD></TR>
              <TR vAlign=top>
                  <TD colSpan=3><IMG height=22 src="images/qykx.GIF"
                  width=406 border=0 name=n2_r1_c1></TD>
                <TD><IMG height=22 src="" width=1 border=0></TD></TR>
              <TR vAlign=top>
                <TD><IMG height=128 src="images/2_r2_c1.jpg" width=10
                  border=0 name=n2_r2_c1></TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" align=right
                  border=0>

                    <TR>
                      <TD class=p1 vAlign=top width="70%" rowSpan=3>
                        <TABLE class=p1 cellSpacing=0 cellPadding=0 width="100%"
                        border=0>

                          <TR>
                              <TD><br>
                                <%
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT top 7 * From news Order By id DESC"
RS.open sql,Conn,3,3
 do while not rs.eof %>◎&nbsp; <a href=javascript:winopen('dismemo.asp?id=<%=rs("id")%>')><font color=#000000><%=rs("biaoti")%></font> 
                                </a><br>
<%
RS.MoveNext
Loop
rs.close
%>
               </TD>
                            </TR></TABLE></TD>
                      <TD><IMG height=90 hspace=1 src="images/tu2.gif"
                        width=110 vspace=1></TD></TR>
                    <TR>
                        <TD align=middle>
                          <div align="center"><FONT
                        color=#000000>图片信息</FONT> </div>
                        </TD>
                      </TR></TABLE></TD>
                <TD><IMG height=128 src="images/2_r2_c3.jpg" width=15
                  border=0 name=n2_r2_c3></TD>
                <TD><IMG height=128 src="" width=1 border=0></TD></TR>
              <TR vAlign=top>
                <TD colSpan=3><IMG height=5 src="images/2_r3_c1.jpg"
                  width=406 border=0 name=n2_r3_c1></TD>
                <TD><IMG height=5 src="" width=1 border=0></TD></TR></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

              <TR>
                <TD
        class=unnamed1>&nbsp;</TD></TR></TABLE></DIV></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

        <TR>
          <TD class=p5>&nbsp;</TD></TR></TABLE>
      <TABLE class=p1 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TR vAlign=top> 
          <TD bgColor=#dbe0e6 colSpan=2 height=24> 
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR> 
                <TD width="2%" height=23>&nbsp;</TD>
                <TD width="97%" height=23><font color="#000099">最新加入企业</font></TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <TR vAlign=top> 
          <TD class=p5 colSpan=2 height=2> 
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR> 
                <TD class=unnamed1>&nbsp;</TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <TR vAlign=top> 
          <TD colSpan=2 height=12> 
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR> 
                <TD width="2%" bgColor=#eff1f2>&nbsp;</TD>
                <TD width="97%" bgColor=#eff1f2><%
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT top 7 * From qiye Order By id DESC"
RS.open sql,Conn,3,3
 do while not rs.eof %>◆&nbsp; 
                  <a href=qiye.asp?diqu=<%'=rs("diquid")%>&id=<%=rs("id")%>><font color=#000000><%=rs("企业名称")%></font> 
                  </a><br>
                  <%
RS.MoveNext
Loop
rs.close
%> </TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <TR vAlign=top> 
          <TD>&nbsp; </TD>
        </TR>
      </TABLE>
      <TABLE height=6 cellSpacing=0 cellPadding=0 width="100%" border=0>

        <TR>
          <TD class=unnamed1 height=4>&nbsp;</TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TR bgcolor="#dbe0e6" valign="top"> 
          <TD colSpan=2> 
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR> 
                <TD width="2%" height=13>&nbsp;</TD>
                <TD width="98%" height=20><font color="#000099">最新产品信息</font></TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <TR> 
          <TD bgColor=#ffffff colSpan=2 height=23>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td width="22%"> <img src="chanpinimg/3339_9606.jpg" width="88" height="150"></td>
                <td width="10%" valign="bottom">样品名： SYB-IV 全自动液体包装机</td>
                <td width="20%"> 
                  <div align="right"><img src="chanpinimg/3339_9607.jpg" width="93" height="150"></div>
                </td>
                <td width="13%" valign="bottom">样品名： SLYB-I立式袋全自动液体包装机</td>
                <td width="20%" valign="bottom"><img src="chanpinimg/3339_9604.jpg" width="80" height="150"></td>
                <td width="15%" valign="bottom">样品名：<br>
                  DXDK150III<br>
                  型（原DXD-150型多功能包装机）</td>
              </tr>
              <tr> 
                <td width="22%">&nbsp;</td>
                <td width="10%">&nbsp;</td>
                <td width="20%">&nbsp;</td>
                <td width="13%">&nbsp;</td>
                <td width="20%">&nbsp;</td>
                <td width="15%">&nbsp;</td>
              </tr>
            </table>
          </TD>
        </TR>
      </TABLE>
    </TD>
    <TD class=p1 vAlign=top align=middle width=142 colSpan=3 bgcolor="#e7e8e9"
rowSpan=2> 
      <TABLE cellSpacing=0 cellPadding=0 width=181 bgColor=#e7e8e9 border=0>
        <TR vAlign=top> 
          <TD height=18> 
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR> 
                <TD><IMG height=197 src="images/du.GIF" width=177
                  useMap=#DEFAULT.HTM#Map border=0><map name="DEFAULT.HTM#Map"><area shape="rect" coords="97,135,127,152" href="diqu.asp?diqu=1"><area shape="rect" coords="94,91,123,120" href="diqu.asp?diqu=2"><area shape="rect" coords="12,138,62,163" href="diqu.asp?diqu=3"><area shape="rect" coords="66,144,93,169" href="diqu.asp?diqu=4"><area shape="rect" coords="116,41,169,81" href="diqu.asp?diqu=5"><area shape="rect" coords="129,86,167,117" href="diqu.asp?diqu=6"><area shape="rect" coords="43,48,78,76" href="diqu.asp?diqu=7"><area shape="rect" coords="45,83,88,108" href="diqu.asp?diqu=8"><area shape="rect" coords="89,27,109,82" href="diqu.asp?diqu=9"><area shape="rect" coords="12,105,46,129" href="diqu.asp?diqu=10"></map></TD>
              </TR>
              <TR> 
                <TD> 
                  <DIV align=center></DIV>
                </TD>
              </TR>
              <TR> 
                <TD>&nbsp;</TD>
              </TR>
              <TR> 
                <TD> 
                  <table border=0 cellpadding=0 cellspacing=0
width=178 height="100" bgcolor="#e7e8e9">
                    <form name=member action="admin/ru.asp" method=post>
                      <tr valign="middle"> 
                        <td  height=26 colspan="2" bgcolor="#999999"> 
                          <div align=center><span style="font-size:9pt"><font color="#FFFFFF">-会员登录-</font></span></div>
                        </td>
                      </tr>
                      <tr> 
                        <td valign=bottom> 
                          <div align=right><span style="font-size:9pt"><font color="red">会员名：</font></span></div>
                        </td>
                        <td valign=bottom width="117"> 
                          <div align="center"><font color=#000000
                              size=3> 
                            <input  maxlength=12 name=txtmemberno
                              size=12 class="input">
                            </font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td height=26 valign=bottom width="56"> 
                          <div align="right"><span style="font-size:9pt"><font color="red">密&nbsp;码：</font></span></div>
                        </td>
                        <td valign=bottom width="117"> 
                          <div align="center"><font color=#000000
                              size=3> 
                            <input  maxlength=12 name=txtpassword
                              size=12 type=password  class="input">
                            </font></div>
                        </td>
                      </tr>
                      <tr valign=bottom> 
                        <td height=26 width="56" valign="middle"> 
                          <div align=center> 
                            <input type="image" name=ok2  src="images/denglu.gif" border="0" alt="登录" width="46" height="20">
                          </div>
                        </td>
                        <td height=26 width="117" valign="middle"> <span style="font-size:9pt">&nbsp;&nbsp;&nbsp;<a
                              href="admin/addqiye.asp">&nbsp;注册企业</a></span> </td>
                      </tr>
                    </form>
                  </table>
                </TD>
              </TR>
              <TR> 
                <TD height="50"> 
                  <DIV align=center>把你的企业信息加入这里</DIV>
                </TD>
              </TR>
              <TR> 
                <TD> 
                  <DIV align=center><img height=63
            src="images/banner1.gif" width=122 border=0><br>
                    免费共享房源 </DIV>
                </TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
        <TR> 
          <TD height=18></TD>
        </TR>
        <TR vAlign=top> 
          <TD> 
            <DIV align=center><BR>
              <a href="http://www.bjxx.net" target="_blank"><img src="images/dlogo.gif" width="89" height="33" border="0"><br>
              <br>
              <img src="images/gqxxlogo.gif" width="88" height="31" border="0"><br>
              <br>
              <img src="images/bjxx.gif" width="88" height="31" alt="本站连接图标" border="0"></a><br>
              <br>
              征集图标连接 <BR>
              <BR>
              <BR>
              <BR>
              <BR>
              <BR>
            </DIV>
          </TD>
        </TR>
      </TABLE>
    </TD>
  </TR></TABLE>
<hr size="1" align="center" width="765">
<p align="center" class="p1">北京在线 版权所有<br>
  制作维护：北京昂莱网络技术有限公司<br>业务咨询：010-81585846传真：010-81587803 <script language=javascript src="http://www.bjxx.net/jsq/counter.asp?name=bjxx&id=21"></script></p>
</BODY></HTML>

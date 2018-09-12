<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<%
Dim bianhao,spid,pro_jg,pro_sl,pro_mone,wuliu,feiyong,pro_news,arr_news
Dim isdataman
Dim i
Dim padd,Sql 
Dim padd2,Sql2
Dim cg,cg_id




Set cg = Conn.Execute("Select username From [login] Where username='"&adu&"'")
cg_id = cg(0)
cg.Close
Set cg=Nothing

XJBH = Trim(Request.Form("XJBH"))
CZRQ = Trim(Request.Form("CZRQ"))
CZR = Trim(Request.Form("CZR"))
fj = Trim(Request.Form("fj"))

Set se=Conn.Execute("Select * From [XJRJZ] Where XJBH='"&XJBH&"'")
If Not se.Eof Then
Response.Write "<script language=javascript>alert('财务凭证已存在!');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
response.end
end if


jhj=0
dhj=0
For i=1 to Request.Form("spsl")
 spid = Trim(Request.Form("spid"&i))
 score = Trim(Request.Form("score"&i))

 pro_news = Trim(Request.Form("pro_news"&i))
 pro_sl = Trim(Request.Form("pro_sl"&i))
 remark = Trim(Request.Form("remark"&i))

  If spid="" or pro_sl="" or score=""  or pro_news="" then
Response.Write "<script language=javascript>alert('数据不正常!有缺失！');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
response.end
  end if

  If score="借" then
jhj=jhj+cdbl(pro_sl)
else
dhj=dhj+cdbl(pro_sl)	
  end if
   
Next

  If jhj<>dhj then
Response.Write "<script language=javascript>alert('借贷不相等！');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
response.end
  end if






jehj=0
For i=1 to Request.Form("spsl")
 spid = Trim(Request.Form("spid"&i))
 score = Trim(Request.Form("score"&i))

 pro_news = Trim(Request.Form("pro_news"&i))
 pro_sl = Trim(Request.Form("pro_sl"&i))
 remark = Trim(Request.Form("remark"&i))


  If spid="" or pro_sl="" or score=""  or pro_news="" then
Response.Write "<script language=javascript>alert('数据不正常!有缺失！');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
     exit for
  Else
  Set padd = Server.CreateObject("ADODB.RecordSet")
  Sql = "Select * From [XJRJZMX] Where (ID is null)"
  padd.Open Sql,Conn,1,3
  padd.addNew
  padd("XJBH") = XJBH
  padd("XJCODE") = spid
  padd("XJNAME") = pro_news
  padd("XJMONEY") = pro_sl
  padd("SCORE") = score
  padd("CZRQ") = CZRQ
  padd("CZR") = CZR
  padd("REMARK") = remark
if score="借" then
  padd("fh") = 1
jehj=jehj+cdbl(pro_sl)
else  
  padd("fh") = -1
end if  	

   Set pro = Conn.Execute("Select lb From [XJLB] Where XJCODE='"&spid&"'")
   lb = pro(0)
   pro.Close
 padd("lb") = lb   
 padd("zt") = "未审" 
  padd.Update
  padd.Close
  Set padd=Nothing
  End if
'End if
Next

  Set padd2 = Server.CreateObject("ADODB.RecordSet")
  Sql2 = "Select * From [XJRJZ] Where (ID is null)"
  padd2.Open Sql2,Conn,1,3
  padd2.addNew
  padd2("XJBH") = XJBH
  padd2("CZRQ") = CZRQ
  padd2("CZR") = CZR
  padd2("fj") = fj
  padd2("jehj") = jehj
  padd2("zt") = "未审"
  padd2("mxs") = Request.Form("spsl")
  padd2.Update
  padd2.Close
  Set padd2=Nothing

  ''Conn.Execute("Update [Cgxunjia] Set cgid='"&bianhao&"' Where xunjia_id in ("&xjd&")")
  Conn.Close
  Set Conn=Nothing

  Response.write "<script language='javascript'>alert('财务凭证添加成功!');" & chr(13)
  Response.write "window.document.location.href='cwpz_add.asp';</script>"

%>
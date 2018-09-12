<%
'On Error Resume Next
sql="select * from config"
set rs_config=conn.execute(sql)
dianming=rs_config("dianming")
jieshaojifen=rs_config("jieshaojifen")
xuhuijifen=rs_config("xuhuijifen")
baojin=rs_config("baojin")
baojin2=rs_config("baojin2")
dayin1=rs_config("dayin1")
dayin2=rs_config("dayin2")
showpic=rs_config("showpic")
maxrecord=rs_config("maxrecord")
maxproduit=rs_config("maxproduit")
tiqian=rs_config("tiqian")
%>
<!--#include file="inc/SF_Sql.asp"-->
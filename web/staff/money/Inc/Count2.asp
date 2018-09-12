<%
Dim ko,Sql
Dim cai_id,cai_sl,cai_dic
Dim SumKuan

Function AllKuan(cai_id)
Set ko=Server.CreateObject("Adodb.RecordSet")
Sql="Select Cai_ID,Shuliang,Money From [CaiGou2] Where Cai_ID='"&cai_id&"'"
ko.Open Sql,Conn,1,1
Do While Not ko.Eof
   cai_id = ko(0)
   cai_sl = ko(1)
   cai_dic = ko(2)
 SumKuan = SumKuan + cai_sl*cai_dic
ko.MoveNext
Loop
ko.Close
Set ko=nothing
AllKuan = SumKuan
End Function
%>






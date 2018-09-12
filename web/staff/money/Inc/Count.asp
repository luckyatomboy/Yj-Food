<%
Dim co,Sql,pro
Dim pro_id,pro_sl,pro_dic
Dim pro_mon
Dim SumMoney

Function AllMoney(ord_id,jgl)
Set co=Server.CreateObject("Adodb.RecordSet")
Sql="Select Product_ID,Out_ShuLiang,Discount From [Order2] Where Order_ID='"&ord_id&"'"
co.Open Sql,Conn,1,1
Do While Not co.Eof
   pro_id = co(0)
   pro_sl = co(1)
   pro_dic = co(2)
   Set pro = Conn.Execute("Select Money From [Product] Where Product_ID='"&pro_id&"'")
   pro_mon = pro(0)
   pro.Close
   Set pro=Nothing
           If pro_dic=0 Then
              SumMoney = SumMoney+(pro_mon*pro_sl*(jgl/100))
           Else
              SumMoney = SumMoney + (pro_dic*pro_sl)
           End if
co.MoveNext
Loop
co.Close
Set co=nothing

AllMoney = SumMoney

End Function
%>






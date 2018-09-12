<%
Dim mm,mle,yy,prp

Function Product(pro_id)
Set prp = Conn.Execute("Select Name From [Product] Where Product_ID='"&pro_id&"'")
Product = prp(0)
prp.Close
Set prp=Nothing
End Function

Function Product_Mon(pro_id)
Set prp = Conn.Execute("Select Money From [Product] Where Product_ID='"&pro_id&"'")
Product_Mon = prp(0)
prp.Close
Set prp=Nothing
End Function

Function Product_GuiGe(pro_id)
Set prp = Conn.Execute("Select GuiGe From [Product] Where Product_ID='"&pro_id&"'")
Product_GuiGe = prp(0)
prp.Close
Set prp=Nothing
End Function

Function Customer_Na(ke_id)
Set mm = Conn.Execute("Select Customer From [Customer] Where Customer_ID='"&ke_id&"'")
Customer_Na = mm(0)
mm.Close
Set mm=Nothing
End Function

Function Customer_Lev(ke_id)
Set mm = Conn.Execute("Select Levels From [Customer] Where Customer_ID='"&ke_id&"'")
if not mm.eof then
Customer_Lev = mm(0)
end if
mm.Close
Set mm=Nothing
End Function

Function Customer_Disc(ke_lev)
Set mle = Conn.Execute("Select Discount From [Customer_Level] Where Customer_Levels='"&ke_lev&"'")
if not mle.eof then
Customer_Disc = mle(0)
end if
mle.Close
Set mle=Nothing
End Function

Function User_Name(ywy_id)
Set yy = Conn.Execute("Select User_Name From [HQ_User] Where ID="&ywy_id)
User_Name = yy(0)
yy.Close
Set yy=Nothing
End Function
%>






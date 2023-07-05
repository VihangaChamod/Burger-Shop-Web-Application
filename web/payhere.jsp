<%-- 
    Document   : payhere
    Created on : May 17, 2021, 8:15:58 AM
    Author     : DELL
--%>
<% HttpSession sea=request.getSession();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        <title>PayHere</title>
        
        <script>
                function back(){
                    
                    window.location.replace("payment.jsp");
                }
        </script>
    </head>
    <body style="font-size: 25px;color: #ffffff; background-image: url('img/ba3.png');">
<center>
    <div style="background-color: #000000;width: 700px;height: 600px;border-radius: 10px;">
<form method="post" action="https://sandbox.payhere.lk/pay/checkout">   
    <input type="hidden" name="merchant_id" value="1217303">    <!-- Replace your Merchant ID -->
    <input type="hidden" name="return_url" value="http://localhost:8080/final_Web/online_payment_last">
    <input type="hidden" name="cancel_url" value="http://localhost:8080/final_Web/main.jsp">
    <input type="hidden" name="notify_url" value="http://localhost:8080/final_Web/main.jsp">  
    <br><br>Item Details<br>
    <input readonly type="text" name="order_id" value="item :<%out.print(sea.getAttribute("temp_id"));%>02#">
    <input readonly type="text" name="items" value="FOODS"><br>
    <input readonly type="text" name="currency" value="LKR">
    <input readonly type="text" name="amount" value=<%out.print(sea.getAttribute("total"));%>>  
    <br><br>Customer Details<br>
    <input type="text" name="first_name"placeholder="Name">
    <input type="text" name="last_name" placeholder="Middle name"><br>
    <input type="text" name="email"  placeholder="Email">
    <input type="text" name="phone"  placeholder="Mobile"><br>
    <input type="text" name="address" placeholder="Addres">
    <input type="text" name="city" value="Colombo" placeholder="City">
    <input type="hidden" name="country" value="Sri Lanka"><br><br> 
    <input style="width: 300px;" class="btn-danger" type="submit" value="Buy Now">
</form> 
        <div style="padding: 10px;">     <button onclick="back()" class="btn btn-success" style="width: 200px; ">Back</button></div> 

        </div>
    </center>
</body>
</html>

<%-- 
    Document   : succesful
    Created on : May 17, 2021, 10:41:06 AM
    Author     : DELL
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sea=request.getSession();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        <title>Congratulation</title>
        
        <script>
            
                  function homepage(){

       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
             window.location.replace("main.jsp");

    }
  };
  xhttp.open("GET", "removeTemp", true);
  xhttp.send();  

    
                
            }
        </script>
    </head>
    <body style="background-image: url('img/ba3.png');">
    <center><br>
        <div style="background-color: #000000;color: #ffffff;width:900px;border-radius: 20px;">
        <h1>THANK YOU FOR YOUR ORDER!</h1>
        <h2>Your Order Placed!</h2>
        <h3>We Will Try To Give Your Best Foods! And Fast Delivery!</h3>
        <h3>Date :</h3>
        <h3><%out.print(new Date());%></h3>
         <h3>Order Id :</h3>
         <h3>Y00H##<%out.print(sea.getAttribute("temp_id"));%></h3>
                        <div style="padding: 10px;">     <button onclick="homepage()" class="btn btn-success" style="width: 200px; ">Home Page</button></div> 

</div>
        
        
        
    </center>
    </body>
</html>

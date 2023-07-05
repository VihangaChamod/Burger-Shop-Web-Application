<%-- 
    Document   : payment
    Created on : May 16, 2021, 11:29:16 AM
    Author     : DELL
--%>
<% HttpSession sea=request.getSession();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        <title>Payment</title>
        
        <script>
                function check() {
   mobile = document.getElementById("num").value;
  addres = document.getElementById("addr").value;

                   
  if (document.getElementById("delivary").checked) {
   var mobile,addres;
  mobile = document.getElementById("num").value;
  addres = document.getElementById("addr").value;

   

 var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       window.location.replace("succesful.jsp");  
  
    }
  };
  xhttp.open("POST", "payment", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("mobile="+mobile+"&addres="+addres+"");


}else if (document.getElementById("online").checked) {
               
       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      	       window.location.replace("payhere.jsp"); 

  
    }
  };
  xhttp.open("POST", "payment_online", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("mobile="+mobile+"&addres="+addres+"");        
               

}

}

function back(){
     window.location.replace("chekout.jsp"); 
    
}

        </script>
            
    </head>
    <body style="background-image: url('img/ba3.png');">
    <center>
        <div style="background-color: #000000;width: 900px;height: 500px; margin-top: 50px; border-radius: 20px;">
            

            <br>
            
            <h1 style="color: #ffffff;">Payment Options</h1>            <br>


        
            <table style="font-size: 25px; color: #ffffff">
            <tbody>
                
                <tr>
                    <td>Mobile number</td>
                    <td><input id="num" style="width: 400px; height: 30px;" type="number" value="<%out.print(sea.getAttribute("mobile"));%>"/></td>

                </tr>
                
                 <tr>
                    <td>Delivery Addres</td>
                    <td><input id="addr" style="width: 400px; height: 80px;" type="text" value="<%out.print(sea.getAttribute("addres"));%>"/></td>

                </tr>
                
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                       <tr>
                           <td><h1></h1></td>
                    <td></td>
                </tr>    
                    <tr>
                        <td style="color: #23E3C9;font-size: 33px">Select payment Methord :</td>
                      
                </tr>
               
                  <tr>
                      <td></td>   
                      <td style="text-align: center;color: #ffcc00;"><span>Cash On Delivary </span><input class="form-check-input" id="delivary" name="pay" type="radio"/></td>
                    
                </tr>
                
                <tr>
                                          <td></td>   
                                          <td style="text-align: center;color: #ffcc00;"><span>Online Pay Bill </span><input class="form-check-input" id="online"  name="pay" type="radio"/></td>
                                             

                </tr>
                                           <td><h1></h1></td>

                <tr>
                                          
                    <td><div style="padding: 10px;">     <button onclick="back()" class="btn btn-success" style="width: 200px; ">Back</button></div> 
</td>   
                                          <td style="text-align: end; width: 200px; height: 50px;"><button onclick="check()" class="btn-danger" style="width: 200px;">Confirm</button></td>   

                </tr>
                
            </tbody>
            
        </table>
            </div>
        </center>
    </body>
</html>

<%-- 
    Document   : profile
    Created on : May 14, 2021, 1:05:19 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
           HttpSession sea=request.getSession();
           
        String id=sea.getAttribute("id").toString();
        String img=sea.getAttribute("img").toString();
        String nic=sea.getAttribute("nic").toString();
        String usname=   sea.getAttribute("username").toString();
        String pass=  sea.getAttribute("password").toString();
        String addres=  sea.getAttribute("addres").toString();
        String mobile= sea.getAttribute("mobile").toString();
           

       
        %>
        
<!DOCTYPE html>
<html>
    <head>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
          <link type="text/css" rel="stylesheet" href="css/text.css"/>
          <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>
        
        <script>
            function logout(){
                var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
      window.location.replace("login.jsp");
      
      
    }
  };
  xhttp.open("GET", "logout", true);
  xhttp.send();  
                
            }
            
            
            function homepage(){

        window.location.replace("main.jsp");
    
                
            }
            
        </script>
        
    </head>
           <body style="background-image: url('img/ba1.png');">

   
        
       
              

    <center>
        <div  style="background-color: #000000; height: 1100px;; width: 900px;border-radius: 20px;">
                        <div style="padding: 10px; position: absolute">     <button onclick="homepage()" class="btn btn-success" style="width: 200px; ">Home Page</button></div> 

            <div style="margin-left: 680px;padding: 10px;">     <button onclick="logout()" class="btn btn-danger" style="width: 200px; ">LOG OUT</button></div> 
     <form method="post" action="updateprofile" enctype="multipart/form-data">

 
      
        <div>
                            
              <h1 style="color: #23E3C9">Profile Page</h1> 
            <br>

            <h2 style="color: #ffffff">Profile Picture</h2>
           
            <div style="background-color: #ffffff;width: 250px;border-radius: 90px; position: static">
                <img id="output" src="upload/<%out.print(img);%>"/><br>
            </div><br>
         
            <input  name="file" id="image" style="font-family: fantasy;background-color: #23E3C9" type="file" accept="image/*" onchange="loadFile(event)"><br>
            
             <h2 style="color: #ffffff">Nic</h2>
             <input value="<%out.print(nic);%>" name="nic" id="nic" style="text-align: center; width: 450px;" class="form-control" placeholder="Nic" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              
            <h2 style="color: #ffffff">User Name</h2>
            <input value="<%out.print(usname);%>" name="uname" id="uname" style="text-align: center; width: 450px;" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
           
            <h2 style="color: #ffffff">Password</h2>
            <input value="<%out.print(pass);%>"value="<%out.print(nic);%>" name="pass" id="pass" style="text-align: center;width: 450px;"  class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1" type="password"/>
            <br>           

             <h2 style="color: #ffffff">Addres</h2>
             <input value="<%out.print(addres);%>" name="addres" id="addres" style="height: 70px;text-align: center; width: 450px;"  class="form-control" placeholder="Addres" aria-label="Username" aria-describedby="basic-addon1"type="text"/>
            <br>           

             <h2 style="color: #ffffff">Mobile</h2>
             <input value="<%out.print(mobile);%>" name="mobile" id="mobile" style="text-align: center; width: 450px;" class="form-control" placeholder="Mobile" aria-label="Username" aria-describedby="basic-addon1" type="number"/>
            <br>            <br>
            
            
            
            <input  style="width: 550px;height: 45px;color: #000000;" value="Update" type="submit" class="btn btn-success"/>
        </div>
       
         </form>
            </div>
        </center>

    
    </body>
</html>

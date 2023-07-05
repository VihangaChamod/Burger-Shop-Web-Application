<%-- 
    Document   : register
    Created on : Apr 26, 2021, 11:07:28 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="css/text.css"/>
               <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

        
        
        <script>

        var loadFile = function(event) {
            
         var output = document.getElementById('output');
             output.src = URL.createObjectURL(event.target.files[0]);
           
          
        output.onload = function() {
             URL.revokeObjectURL(output.src); // free memory
        };
            };
    
        
        
        function register(){
           
           var img = document.getElementById('image').value.innerHTML;
          
           var nic = document.getElementById('nic').value;
           var username = document.getElementById('uname').value;
           var password = document.getElementById('pass').value;
           var addres = document.getElementById('addres').value;
           var mobile = document.getElementById('mobile').value;

                
         
               var dataArray = {"img":img,"nic":nic,"username":username,"password":password,"addres":addres,"mobile":mobile};
               var JsonObj = JSON.stringify(dataArray);
                                      
               var xhttp = new XMLHttpRequest;
               xhttp.onreadystatechange = function(){
                   
                   if(this.readyState == 4 && this.status == 200){
                       
                       var respone = this.responseText;
                       alert(respone);
//                    if (respone=="ok") {
//                        
//                        alert("register succesfull!");
//                     
//                window.location.href="http://localhost:8080/final_Web/login.jsp";
//   
//                        } else {
//                            
//                            alert("Pleace Try Again");
//                               
//                            }
                       
                       
                       
                   }
               }
             xhttp.open("POST","register",true);
             xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
             xhttp.send("prameter="+JsonObj);
           
           
           
           
        }
        

        </script>
        
    </head>
 <body style="background-image: url('img/output-onlinepngtools.png');">
        
    <center>
     <form method="post" action="register" enctype="multipart/form-data">

 
      
        <div style="background-color: #000000; height: 1000px;; width: 800px">
                            
            <h1 style="color: #23E3C9">Register Page</h1>
            <br>

            <h2 style="color: #ffffff">Profile Picture</h2>
           
            <div style="background-color: #ffffff;width: 250px;border-radius: 90px; position: static">
                <img id="output" src="img/profile.png"/><br>
            </div><br>
         
            <input name="file" id="image" style="font-family: fantasy;background-color: #23E3C9" type="file" accept="image/*" onchange="loadFile(event)"><br>
            
             <h2 style="color: #ffffff">Nic</h2>
             <input name="nic" id="nic" style="text-align: center; width: 450px;" class="form-control" placeholder="Nic" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              
            <h2 style="color: #ffffff">User Name</h2>
            <input name="uname" id="uname" style="text-align: center; width: 450px;" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
           
            <h2 style="color: #ffffff">Password</h2>
            <input name="pass" id="pass" style="text-align: center;width: 450px;"  class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1" type="password"/>
            <br>           

             <h2 style="color: #ffffff">Addres</h2>
             <input name="addres" id="addres" style="height: 70px;text-align: center; width: 450px;"  class="form-control" placeholder="Addres" aria-label="Username" aria-describedby="basic-addon1"type="text"/>
            <br>           

             <h2 style="color: #ffffff">Mobile</h2>
             <input name="mobile" id="mobile" style="text-align: center; width: 450px;" class="form-control" placeholder="Mobile" aria-label="Username" aria-describedby="basic-addon1" type="number"/>
            <br>            <br>
            
            
            
            <input  style="width: 550px;height: 45px;color: #000000;" type="submit" class="btn btn-success"/>
        </div>
       
         </form>
        </center>

    </body>
</html>

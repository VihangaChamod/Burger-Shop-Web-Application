<%-- 
    Document   : login
    Created on : Apr 26, 2021, 11:21:26 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
     <head>
        <title>Log In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

         <link type="text/css" rel="stylesheet" href="stlys.css"/>
        
        
       

       <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
       
       <script>
                        var counter = 1;
    setInterval(function(){
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if(counter > 4){
        counter = 1;
      }
    }, 5000); 
    
    
    
    
        function loginPart(){
            
          var name= document.getElementById('name').value.toString();
          var password= document.getElementById('password').value.toString();

            var xhttp = new XMLHttpRequest();
 
 var dataArray = {"name":name,"password":password};
               
        var JsonObj = JSON.stringify(dataArray);
 
        xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     
     var s=this.responseText;
     
     if (s=="ok") {
         alert("Welocome To Yum Bun Yum Home Page!");
         
         window.location.replace("http://localhost:8080/final_Web/main.jsp#");
   
} else {
}
     
     
    }
  };
  xhttp.open("POST", "login", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("data="+JsonObj);
           
            
        }
    
    
    function userSelect(){
        
                 var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
     
     var array=JSON.parse(this.responseText);
    
           
         for (var item of array) {
             
             document.getElementById('name').value=item.usname;
             document.getElementById('password').value=item.pass;

         }
        
        
    }
  };
  xhttp.open("GET", "userSelect", true);
  xhttp.send();  
        
    }
    
       </script>
     
       
    </head>
    <body onload="userSelect();" style="background-image: url('img/ba3.png');">
        
        
        
    <center>
        
       <div style="background-color: #000000; height: 900px;; width: 900px">
        
        
        <h1 style="color: #ffffff">Log In Page</h1>
        
        
                     <!--image slider start-->
    <div class="slider">
      <div class="slides">
        <!--radio buttons start-->
        <input type="radio" name="radio-btn" id="radio1">
        <input type="radio" name="radio-btn" id="radio2">
        <input type="radio" name="radio-btn" id="radio3">
        <input type="radio" name="radio-btn" id="radio4">
        <!--radio buttons end-->
        <!--slide images start-->
        <div class="slide first">
            <img src="img/ba1.png" alt="">
        </div>
        <div class="slide">
            <img src="img/ba2.png" alt="">
        </div>
        <div class="slide">
            <img src="img/ba3.png" alt="">
        </div>
        <div class="slide">
            <img src="img/ba2.png" alt="">
        </div>
        <!--slide images end-->
        <!--automatic navigation start-->
        <div class="navigation-auto">
          <div class="auto-btn1"></div>
          <div class="auto-btn2"></div>
          <div class="auto-btn3"></div>
          <div class="auto-btn4"></div>
        </div>
        <!--automatic navigation end-->
      </div>
      <!--manual navigation start-->
      <div class="navigation-manual">
        <label for="radio1" class="manual-btn"></label>
        <label for="radio2" class="manual-btn"></label>
        <label for="radio3" class="manual-btn"></label>
        <label for="radio4" class="manual-btn"></label>
      </div>
      <!--manual navigation end-->
    </div>
    <!--image slider end-->

  
        
        
        
        
        <div>
            
            <h2 style="color: #ffffff">User Name</h2>
            <input id="name" style="text-align: center; width: 450px;" class="form-control" placeholder="UserName" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>

                         
            <h2 style="color: #ffffff">Password</h2>
            <input id="password" style="text-align: center; width: 450px;" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1" type="password"/><br>

            <br>          


            <button onclick="loginPart()" style="width: 300px;" type="button" class="btn btn-outline-warning">Log In</button>
        </div>
    <br/>
    <div><a style="font-size: 20px;" href="index.jsp">I am New User!</a></div>
    
       </div>
      
        </center>
    </body>
</html>

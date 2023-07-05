<%-- 
    Document   : index
    Created on : Apr 26, 2021, 11:20:49 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Yum Bum Yum</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link type="text/css" rel="stylesheet" href="stlys.css"/>
        
        
       

       <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
       


        <script>
            
    
            
            
            
       $(document).ready(function(){
           
             $("#log").click(function(){
                
       
                
               window.location.href = 'login.jsp';

             });
             
             
               $("#reg").click(function(){
                
           
               window.location.href = 'register.jsp';

             });
             
             
             
               $("#gue").click(function(){
                
            
               window.location.href = 'main.jsp';
                
                
             });
             
 

        });
            
            
        
    
    
    
            
               var counter = 1;
    setInterval(function(){
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if(counter > 4){
        counter = 1;
      }
    }, 5000); 
          
            
        </script>
        
        
        
    </head>
      <body style="background-image: url('img/ba3.png');">

              
        
    <center>
              <div style="background-color: #000000; height: 1100px;; width: 900px;border-radius: 30px;">

        <div class="center">  <h1 style="color: #ffffff">Yun Bun Yum</h1>  </div>
        
        
        

      
        
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

    <br>
  
      

        
        <div class="login" id="log" >
            
            <h2 class="loginText" >LogIn</h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            <img src="img/login.png"/>
            
          
            
        </div>
        
          
        <div  class="login" id="reg" >
            
            <h2 class="loginText">Register</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <img src="img/register.png"/>
        </div>
          
   
      </div>
        </center>
    </body>
</html>

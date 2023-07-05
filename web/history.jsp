<%-- 
    Document   : history
    Created on : May 17, 2021, 7:44:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    
    <script>
        
     function history(){

       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
            var table = document.getElementById("table2");
          
            var array=JSON.parse(this.responseText);
    
       
       
         for (var item of array) {
    
 
 
//    document.getElementById('total2').innerHTML=tot.toString();

             var row = `<tr>
                
                        <td style="width: 100px; height: 110px; background-color:white;">`+`<img font-size: 25px; width="100px" height="100px" src="`+"adminImg/"+item.img+`;"/>`+`</div>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 18px; width: 350px">`+item.name+`</td>
                        <td style="width: 180px; height: 100px;  text-align: center; color: #ffffff; font-size: 18px;">`+item.price+`</td>
                        <td style="color: white; font-size: 25px;">`+item.qty+`</td>
                        <td style="color: white; font-size: 25px;">`+item.date+`</td>
                        <td style="color: white; font-size: 25px;text-align: center;">`+"Rs. "+item.qty*item.price+`</td>

 </tr>`
        table.innerHTML += row;
         
         }

    }
  };
  xhttp.open("GET", "history", true);
  xhttp.send();  

    
                
            }
            
            
            function  back(){
                
                window.location.replace("main.jsp");
            }

    </script>
    
    <body onload="history()">
    <center>
  <div style="padding: 10px;">     <button onclick="back()" class="btn btn-success" style="width: 200px; ">Back</button></div> 

        <div style="background-color: #000000; color: #ffffff">
            
            <table id="table2">
                
                <thead>
                <th>Food</th>
                <th>Food Name</th>
                <th>Price</th>
                <th>Food Qty</th>
                <th>Date</th>
                <th style="width: 200px;">Total Price</th>

                </thead>
                <tbody>
                    
                </tbody>
                
            </table>
            
            
            
        </div>
      </center>
    </body>
</html>

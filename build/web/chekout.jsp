<%-- 
    Document   : chekout
    Created on : May 16, 2021, 10:47:49 AM
    Author     : DELL
--%>

<%@page import="JDBC.DBMS"%>
<%@page import ="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        
            
        <title>Yum Bun Yum</title>
        
        <script>
            
            
           function m(){
          
        var table = document.getElementById("table");
                           
          for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }
                    
                    
                  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
     
     var array=JSON.parse(this.responseText);
    
       var tot=0;
       
         for (var item of array) {
    
       tot = tot+item.total;
 
    document.getElementById('total').innerHTML=tot.toString();

             var row = `<tr>
                        <td style="color: black; font-size: 25px;">`+item.id+`</td>
                        <td style="width: 100px; height: 110px; background-color:white;">`+`<img font-size: 25px; width="100px" height="100px" src="`+"adminImg/"+item.img+`;"/>`+`</div>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 18px; width: 350px">`+item.name+`</td>
                        <td style="width: 180px; height: 100px;  text-align: center; color: #ffffff; font-size: 18px;">`+item.price+`</td>
                
                        <td>`+`<button style="width: 110px;" class="btn btn-danger" onclick="min()">MIN</button>`+`</td>
                        <td style="width: 50px; height: 100px;  text-align: center; border: #ffffff;color: #ffffff; font-size: 18px;">`+item.qty+`</td>
                        <td>`+`<button style="width: 110px;" onclick="add()" class="btn btn-warning">ADD</button>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 25px; width: 350px">`+"Rs."+item.total+`</td>

 </tr>`
        table.innerHTML += row;
//           
         }
        } 
  };
  xhttp.open("GET", "cart", true);
  xhttp.send();  

        
    
    
       }

        function add(){
  
  var getInt,get, index, table = document.getElementById('table');
    
        for (var i=0; i < table.rows.length; i++) {
       
            table.rows[i].cells[6].onclick = function (){
                
        index = this.parentElement.rowIndex;  
        
        get=table.rows[index].cells[5].innerHTML;
        getInt = parseInt(get);
        getInt=getInt+1;
        table.rows[index].cells[5].innerHTML=getInt;
        
        
            addItem(index);
        
    
        
      };}
         
       };
       
       
       
       function addItem(index){
           var id,count,price;
           
            id=table.rows[index].cells[0].innerHTML;
           count=table.rows[index].cells[5].innerHTML;
         price=table.rows[index].cells[3].innerHTML;
         
          var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
       m(); 
    }
  };
  xhttp.open("GET", "addItem?id="+id+"&count="+count+"&price="+price, true);
  xhttp.send();  
           
   
       }
       
       
       
         
         
         
         function min(){
  
  var getInt,get, index, table = document.getElementById('table');
    
        for (var i=0; i < table.rows.length; i++) {
       
            table.rows[i].cells[4].onclick = function (){
                
        index = this.parentElement.rowIndex;  
        
        get=table.rows[index].cells[5].innerHTML;
        getInt = parseInt(get);
            
        if (getInt==0) {
   
            } else {
                getInt=getInt-1;
                             removeItem(index);
}
            
        table.rows[index].cells[5].innerHTML=getInt;
        
      

      };}
         
         
       };
            
     

function removeItem(index){
         
        var id,count,price;
           
            id=table.rows[index].cells[0].innerHTML;
           count=table.rows[index].cells[5].innerHTML;
         price=table.rows[index].cells[3].innerHTML;
         
          var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
     
     m();
    }
  };
  xhttp.open("GET", "removeItem?id="+id+"&count="+count+"&price="+price, true);
  xhttp.send();  
           
   
       }
            
            
            
            
                  function homepage(){

        window.location.replace("main.jsp");
    
                
            }
            
            
            
            function checkout(){

        var total=document.getElementById("total").innerHTML;
                                     

        var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
    window.location.replace("payment.jsp");  
     
    }
  };
  xhttp.open("POST", "totalPriceSet", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("total='"+total+"'");
       
    
                
            }


            

          
        </script>
        
    </head>
    <body  onload="m()"; style="background-image: url('img/ba3.png');">
    <center>
        
        
        
        
        <div style="background-color: #000000; width: fit-content; border-radius: 30px; padding: 10px;">
        <h1 style="text-align: center; color: #ffffff; ">Yum Bun Yum CheckOut</h1><br/>
       

                        <div style="padding: 10px;">     <button onclick="homepage()" class="btn btn-success" style="width: 200px; ">Home Page</button></div> 
                     
 




<table border="0" id="table">
            <thead>
                <tr style="background-color: #ffffff">
                    <th></th>
                    <th style="text-align: center; color: #000000; font-size: 25px;">Photo</th>
                    <th style="text-align: center; color: #000000; font-size: 25px;">Name</th>
                    <th style="text-align: center; color: #000000; font-size: 25px;">Price(RS.)</th>

                    <th style="text-align: center; color: #000000; width: 100px;"></th>                    
                    <th style=" color: #000000; font-size: 25px; ">QTY</th>
                    <th style="text-align: center; color: #000000; width: 100px"></th>
                    <th style="text-align: center; color: #000000; font-size: 25px;">(qty*price)</th>

                </tr>
            </thead>
            <tbody>
             
            </tbody>
        
        </table>
                   
                        
                        <div style="padding: 10px;"> <h3 style="color: #ffffff">Total : Rs. </h3> <h3 id="total" style="width: 400px; color: #ffffff "></h3></div> 

                        <div style="padding: 10px;">     <button onclick="checkout()" class="btn btn-outline-warning" style="width: 400px; ">Pay</button></div> 

               </div>
        
    
      </center> 
    </body>
    
</html>



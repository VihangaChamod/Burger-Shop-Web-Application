<%-- 
    Document   : admin
    Created on : Apr 26, 2021, 11:17:07 AM
    Author     : DELL
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entity.search"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mysql.cj.jdbc.result.ResultSetImpl"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import="JDBC.DBMS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Admin Panel</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
 
          <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
         <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         
           <script>
  
          
        var loadFile1 = function(event) {    
             var output1 = document.getElementById('output1');
             output1.src = URL.createObjectURL(event.target.files[0]);
             output.onload = function() {
             URL.revokeObjectURL(output.src); // free memory
        };
            };
    
    
    $( function() {
    $( "#tabs" ).tabs();
  } );
  
  
  
    
    
    var loadFile = function(event) {
         var output = document.getElementById('output');
             output.src = URL.createObjectURL(event.target.files[0]);
             output.onload = function() {
             URL.revokeObjectURL(output.src) // free memory
        }
            };
    
  
  
  
  function loadDataFromMysql(){

  
        let confirmAction = confirm("Are you sure to execute this action?");
        if (confirmAction) {
         
             var index, table = document.getElementById('table');
    for (var i=0; i < table.rows.length; i++) {
       table.rows[i].cells[5].onclick = function (){
           
         index = this.parentElement.rowIndex;  
//            alert(table.rows[index].cells[0].innerHTML);
          
            document.getElementById('idselect').value = table.rows[index].cells[0].innerHTML;
            document.getElementById('output1').src ="adminImg/"+table.rows[index].cells[2].innerHTML;
            document.getElementById('img').value =table.rows[index].cells[2].innerHTML;

            document.getElementById('funame').value = table.rows[index].cells[3].innerHTML;
            document.getElementById('fuprice').value = table.rows[index].cells[4].innerHTML;

       };}
         
        } else {
          alert("Action canceled");
        }

}
       
       
       
       
      function deleteRecord(){
          
            let confirmAction = confirm("Are you sure to execute this action?");
        if (confirmAction) {
             
             var index, table = document.getElementById('table');
    for (var i=0; i < table.rows.length; i++) {
       table.rows[i].cells[6].onclick = function (){
           
         index = this.parentElement.rowIndex;  
//            alert(table.rows[index].cells[0].innerHTML);
          
          var id = table.rows[index].cells[0].innerHTML; 
       
          var dataArray = {"id":id};
          var JsonObj = JSON.stringify(dataArray);
       
        var xhttp = new XMLHttpRequest();
      
        xhttp.onreadystatechange = function() {
             if (this.readyState == 4 && this.status == 200) {
                  
                  alert(this.responseText);
                 }
             };
         
            xhttp.open("POST", "adminDelete", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("prameter="+JsonObj);

       };} 
   
        } else {
          alert("Action canceled");
        }
       
      }
      
      function searchReq(){

         var x= document.getElementById('searchBox').value;
        
          
        var dataArray = {"keyWord":x};
        var JsonObj = JSON.stringify(dataArray);
       
        var xhttp = new XMLHttpRequest();
      
        xhttp.onreadystatechange = function() {
             if (this.readyState == 4 && this.status == 200) {                 
             
            
            var table = document.getElementById("table");

        for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }

      
       var array=JSON.parse(this.responseText);
  

  
       for (var item of array) {
 
   var row = `<tr>
                        <td>`+item.id+`</td>
                        <td>`+`<img width="110px" height="110px" src="`+"adminImg/"+item.img+`;"/>`+`</td>
                        <td>`+item.img+`</td>
                        <td>`+item.name+`</td>
                        <td>`+item.price+`</td>
                        <td>`+`<button onclick="loadDataFromMysql()" class="btn btn-warning">Update</button>`+`</td>
                        <td>`+`<button onclick="deleteRecord()" class="btn btn-danger">Delete</button>`+`</td>
                   </tr>`
        table.innerHTML += row
  
            }
        
        }
             };
         
            xhttp.open("POST","adminSearch", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("key="+JsonObj);
      }
       
       
      function m(){
           
                           var table = document.getElementById("table");
                           
                                

        for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }

               <% ResultSet rs = DBMS.SE("SELECT * FROM `catogary`");
                         while (rs.next()) { %>

             var row = `<tr>
                        <td style="color: black;">`+<%out.print(rs.getString("id_catogary"));%>+`</td>
                        <td>`+`<img width="110px" height="110px" src="`+"adminImg/"+"<%out.print(rs.getString("c_img"));%>"+`;"/>`+`</td>
                        <td>`+"<%out.print(rs.getString("c_img"));%>"+`</td>
                        <td>`+"<%out.print(rs.getString("c_name"));%>"+`</td>
                        <td>`+"<%out.print(rs.getString("c_price"));%>"+`</td>
                        <td>`+`<button class="btn btn-warning" onclick="loadDataFromMysql()">Update</button>`+`</td>
                        <td>`+`<button onclick="deleteRecord()" class="btn btn-danger">Delete</button>`+`</td>
                   </tr>`
        table.innerHTML += row
    
    
 
                          <% } %>  
           
           
             
           
           
       }
       
            function history(){
                
                   
            var table = document.getElementById("table2");

        for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }

       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
            var table = document.getElementById("table2");
          
            var array=JSON.parse(this.responseText);
    
       
       var total=0;
       
         for (var item of array) {
    
          total=total+item.qty*item.price;
 
    document.getElementById('total2').innerHTML="Total Price : "+total.toString();

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
  xhttp.open("GET", "adminHistoryView", true);
  xhttp.send();  

    
                
            }
            
            
       
       function sales(){
                
                   
            var table = document.getElementById("table4");

        for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }

       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
            var table = document.getElementById("table4");
          
            var array=JSON.parse(this.responseText);
    
       
       var total=0;
       
         for (var item of array) {
    
          total=total+item.qty*item.price;
 
    document.getElementById('total4').innerHTML="Total Price : "+total.toString();

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
  xhttp.open("GET", "adminHistoryView2", true);
  xhttp.send();  

    
                
            }
            
            
            
            function customers(){
                
                        
            var table = document.getElementById("table5");

        for (var x=table.rows.length-1; x>0; x--) {
                table.deleteRow(x);
            }

       var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      
            var table = document.getElementById("table5");
      
            var array=JSON.parse(this.responseText);
    
       var x=0;
  
       
         for (var item of array) {
    
         
 
 

             var row = `<tr>
                        <td style="color: white; font-size: 25px;">`+item.id+`</td>
                        <td style="width: 100px; height: 110px; background-color:white;">`+`<img font-size: 25px; width="100px" height="100px" src="`+"appImg/"+item.img+`;"/>`+`</div>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 18px; width: 350px">`+item.nic+`</td>
                        <td style="width: 180px; height: 100px;  text-align: center; color: #ffffff; font-size: 18px;">`+item.username+`</td>
                        <td style="color: white; font-size: 25px;">`+item.addres+`</td>
                        <td style="color: white; font-size: 25px;">`+item.mobile+`</td>

 </tr>`
        table.innerHTML += row;
                           x=x+1;   
                             document.getElementById('cusTotal').innerHTML="Customers :"+x.toString();


         }

    }
  };
  xhttp.open("GET", "customers", true);
  xhttp.send();  

                
            }
            
       
  </script>
  
    </head>
    <body style="background-color: #000000">
       
        
        
       <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Inserts Items</a></li>
    <li><a href="#tabs-2" onclick="m()">Upadate Delete Search</a></li>
    <li><a href="#tabs-3" onclick="history()">Responding Orders</a></li>
    <li><a href="#tabs-4" onclick="sales()">Complete All Sales And Income Search</a></li>
    <li><a href="#tabs-5"  onclick="customers()">Customer Details</a></li>
  </ul>
  <div id="tabs-1">

      <center>
      
          <form method="post" action="admin" enctype="multipart/form-data">
          
          <div style="background-color: #000000;height: auto;">
          <br>
          <h2 style="color: white;">Add New Foods</h2>
          <br>
         <div style="background-color: #ffffff;width: 600px;height: auto;border-radius: 40px;">
             <img id="output" src="img/ba1.png" width="600px" height="500px;";/><br></div><br>
                
             <input name="file" style="font-family: fantasy;background-color: #23E3C9" type="file" accept="image/*" onchange="loadFile(event)"><br><br>
            
                
             <h2 style="color: #ffffff">Food Name</h2>
             <input  name="fname" style="text-align: center; width: 450px;" class="form-control" placeholder="food Name" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              
             
              <h2 style="color: #ffffff">Food Price</h2>
              <input name="fprice" style="text-align: center; width: 450px;" class="form-control" placeholder="food Price" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              

             <input style="width: 550px;height: 45px;color: #000000;" type="submit" value="Add Data" class="btn btn-success"/>
                 <br><br>
             </div>
              
              </form>
              
           </center>
          </div>
        
         
           <div id="tabs-2">

           <center>
            <form method="post" action="adminUpdate" enctype="multipart/form-data">
          
          <div style="background-color: #000000;height: 900px; ">
          <br>
          <h2 style="color: white;">Food Update Select</h2>
          <input type="text" id="idselect" name="idselect" style="color: #000000; width: 0px;height: 0px; background-color: #000000; visibility: hidden"/>
          <br>
         <div style="background-color: #ffffff;width: 600px;height: auto;border-radius: 40px;">
             <img name="output1" id="output1" width="500px;" height="400px;" src="img/ba1.png"/><br></div><br>
             <input id="img" name="img" type="hidden"/>  
             <input id="file" name="file" style="font-family: fantasy;background-color: #23E3C9" type="file" accept="image/*" onchange="loadFile1(event)"><br><br>
            
                
             <h2 style="color: #ffffff">Food Name</h2>
             <input id="funame"  name="fname" style="text-align: center; width: 450px;" class="form-control" placeholder="food Name" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              
             
              <h2 style="color: #ffffff">Food Price</h2>
              <input id="fuprice" name="fprice" style="text-align: center; width: 450px;" class="form-control" placeholder="food Price" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              

             <input style="width: 550px;height: 45px;color: #000000;" type="submit" value="Update" class="btn btn-success"/>
                 <br><br>
             </div>
              
              </form>
              
          </center>
      
      
      
      <center>
          <div style="width: 1460px;background-color: #000000;color: white;margin-top: 5px;">

              <h2>Search</h2>
              <input id="searchBox" onkeyup="searchReq()" name="serchbox" style="text-align: center; width: 450px; " class="form-control" placeholder="Key Word" aria-label="Username" aria-describedby="basic-addon1" type="text"/><br>
              <table id="table" style="width: 1400px; border-color: #ffffff" border="1" id="table" >
                  <thead>
                      <tr>
                          <th style="color: black;">Id</th>
                          <th>Food Image</th>
                          <th>Food Path</th>
                          <th>Food Name</th>
                          <th>Food Price</th>
                          <th>Update</th>
                          <th>Delete</th>
                      </tr>
                  </thead>
                  <tbody>
                   
                  </tbody>
              </table>


  </div></center>
           </div>
              
               
               
               
               
              
           <div id="tabs-3">
  
 

       <center>


        <div style="background-color: #000000; color: #ffffff">
            
            <table id="table2" style="text-align: center">
                
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
                          <h2 id="total2" style="color: #ffffff"></h2>

            
            
        </div>
      </center>
      
      
      
      
      
      
      
  </div>
      <div id="tabs-4">


      <center>


        <div style="background-color: #000000; color: #ffffff">
            
            <table id="table4" style="text-align: center">
                
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
                          <h2 id="total4" style="color: #ffffff"></h2>

            
            
        </div>
      </center>
      
      
      
      
      
      

  </div>
           
            <div id="tabs-5">
                <center>
           <div style="background-color: #000000; color: #ffffff">
            
               <h2 id="cusTotal" style="color: #ffffff;"></h2><br>
            <table id="table5" style="text-align: center;">
                
                <thead>
                <th style="width: 200px">Id</th>
                <th>img</th>
                <th>nic</th>
                <th>Username</th>
                <th>Addres</th>
                <th style="width: 300px">Mobile</th>

       

                </thead>
                <tbody>
                    
                </tbody>
                
            </table>
                          <h2 id="total5" style="color: #ffffff"></h2>

            
            
        </div>
     
                </center>
            </div>

        
        
    </body>
</html>

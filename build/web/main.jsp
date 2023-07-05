<%-- 
    Document   : main
    Created on : Apr 26, 2021, 11:21:53 AM
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

               <% ResultSet rs = DBMS.SE("SELECT * FROM `catogary` WHERE `id_catogary` BETWEEN '10' AND '14';");
                         while (rs.next()) { %>

             var row = `<tr>
                        <td style="color: black; font-size: 25px;">`+<%out.print(rs.getString("id_catogary"));%>+`</td>
                        <td style="width: 300px; height: 310px; background-color:white;">`+`<img font-size: 25px; width="300px" height="300px" src="`+"adminImg/"+"<%out.print(rs.getString("c_img"));%>"+`;"/>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 25px; width: 350px">`+"<%out.print(rs.getString("c_name"));%>"+`</td>
                        <td style="width: 180px; height: 100px;  text-align: center; color: #ffffff; font-size: 25px;">`+"<%out.print(rs.getString("c_price"));%>"+`</td>
                        <td>`+`<button style="width: 150px;" class="btn btn-danger" onclick="min()">MIN</button>`+`</td>
                        <td style="width: 50px; height: 100px;  text-align: center; border: #ffffff;color: #ffffff; font-size: 25px;">`+"0"+`</td>
                        <td>`+`<button style="width: 150px;" onclick="add()" class="btn btn-warning">ADD</button>`+`</td>
                   </tr>`
        table.innerHTML += row;
      <% } %>  
    
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
      
     
      alert(this.responseText);
      
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
      
     
      alert(this.responseText);
      
    }
  };
  xhttp.open("GET", "removeItem?id="+id+"&count="+count+"&price="+price, true);
  xhttp.send();  
           
   
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
                        <td style="color: black; font-size: 25px;">`+item.id+`</td>
                        <td style="width: 300px; height: 310px; background-color:white;">`+`<img font-size: 25px; width="300px" height="300px" src="`+"adminImg/"+item.img+`;"/>`+`</div>`+`</td>
                        <td style="text-align: center;color: #ffffff; font-size: 25px; width: 350px">`+item.name+`</td>
                        <td style="width: 180px; height: 100px;  text-align: center; color: #ffffff; font-size: 25px;">`+item.price+`</td>
                        <td>`+`<button style="width: 150px;" class="btn btn-danger" onclick="min()">MIN</button>`+`</td>
                        <td style="width: 50px; height: 100px;  text-align: center; border: #ffffff;color: #ffffff; font-size: 25px;">`+"0"+`</td>
                        <td>`+`<button style="width: 150px;" onclick="add()" class="btn btn-warning">ADD</button>`+`</td>
                   </tr>`
        table.innerHTML += row;
           
                

  
       }
        
        }
             };
         
            xhttp.open("POST","adminSearch", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("key="+JsonObj);
      }

            
            
            function profile(){  window.location.replace("http://localhost:8080/final_Web/profile.jsp#");   }
              

function cartView(){window.location.replace("http://localhost:8080/final_Web/cart.jsp#");   }  
          

function history(){
              window.location.replace("http://localhost:8080/final_Web/history.jsp#");
            }
          
          
function chekout(){window.location.replace("http://localhost:8080/final_Web/chekout.jsp#"); }
          
          
        </script>
        
    </head>
    <body  onload="m()"; style="background-image: url('img/ba3.png');">
    <center>
        
        
        
        
        <div style="background-color: #000000; width: fit-content; border-radius: 30px; padding: 10px;">
        <h1 style="text-align: center; color: #ffffff;">Yum Bun Yum Main Menu</h1><br/>
                     <input id="searchBox" onkeyup="searchReq()" name="serchbox" style="text-align: center; width: 450px; " class="form-control" placeholder="search keyword" aria-label="Username" aria-describedby="basic-addon1" type="text"/>
<br/><br/>

<table>
    
    <tbody>
        <tr>
        

            <td style="width: 900px;" ><button onclick="chekout()" style=" width: 700px; height: 60px; font-size: 24px; font-family: initial;" class="btn btn-outline-warning">check out</button>
</td>
<td><div style="padding: 10px; background-color: #ffffff;border-radius: 10px;"><img onclick="cartView()" style="width: 60px; height: 60px;" src="appImg/food-serving.png"/>
        </br>
        <h6 style="color: #000000; margin-left: 15px;">Cart</h6>
    </div>
</td>
<td>
    <div style="padding: 10px; background-color: #ffffff; border-radius: 10px;">
        <img onclick="history()" style="width: 60px; height: 60px; " src="appImg/scroll.png"/>
     </br>
        <h6 style="color: #000000; margin-left: 4px;">History</h6>
</div>
</td>

<td>
    
    <div style="padding: 10px; background-color: #ffffff;border-radius: 10px;">
        <img onclick="profile()" style="width: 60px; height: 60px; " src="appImg/man.png"/>
     </br>
        <h6 style="color: #000000; margin-left: 7px;">Profile</h6>
</div>
</td>


        </tr>
    </tbody>
</table>

 




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
                    <th style="text-align: center; color: #000000; width: 30px"></th>

                </tr>
            </thead>
            <tbody>
             
            </tbody>
        
        </table>

               </div>
        
        
        <div style="width: 1000px; background-color: #000000;padding: 10px;">  
            <nav style="margin-left: 335px;" aria-label="...">
  
                <ul class="pagination">
    
                    <li class="page-item ">
      
                        <span class="page-link">Previous</span>
   
                    </li>
 
                    <li class="page-item active"><a class="page-link" href="main.jsp">1</a></li>
  <li class="page-item "><a class="page-link" href="main_2.jsp">2</a></li>
                 
    <li class="page-item">
        <a class="page-link" href="main_2.jsp">Next</a>
    </li>
  </ul>
</nav></div>
      </center> 
    </body>
    
</html>

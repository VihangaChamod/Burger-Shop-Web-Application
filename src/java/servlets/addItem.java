/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import JDBC.DBMS;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "addItem", urlPatterns = {"/addItem"})
public class addItem extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
             HttpSession sea=request.getSession();
             
            
         String id = request.getParameter("id");
         String count = request.getParameter("count");
         String price = request.getParameter("price");
 
         int qi=Integer.parseInt(count);
         int pi=Integer.parseInt(price);
         
        
            try {
          ResultSet rs = DBMS.SE("SELECT * FROM `cart` WHERE `temp_id`='"+sea.getAttribute("temp_id")+"' AND `catogary_id_catogary`='"+id+"'");
           
                if (rs.next()) {                    
                   
                  String s=  rs.getString("qty");
                  int s1=Integer.parseInt(s);
  
                  int rqty=s1+1;
                  
                    DBMS.i("UPDATE `cart` SET `qty`='"+rqty+"' WHERE `id`='"+rs.getString("id")+"'");
                    
                }else{
             
                    try {
             
                 DBMS.i("INSERT INTO `cart` (`temp_id`,`date`,`c_id`,`c_price`,`qty`,`users_id`,`catogary_id_catogary`,`isActive`)VALUES('"+sea.getAttribute("temp_id")+"','"+new Date()+"','"+id+"','"+price+"','"+count+"','"+sea.getAttribute("id")+"','"+id+"','"+1+"')");
            
             } catch (Exception e) {
                System.out.println(e);
            }
                
                }
   
              
     
            } catch (Exception e) {
                System.out.println(e);
            }
  
         
         
 
            
 
         
        
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

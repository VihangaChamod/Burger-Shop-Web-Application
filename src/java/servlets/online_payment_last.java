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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "online_payment_last", urlPatterns = {"/online_payment_last"})
public class online_payment_last extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       
                        HttpSession sea=request.getSession();
      
            String mobile=(String) sea.getAttribute("mo");
            String addres=(String) sea.getAttribute("ad");
            
                        DBMS.i("INSERT INTO `orders` (`status`,`addres`,`mobile`,`payment_methord`,`temp_id`,`users_id`)VALUES('"+"ordered"+"','"+addres+"','"+mobile+"','"+1+"','"+sea.getAttribute("temp_id")+"','"+sea.getAttribute("id")+"')");

                        
                        
             sea.removeAttribute("temp_id");
             sea.removeAttribute("mo");
             sea.removeAttribute("ad");

             String usid=(String) sea.getAttribute("id");
                                   int idset=1;
            
            ResultSet rs= DBMS.SE("SELECT * FROM `idgenarate` WHERE id=(SELECT MAX(id) FROM `idgenarate`)");
            
            try {
                while (rs.next()) {
          
                 idset= rs.getInt("temp_id")+1;
                    
                    DBMS.i("INSERT INTO `idgenarate` (`temp_id`,`users_id`)VALUES('"+idset+"','"+usid+"')");
                   
                    sea.setAttribute("temp_id", idset);
                    
                     out.print("ok");

             
                }   
        }catch(Exception e){
                System.out.println(e);    
        }
                               response.sendRedirect("http://localhost:8080/final_Web/main.jsp#");  


            
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

package servlets;

import JDBC.DBMS;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "history", urlPatterns = {"/history"})
public class history extends HttpServlet {

   String data;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
          HttpSession sea=request.getSession();
         
         
            JsonArray jr=new JsonArray();
            JsonObject jo=null;
       
            
            try {
                   
   
                  ResultSet rs1=DBMS.SE("SELECT * FROM `cart` WHERE `users_id`='"+sea.getAttribute("id")+"'");
                    
                   while (rs1.next()) {
                          jo = new JsonObject();
            
                      jo.addProperty("date", rs1.getString("date"));
                      jo.addProperty("qty", rs1.getString("qty"));

                       
                     ResultSet rs2=DBMS.SE("SELECT * FROM `catogary` WHERE `id_catogary`='"+rs1.getString("c_id")+"'");
                        
                        while (rs2.next()) {                           
                           
                             jo.addProperty("img",rs2.getString("c_img"));
                             jo.addProperty("name",rs2.getString("c_name"));
                             jo.addProperty("price",rs2.getString("c_price"));

                          jr.add(jo);
                       data=jr.toString();
                         
                       
                    
                        
                }
                  
                }
                     
           System.out.println(data);
            out.print(data);   
                           
         
            
            } catch (Exception ex) {
                System.out.println(ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import JDBC.DBMS;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "customers", urlPatterns = {"/customers"})
public class customers extends HttpServlet {

    String data;

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            JsonArray jr=new JsonArray();
            JsonObject jo=null;
          
            ResultSet rs = DBMS.SE("SELECT * FROM `users`");
          
            try {
                while (rs.next()) {
                   jo = new JsonObject();
            
                      jo.addProperty("id", rs.getString("id"));
                      jo.addProperty("img", rs.getString("u_img"));
                      jo.addProperty("nic", rs.getString("u_nic"));
                      jo.addProperty("username", rs.getString("u_username"));
                      jo.addProperty("addres", rs.getString("u_addres"));
                      jo.addProperty("mobile", rs.getString("u_mobile"));
                    
                      jr.add(jo);
                
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
                 data=jr.toString();
     
           System.out.println(data);
            out.print(data);   
                    
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Entity.search;
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

/**
 *
 * @author DELL
 */
@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String data="";
            
            HttpSession sea=request.getSession();

            
            JsonArray jr=new JsonArray();
            JsonObject jo=null;
            
                    String f_id="";
                    String f_img="";
                    String f_name="";
                    String f_price="";
                    String f_qty="";

                   
                   ResultSet rs = DBMS.SE("SELECT * FROM `cart` WHERE `temp_id`='"+sea.getAttribute("temp_id")+"'");
            try {
                while (rs.next()) {
                    
                    jo=new JsonObject();
                    
                    f_id= rs.getString("c_id");
                    f_price= rs.getString("c_price");
                    f_qty= rs.getString("qty");
                    
                    jo.addProperty("id", f_id);
                    jo.addProperty("price", f_price);
                    jo.addProperty("qty", f_qty);

                    ResultSet rs1 = DBMS.SE("SELECT * FROM `catogary` WHERE `id_catogary`='"+rs.getString("c_id")+"'");
                    
                    
                    while (rs1.next()) {
                        
                        f_img=rs1.getString("c_img");
                        f_name=rs1.getString("c_name");
   
                    jo.addProperty("img", f_img);
                    jo.addProperty("name", f_name);

                    
                    int i=Integer.parseInt(f_price);
                    int i2=Integer.parseInt(f_qty);
   
                    int total=i*i2;
                    
                    jo.addProperty("total", total);
                    
                    jr.add(jo);
                    data=jr.toString();
                    
                    }
                    
                }
            } catch (SQLException ex) {
                System.out.println(ex);
            }
            
            out.print(data);
                        System.out.println(data);   
            
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

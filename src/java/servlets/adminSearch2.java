/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Entity.keyword;
import JDBC.DBMS;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "adminSearch2", urlPatterns = {"/adminSearch2"})
public class adminSearch2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             
            String jsonObj = request.getParameter("key");
          
               keyword k= new Gson().fromJson(jsonObj, keyword.class);
            
             
               
            try {
                 JsonArray js= new JsonArray();
                JsonObject jo=null;
                
             ResultSet rs= DBMS.SE("SELECT * FROM `catogary` WHERE `id_catogary` >='15' AND `c_name` LIKE '%"+k.getKeyWord()+"%'");
                
             
             
             while (rs.next()) {     
                 
                jo=new JsonObject();
             
                jo.addProperty("id",rs.getString("id_catogary")); 
                jo.addProperty("img",rs.getString("c_img")); 
                jo.addProperty("name",rs.getString("c_name")); 
                jo.addProperty("price",rs.getString("c_price")); 

                
                 js.add(jo);
                }
            

               

             
             
             String data = js.toString();
             
                if (data.equals("[]")) {
                 
                  JsonArray jsq= new JsonArray();
                JsonObject joq=null;
                joq=new JsonObject();
             
                joq.addProperty("id","no results"); 
                joq.addProperty("img","no.png"); 
                joq.addProperty("name","no results"); 
                joq.addProperty("price","no results");  
                   
                jsq.add(joq);
                String dataq = jsq.toString();
                
                out.print(dataq);
                  
                System.out.println(dataq);

                }else{
                   out.print(data);
                }
             
             
          
                                              


   
            } catch (Exception e) {
                out.print(e);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import JDBC.DBMS;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)

@WebServlet(name = "updateprofile", urlPatterns = {"/updateprofile"})
public class updateprofile extends HttpServlet {

    
    
        private String getFileName(final Part part) {
    
        final String partHeader = part.getHeader("content-disposition");
    
   
        for (String content : part.getHeader("content-disposition").split(";")) {
        
            if (content.trim().startsWith("filename")) {
            
                return content.substring(
                
                        content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
    
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
              HttpSession sea=request.getSession();
           
     
      
           
         String nic=request.getParameter("nic");
         String usname=request.getParameter("uname");
         String password=request.getParameter("pass");
         String addres=request.getParameter("addres");
         String mobile=request.getParameter("mobile");
        
            try {
                
           
         Part filePart = request.getPart("file");
            System.out.println(filePart);
          
          String photo="";
          String path="C:/Users/DELL/Documents/NetBeansProjects/final_Web/build/web/upload/";
          
          File file=new File(path);
          file.mkdir();
          String fileName = getFileName(filePart);
          
          OutputStream out1 = null;
          
            InputStream filecontent = null;
            
            PrintWriter writer = response.getWriter();
            try {
        out1 = new FileOutputStream(new File(path + File.separator
                + fileName));
        
        filecontent = filePart.getInputStream();
     
 
        int read = 0;
        final byte[] bytes = new byte[1024];
 
        while ((read = filecontent.read(bytes)) != -1) {
            out1.write(bytes, 0, read);
           
            photo=path+"/"+fileName;
            
        }
        
      
        } catch (Exception e) {
                
            fileName=sea.getAttribute("img").toString();
            
            }
         
               

                try {
                                 DBMS.i("UPDATE `users` SET `u_img`='"+fileName+"',`u_nic`='"+nic+"',`u_username`='"+usname+"',`u_password`='"+password+"',`u_addres`='"+addres+"',`u_mobile`='"+mobile+"' WHERE `id`='"+sea.getAttribute("id")+"'");
    
                           sea.setAttribute("img", fileName);    
                           sea.setAttribute("nic", nic);
                           sea.setAttribute("username", usname);
                           sea.setAttribute("password", password);
                           sea.setAttribute("addres", addres);
                           sea.setAttribute("mobile", mobile);
 
                         response.sendRedirect("profile.jsp");

                           
                                 
                } catch (Exception e) {
                    System.out.println("Some thing went Worng+"+e);
                }
    
   


    }catch(Exception e){
    out.print(e);}
            
            
            
            
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

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
import javax.servlet.http.Part;


@WebServlet(name = "adminUpdate", urlPatterns = {"/adminUpdate"})

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)

public class adminUpdate extends HttpServlet {

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
           
          String id=request.getParameter("idselect");
          String fname=request.getParameter("fname");
          String fprice=request.getParameter("fprice");
        
                try {  
         Part filePart = request.getPart("file");
            
          
          String photo="";
          String path="C:/Users/DELL/Documents/NetBeansProjects/final_Web/build/web/adminImg/";
          
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
        out.print(id+"  "+fileName+"  "+fname+"  "+fprice);
      
               
      
                    
                } catch (Exception e) {
               
                    fileName =request.getParameter("img");
                    System.out.println(fileName);
                }
        
        

                try {
                    
                    
         DBMS.i("UPDATE `catogary` SET `c_img`='"+fileName+"',`c_name`='"+fname+"',`c_price`='"+fprice+"' WHERE `id_catogary`='"+id+"'");
                       response.sendRedirect("http://localhost:8080/final_Web/admin.jsp#");  

                             
                                 
                } catch (Exception e) {
                    System.out.println("Some thing went Worng+"+e);
                    out.print(e);
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

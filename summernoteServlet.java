package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jirpinya
 */
@WebServlet(name = "summernoteServlet", urlPatterns = {"/summernoteServlet"})
public class summernoteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Connection conn;

    @Override
    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding( "UTF-8" );
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            //รับ ConcertName จากหน้า summernote.html 
            //สร้าง Article_ID โดยแก้ไขจาก Concert_ID
            //เก็บ Article_ID  Date_Time, Article_Name, Content, User_ID, Map ลงTABLE Article
            
            //String User_ID = (String) session.getAttribute("User_ID");
            String Concert_ID = (String) request.getParameter("Concert_ID");
            session.setAttribute("User_ID", request.getParameter("Login_ID"));
            String Content = request.getParameter("summerNoteText");
            String Map = (String) request.getParameter("MAP"); 
            String User_ID = request.getParameter("User_ID");
            
            try{
                Statement stmt = conn.createStatement();

                //Select Concert_ID
                String sql_ = "Select Concert_Name from Concert where Concert_ID = '" + Concert_ID + "'";
                ResultSet rs = stmt.executeQuery(sql_);
                rs.next();
                String ConcertName= rs.getString("Concert_Name");
                
                
                //CREATE Article_ID
                String Article_ID = "AR" + Concert_ID.substring(3);

                //UPDATE Article
                String sql = "Insert into Article values('" + Article_ID + "',NOW(), '" + ConcertName + "', '" + Content + "', '" + User_ID + "', '" + Map + "')";
                stmt.executeUpdate(sql);
                String ChangeS = "UPDATE Concert SET Status = 'PUBLISHED' WHERE Concert_Name ='"+ ConcertName +"';";
                stmt.executeUpdate(ChangeS);

                RequestDispatcher obj = request.getRequestDispatcher("CreateArticle.jsp");
                obj.forward(request, response);
                
            }catch (SQLException ex) {
                
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(summernoteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(summernoteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

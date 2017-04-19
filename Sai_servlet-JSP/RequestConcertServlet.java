/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Article;
import model.Concert;

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


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding( "UTF-8" );
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            
            //String User_ID = (String) session.getAttribute("User_ID");
            String Concert_ID = (String) request.getParameter("Concert_ID");
            String User_ID = "ADM001";
            String Content =  request.getParameter("summerNoteText");
            String Map = (String) request.getParameter("MAP"); 
            
            try {

                //Select Concert_ID
                Concert concert = new Concert();
                String ConcertName= concert.getConcert_Name(Concert_ID);
                
                //CREATE Article_ID
                Article article = new Article();
                String Article_ID = article.getArticle_ID(Concert_ID);

                //UPDATE Article 
                article.insertConcert(ConcertName, Content, User_ID, Map);

                RequestDispatcher obj = request.getRequestDispatcher("summernote.jsp");
                obj.forward(request, response);
                
            } catch (SQLException ex) {
            
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

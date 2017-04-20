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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Concert;

/**
 *
 * @author test
 */
@WebServlet(name = "ConcertRequest", urlPatterns = {"/ConcertRequest"})
public class ConcertRequest extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            ArrayList<String> Concert_Name = new ArrayList<>();
            ArrayList<String> Status = new ArrayList<>();
            ArrayList<Timestamp> Date_Time = new ArrayList<>();
            ArrayList<String> Contact_name = new ArrayList<>();

            Concert concert = new Concert();
            concert.showAllRequest(Concert_Name, Status, Date_Time, Contact_name);

            //------ OnlyStatus > ACCEPTED
            ArrayList<String> Concert_NameAc = new ArrayList<>();
            ArrayList<Timestamp> Date_TimeAc = new ArrayList<>();
            ArrayList<String> Contact_nameAc = new ArrayList<>();
            concert.AcceptedRequest(Concert_NameAc, Date_TimeAc, Contact_nameAc);

            //------ set attribute request
            request.setAttribute("Concert_Name", Concert_Name);
            request.setAttribute("Status", Status);
            request.setAttribute("Contact_name", Contact_name);
            request.setAttribute("Date_Time", Date_Time);

            request.setAttribute("Concert_NameAc", Concert_NameAc);
            request.setAttribute("Contact_nameAc", Contact_nameAc);
            request.setAttribute("Date_TimeAc", Date_TimeAc);

            //----- send to data-concert.jsp
            request.getRequestDispatcher("Allrequest.jsp").forward(request, response);
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
            Logger.getLogger(ConcertRequest.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConcertRequest.class.getName()).log(Level.SEVERE, null, ex);
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

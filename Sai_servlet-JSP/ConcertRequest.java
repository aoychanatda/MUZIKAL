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

/**
 *
 * @author test
 */
@WebServlet(name = "ConcertRequest", urlPatterns = {"/ConcertRequest"})
public class ConcertRequest extends HttpServlet {

    
     private Connection conn;

    @Override
    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
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
            
            Statement stmt = conn.createStatement();
            
            ArrayList<String> Concert_Name = new ArrayList<>();
            ArrayList<String> Status = new ArrayList<>();
            ArrayList<Timestamp> Date_Time = new ArrayList<>();
            ArrayList<String> Contact_name = new ArrayList<>();
            String Concert_table = "SELECT Concert_Name, Status, Date_Time, Fname, Lname "
                    + "FROM Concert JOIN User USING (User_ID) ORDER BY Date_Time DESC;";
            ResultSet rs1 = stmt.executeQuery(Concert_table);
            while(rs1.next()){
                Concert_Name.add(rs1.getString("Concert_Name"));
                Status.add(rs1.getString("Status"));
                Date_Time.add(rs1.getTimestamp("Date_Time"));
                Contact_name.add(rs1.getString("Fname") + " " + rs1.getString("Lname"));
                 
            }

            
            //------ OnlyStatus > ACCEPTED
            ArrayList<String> Concert_NameAc = new ArrayList<>();
            ArrayList<Timestamp> Date_TimeAc = new ArrayList<>();
            ArrayList<String> Contact_nameAc = new ArrayList<>();
            String ConcertAc_table = "SELECT Concert_Name, Date_Time, Fname, Lname "
                    + "FROM Concert JOIN User USING (User_ID) WHERE Status = 'ACCEPTED' ORDER BY Date_Time DESC;";
            ResultSet rs2 = stmt.executeQuery(ConcertAc_table);
            while(rs2.next()){
                Concert_NameAc.add(rs2.getString("Concert_Name"));
                Date_TimeAc.add(rs2.getTimestamp("Date_Time"));
                Contact_nameAc.add(rs2.getString("Fname") + " " + rs2.getString("Lname"));
            }
        
            //------ set attribute request
            request.setAttribute("Concert_Name",Concert_Name);
            request.setAttribute("Status",Status);
            request.setAttribute("Contact_name",Contact_name);
            request.setAttribute("Date_Time",Date_Time);
            
            request.setAttribute("Concert_NameAc",Concert_NameAc);
            request.setAttribute("Contact_nameAc",Contact_nameAc);
            request.setAttribute("Date_TimeAc",Date_TimeAc);
            
            
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

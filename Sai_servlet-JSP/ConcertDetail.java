/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author test
 */
@WebServlet(name = "ConcertDetail", urlPatterns = {"/ConcertDetail"})
public class ConcertDetail extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            Statement stmt = conn.createStatement();
            String ConcertName = request.getParameter("id");
            HttpSession session = request.getSession();
            String Login_ID = (String) session.getAttribute("Login_ID");
            
            String Concert_table = "SELECT Concert_ID, User_ID FROM Concert WHERE Concert_Name = '"+ ConcertName+"';";
            ResultSet rs1 = stmt.executeQuery(Concert_table);
            rs1.next();
            String Concert_ID = rs1.getString("Concert_ID");
            String User_ID = rs1.getString("User_ID");
 
            
            String Org_table = "SELECT User_ID, Company_name, Fname, Lname, Email, con.Phone_number 'Phone_number_ct'"
                    + " FROM User u"
                    + " JOIN Contact_person con"
                    + " USING (User_ID)"
                    + " JOIN Organizer_company org"
                    + " USING (Company_ID)"
                    + " WHERE u.User_ID = '"+User_ID+"';";
            ResultSet rs5= stmt.executeQuery(Org_table);
            rs5.next();
            //--------- Organizer's Detail
            String Company_name = rs5.getString("Company_name");
            String Contact_name = rs5.getString("Fname") + " " + rs5.getString("Lname");
            String Email = rs5.getString("Email");
            String Phone = rs5.getString("Phone_number_ct");
            
            //---------- Concert's Detail
            String ConcertA_table = "SELECT * FROM Concert"
                    + " JOIN Location"
                    + " USING (Location_ID)"
                    + " Where Concert_ID = '"+Concert_ID+"';";
            ResultSet rs2 = stmt.executeQuery(ConcertA_table);
            rs2.next();
            String Concert_Name = rs2.getString("Concert_Name");
            String Status = rs2.getString("Status");
            String Start_Date = rs2.getString("Start_Date");
            String End_Date = rs2.getString("End_Date");
            String Start_Time = rs2.getString("Start_Time");
            String End_Time = rs2.getString("End_Time");
            String Location_Name = rs2.getString("Location_Name");
            String Hall_Name = rs2.getString("Hall_Name");
            String Picture_Cover = rs2.getString("Picture_Cover");
            String Picture_Poster = rs2.getString("Picture_Poster");
            
            //---------- Showtime
            ArrayList<String> Showtime_Date = new ArrayList<>();
            ArrayList<String> Showtime_ID = new ArrayList<>();
            String Showtime_table = "SELECT Showtime_ID, Date FROM Showtime WHERE Concert_ID = '"+Concert_ID+"'";
            ResultSet rs3 = stmt.executeQuery(Showtime_table);
            while(rs3.next()){
                Showtime_Date.add(rs3.getString("Date"));
                Showtime_ID.add(rs3.getString("Showtime_ID"));

            }
            
            
            //---------- Zone
            ArrayList<String> Zone_Name = new ArrayList<>();
            ArrayList<Float> Price = new ArrayList<>();
            String Zone_table = "SELECT Zone_Name, Price FROM `Zone` WHERE Showtime_ID = '"+Showtime_ID.get(0)+"'";
            ResultSet rs4 = stmt.executeQuery(Zone_table);
            while(rs4.next()){
                Zone_Name.add(rs4.getString("Zone_Name"));
                Price.add(rs4.getFloat("Price"));
            }
            
            
            //------ Change Status
            
            String status;
            String SelectBTN = (String) request.getParameter("btn");
            if(SelectBTN != null){
                if (SelectBTN.equals("CANCEL")) {
                    status = "UPDATE Concert\n"
                            + "SET Status = 'CANCELED'\n"
                            + "WHERE Concert_ID = '" + Concert_ID + "' ;";
                    PreparedStatement preparedStmt = conn.prepareStatement(status);
                    preparedStmt.executeUpdate();
                } else if (SelectBTN.equals("ACCEPT")) {
                    status = "UPDATE Concert\n"
                            + "SET Status = 'ACCEPTED'\n"
                            + "WHERE Concert_ID = '" + Concert_ID + "' ;";
                    PreparedStatement preparedStmt = conn.prepareStatement(status);
                    preparedStmt.executeUpdate();
                }
                request.getRequestDispatcher("ConcertRequest  ").forward(request, response);
                return;
           }
            else{
                SelectBTN = Status;
            }
            
            
            //------ set attribute request  
            request.setAttribute("Company_name",Company_name);
            request.setAttribute("Contact_name",Contact_name);
            request.setAttribute("Email",Email);
            request.setAttribute("Phone",Phone);
            request.setAttribute("Concert_Name",Concert_Name);
            request.setAttribute("Status",Status);
            request.setAttribute("Start_Date",Start_Date);
            request.setAttribute("End_Date",End_Date);
            request.setAttribute("Start_Time",Start_Time);
            request.setAttribute("End_Time",End_Time);
            request.setAttribute("Location_Name",Location_Name);
            request.setAttribute("Hall_Name",Hall_Name);
            request.setAttribute("Showtime_Date",Showtime_Date);
            request.setAttribute("Zone_Name",Zone_Name);
            request.setAttribute("Price",Price);
            request.setAttribute("Picture_Cover", Picture_Cover);
            request.setAttribute("Picture_Poster", Picture_Poster);
            
            //----- send to data-concert.jsp
            request.getRequestDispatcher("data-concert.jsp").forward(request, response);
            
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
             Logger.getLogger(ConcertDetail.class.getName()).log(Level.SEVERE, null, ex);
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
             Logger.getLogger(ConcertDetail.class.getName()).log(Level.SEVERE, null, ex);
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

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
import model.Concert;
import model.ContactPerson;
import model.Showtime;
import model.Zone;

/**
 *
 * @author test
 */
@WebServlet(name = "ConcertDetail", urlPatterns = {"/ConcertDetail"})
public class ConcertDetail extends HttpServlet {


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

            String ConcertName = request.getParameter("id");
            HttpSession session = request.getSession();
            String Login_ID = (String) session.getAttribute("Login_ID");

            Concert concert = new Concert();
            String Concert_ID = concert.getConcert_ID(ConcertName);
            String User_ID = concert.getUser_ID(ConcertName);

            //--------- Organizer's Detail
            ContactPerson contact_person = new ContactPerson();
            String Company_name = contact_person.getCompany_name(User_ID);
            String Contact_name = contact_person.getContact_name(User_ID);
            String Email = contact_person.getEmail(User_ID);
            String Phone = contact_person.getPhone(User_ID);

            //---------- Concert's Detail
            String Concert_Name = concert.getConcert_Name(Concert_ID);
            String Status = concert.getStatus(Concert_ID);
            String Start_Date = concert.getStart_Date(Concert_ID);
            String End_Date = concert.getEnd_Date(Concert_ID);
            String Start_Time = concert.getStart_Time(Concert_ID);
            String End_Time = concert.getEnd_Time(Concert_ID);
            String Location_Name = concert.getLocation_Name(Concert_ID);
            String Hall_Name = concert.getHall_Name(Concert_ID);
            String Picture_Cover = concert.getPicture_Cover(Concert_ID);
            String Picture_Poster = concert.getPicture_Poster(Concert_ID);

            //---------- Showtime
            Showtime showtime = new Showtime();
            ArrayList<String> Showtime_Date = showtime.getShowtimeDate(Concert_ID);
            ArrayList<String> Showtime_ID = showtime.getShowtimeID(Concert_ID);

            //---------- Zone
            Zone zone = new Zone();
            ArrayList<String> Zone_Name = zone.getZone_Name(Showtime_ID.get(0));
            ArrayList<Float> Price = zone.get_Price(Showtime_ID.get(0));

            //------ Change Status
            String status;
            String SelectBTN = (String) request.getParameter("btn");
            if (SelectBTN != null) {
                if (SelectBTN.equals("CANCEL")) {
                    concert.updateStatusCANCELED(Concert_ID);
                } else if (SelectBTN.equals("ACCEPT")) {
                    concert.updateStatusACCEPTED(Concert_ID);
                }
                request.getRequestDispatcher("ConcertRequest  ").forward(request, response);
                return;
            } else {
                SelectBTN = Status;
            }

            //------ set attribute request  
            request.setAttribute("Company_name", Company_name);
            request.setAttribute("Contact_name", Contact_name);
            request.setAttribute("Email", Email);
            request.setAttribute("Phone", Phone);
            request.setAttribute("Concert_Name", Concert_Name);
            request.setAttribute("Status", Status);
            request.setAttribute("Start_Date", Start_Date);
            request.setAttribute("End_Date", End_Date);
            request.setAttribute("Start_Time", Start_Time);
            request.setAttribute("End_Time", End_Time);
            request.setAttribute("Location_Name", Location_Name);
            request.setAttribute("Hall_Name", Hall_Name);
            request.setAttribute("Showtime_Date", Showtime_Date);
            request.setAttribute("Zone_Name", Zone_Name);
            request.setAttribute("Price", Price);
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

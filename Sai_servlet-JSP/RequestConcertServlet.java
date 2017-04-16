/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
@WebServlet(name = "RequestConcertServlet", urlPatterns = {"/RequestConcertServlet"})
public class RequestConcertServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //Concert
            String Concert_ID = "CON_";
            String Concert_Name = request.getParameter("concert_name");
            String Status = "Pending";
            String Picture_Cover = "";
            String Picture_Poster = "";
            float Income = 0;
            String Start_Date = request.getParameter("s_date");
            String End_Date = request.getParameter("e_date");
            String Start_Time = request.getParameter("s_time");
            String End_Time = request.getParameter("e_time");

            //Location
            String Location_Name = request.getParameter("location");
            String Hall_Name = request.getParameter("hall");

            //Showtime
            String Date[] = request.getParameterValues("date[]");
            String Time = Start_Time + " - " + End_Time;

            //Zone
            String Price[] = request.getParameterValues("price[]");
            String Zone_Name[] = request.getParameterValues("zoneName[]");
            String Number_of_Seat[] = request.getParameterValues("numOfview[]");

            HttpSession session = request.getSession();
            //String User_ID = (String) session.getAttribute("login_id");
            String User_ID = "000027";
            try {
                Statement stmt = conn.createStatement();

                //---------------------Location Table--------------------//
                /* เช็คว่ายังไม่มีในตารางlocation
                String numThisLo = "Select count(Location_ID) from Location where Location_ID LIKE 'LO%'";
                ResultSet numThisLo1 = stmt.executeQuery(numThisLo);
                numThisLo1.next();
                String numThisLocation = numThisLo1.getString("count(Location_ID)");*/
                //CREATE Location_ID
                
                String numLo = "Select count(Location_ID) from Location where Location_ID LIKE 'LO%'";
                ResultSet numLo1 = stmt.executeQuery(numLo);
                numLo1.next();
                String numLocation = numLo1.getString("count(Location_ID)");
                String Location_ID = "LO_"+ (Location_Name.substring(0, 3)).toUpperCase() + numLocation;

                //UP DATE Location table
                  String sql2 = "Insert into Location values('" + Location_ID + "', '" +Location_Name+ "', '" + 
                      Hall_Name+"')";
                stmt.executeUpdate(sql2);
                 
                //---------------------Concert Table-------------------//
                //CREATE Concert_ID
                /*String numCon = "Select count(Concert_ID) from Concert where Concert_ID LIKE 'CON%'";
                ResultSet numCon1 = stmt.executeQuery(numCon);
                numCon1.next();
                String numConcert = numCon1.getString("count(Concert_ID)");
                Concert_ID = Concert_ID + (Concert_Name.substring(0, 3)).toUpperCase() + numConcert;
                //UP DATE Concert table
                String sql = "Insert into Concert values('" + Concert_ID + "', '" + Concert_Name  +"', '" + Status + "', '"  +Location_ID+ "', '"  +User_ID+ "', '"  +Picture_Cover+ "', '"  +Picture_Poster+ "', '"  +Income+"', '"  +Start_Date+ "', '"  +End_Date+ "', '"  +Start_Time+ "', '"  +End_Time+"')";
                stmt.executeUpdate(sql);
                 */
                //---------------------Showtime Table--------------------//
                //LOOP ShowTime
                
                for (int i = 0; i < Date.length; i++) {
                    //Date date = new SimpleDateFormat("dd-MM-yyyy").parse("10-10-2010");
                    //CREATE Showtime_ID
                    String numSh = "Select count(Showtime_ID) from Showtime where Showtime_ID LIKE 'SH%'";
                    ResultSet numSh1 = stmt.executeQuery(numSh);
                    numSh1.next();
                    String numShowime = numSh1.getString("count(Showtime_ID)");
                    //Showtime_ID = "SH_" + Concert_ID.substring(4) + "_" + numShowime;
                    String Showtime_ID = "SH_";
                    Showtime_ID = Showtime_ID + "" + "_" + numShowime;

                    //UP DATE Showtime_ID
                    String sql3 = "Insert into Showtime values('" + Showtime_ID + "', '" + Date[i] + "', '" + "CON_MID000" + "')";
                    //String sql3 = "Insert into Showtime values('" + Showtime_ID + "',CURTIME(), CURDATE(), '" + "CON_MID000" + "')";
                    stmt.executeUpdate(sql3);

                    //LOOP Zone
                    for (int j = 0; j < Zone_Name.length; j++) {
                        //-----------------------Zone Table----------------------//
                        //CREATE Zone_ID
                        String numZn = "Select count(Zone_ID) from Zone where Zone_ID LIKE 'ZN%'";
                        ResultSet numZn1 = stmt.executeQuery(numZn);
                        numZn1.next();
                        String numZone = numZn1.getString("count(Zone_ID)");

                        String Zone_ID = "ZN_";
                        Zone_ID = Zone_ID + Showtime_ID.substring(3) + (Zone_Name[j].substring(0, 3)).toUpperCase()+numZone;
                        int price = Integer.parseInt(Price[j]);
                        int number_of_Seat = Integer.parseInt(Number_of_Seat[j]);

                        //UP DATE Zone_ID
                        String sql4 = "Insert into Zone values('" + Zone_ID + "', '" + price + "', '" + Zone_Name[j] + "', '" + Showtime_ID + "', '" + number_of_Seat + "')";
                        stmt.executeUpdate(sql4);

                    }

                }
                
                
                RequestDispatcher obj = request.getRequestDispatcher("index.jsp");
                obj.forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
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

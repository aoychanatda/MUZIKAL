/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.PrintWriter;
import model.Concert;
import model.Location;
import model.Showtime;
import model.Zone;

/**
 *
 * @author jirpinya
 */
@WebServlet(name = "RequestConcertServlet", urlPatterns = {"/RequestConcertServlet"})
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
             maxFileSize=1024*1024*10,      // 10MB
             maxRequestSize=1024*1024*50)
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            // ตำแหน่งที่รูปจะเซฟลง
            String savePath = "C:\\Users\\jirpinya\\Documents\\NetBeansProjects\\Project\\Project\\web\\img";
            //Concert
            String Concert_Name = request.getParameter("concert_name");
            String Status = "PENDING";
            String Start_Date = request.getParameter("s_date");
            String End_Date = request.getParameter("e_date");
            String Start_Time = request.getParameter("s_time");
            String End_Time = request.getParameter("e_time");
            Part Picture_Cover = request.getPart("CoverImage");
            Part Picture_Poster = request.getPart("BrowsePoster");

             //Add image to directory       
            File fileSaveDir=new File(savePath);
            if(!fileSaveDir.exists()){
                fileSaveDir.mkdir();
            }
            
            String covername=extractFileName(Picture_Cover);
            Picture_Cover.write(savePath + File.separator + covername);
            covername = "img/" + covername;
            
            String postername=extractFileName(Picture_Poster);
            Picture_Poster.write(savePath + File.separator + postername);
            postername = "img/" + postername;

            //Location
            String Location_Name = request.getParameter("location");
            String Hall_Name = request.getParameter("hall");

            //Showtime
            String Date[] = request.getParameterValues("date[]");
            
            //Zone
            String Price[] = request.getParameterValues("price[]");
            String Zone_Name[] = request.getParameterValues("zoneName[]");
            String Number_of_Seat[] = request.getParameterValues("numOfview[]");

            HttpSession session = request.getSession();
            //String User_ID = (String) session.getAttribute("login_id");
            
            String User_ID = "ORG000";
            try {

                //---------------------Location Table--------------------//
                //CREATE Location_ID
                Location location = new Location();
                String Location_ID = location.getLocation_ID(Location_Name);

                //UP DATE Location table
                location.insertLocation(Location_ID, Location_Name, Hall_Name);

                //---------------------Concert Table-------------------//
                //CREATE Concert_ID
                Concert concert = new Concert();
                String Concert_ID = concert.getConcert_ID(Concert_Name);
                
                //UP DATE Concert table
                concert.insertConcert(Concert_Name, Status, Location_ID, User_ID, covername, postername, Start_Date, End_Date, Start_Time, End_Time);
                
                //---------------------Showtime Table--------------------//
                //LOOP ShowTime
                for (int i = 0; i < Date.length; i++) {
                    //CREATE Showtime_ID
                    Showtime showtime = new Showtime();
                    String Showtime_ID = showtime.getShowtime_ID(Concert_ID);

//                    //UP DATE Showtime_ID
                      showtime.insertShowtime(Showtime_ID, Date[i], Concert_ID);

                    //LOOP Zone
                    for (int j = 0; j < Zone_Name.length; j++) {
                        //-----------------------Zone Table----------------------//
                        //CREATE Zone_ID
                        Zone zone = new Zone();
                        String Zone_ID = zone.getZone_ID(Showtime_ID, Zone_Name[j]);
                        
                        int price = Integer.parseInt(Price[j]);
                        int number_of_Seat = Integer.parseInt(Number_of_Seat[j]);
                        
                        //UP DATE Zone_ID
                        zone.insertZone(Zone_ID, price, Zone_Name[j], Showtime_ID, number_of_Seat);
                    }
                }

                RequestDispatcher obj = request.getRequestDispatcher("index.jsp");
                obj.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(RequestConcertServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private String extractFileName(Part part) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                if (s.trim().startsWith("filename")) {
                    return s.substring(s.indexOf("=") + 2, s.length()-1);
                }
            }
            return "";
        }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.Ticket;
import model.Zone;

/**
 *
 * @author jirpinya
 */
@WebServlet(name = "ReserveServlet", urlPatterns = {"/ReserveServlet"})
public class ReserveServlet extends HttpServlet {

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

            //String Zone_ID = request.getParameter("zone_id");
            //int NumOfTicket = Integer.parseInt(request.getParameter("numTicket"));
            //HttpSession session = request.getSession();
            //String User_ID = (String) session.getAttribute("login_id");
            String User_ID = "MEM001";
            String Zone_ID = "ZN__5AAA0";
            int NumOfTicket = 2;
            String Order_Status = "WAITING"; //PAID or WAITING

            try {
                //Get Zone_name
                Zone zone = new Zone();
                String Zone_Name = zone.getZoneName(Zone_ID);
                
                //Price_of_Ticket จากตาราง Zone
                Float price = zone.getPrice(Zone_ID);
                
                Float Total_Price = price * NumOfTicket;
                
                //------------------------Reservation Table------------------------//
                //Create OrderID
                Order order = new Order();
                String Order_ID = order.getOrder_ID();
                out.println(Order_ID);

                //Insert Order to Table
                order.insertOrder(Order_ID, Order_Status, Total_Price, User_ID);

                //--------------------------Ticket Table--------------------------//
                for (int i = 1; i <= NumOfTicket; i++) {
                    //Create TicketID
                    Ticket ticket = new Ticket();
                    String Ticket_ID = ticket.getTicket_ID(Zone_ID);
                    out.println(Ticket_ID);

                    //Insert Ticket to Table
                    ticket.insertTicket(Ticket_ID, price, Order_ID, Zone_ID);
                }

                HttpSession session = request.getSession();
                session.setAttribute("Order_ID", Order_ID);
                session.setAttribute("Total_Price", Total_Price);
                session.setAttribute("NumOfTicket", NumOfTicket);
                session.setAttribute("User_ID", User_ID);
                session.setAttribute("Zone_Name", Zone_Name);
                session.setAttribute("Price", price);
                
//                    out.println(Order_ID);
//                    out.println(Total_Price);
//                    out.println(NumOfTicket);
//                    out.println(User_ID);
//                    out.println(Zone_Name);
//                    out.println(price);

                RequestDispatcher obj = request.getRequestDispatcher("BuyTicket.jsp");
                obj.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ReserveServlet.class.getName()).log(Level.SEVERE, null, ex);
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

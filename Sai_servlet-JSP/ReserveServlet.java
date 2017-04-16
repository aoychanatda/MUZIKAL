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
    private Connection conn;

    @Override
    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

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
            int NumOfTicket = 1;
            String Order_Status = "WAITING"; //PAID กับ WAITING

            //Count Ticket
            try {
                Statement stmt = conn.createStatement();

                //Price_of_Ticket จากตาราง Ticket
                String sql_ = "Select Price from Zone where Zone_ID = '" + Zone_ID + "'";
                ResultSet rs = stmt.executeQuery(sql_);
                rs.next();
                Float price = rs.getFloat("Price");
                //Float price = Float.parseFloat(priceStr);
                Float Total_Price = price*NumOfTicket;
                
                //-----------Reservation Table------------//
                //Create OrderID
                String numOrd = "Select count(Order_ID) from Reservation where Order_ID LIKE 'RD%'";
                ResultSet numOrd1 = stmt.executeQuery(numOrd);
                numOrd1.next();
                String numOrder = numOrd1.getString("count(Order_ID)");
                String Order_ID = "RD";
                for (int i = numOrder.length(); i < 3; i++) {
                    Order_ID += "0";
                }

                Order_ID += numOrder;
                out.println(Order_ID);
                //UP DATE Reservation Table
                String sql1 = "Insert into Reservation values('" + Order_ID  + "', '" + Order_Status+ "', '" +Total_Price+ "',CURDATE(), '" + User_ID + "', '" +"NO"+ "', '" +0+ "')";
                stmt.executeUpdate(sql1);

                //-----------Ticket Table------------//
                for (int i = 1; i <= NumOfTicket; i++) {
                    //Create TicketID
                    String numTic = "Select count(Ticket_ID) from Ticket where Ticket_ID LIKE 'T%'";
                    ResultSet numTic1 = stmt.executeQuery(numTic);
                    numTic1.next();
                    String numTicket = numTic1.getString("count(Ticket_ID)");
                    String Ticket_ID = "T" + numTicket + "" + (Zone_ID.substring(3));

                    
                    //UP DATE TICKET
                    String sql = "Insert into Ticket values('" + Ticket_ID + "', '" + price + "', '" + Order_ID + "', '" + Zone_ID + "')";
                    stmt.executeUpdate(sql);

                    HttpSession session = request.getSession();
                    session.setAttribute("Order_ID", Order_ID);
                    session.setAttribute("NumOfTicket", NumOfTicket);
                    session.setAttribute("User_ID", User_ID);
                }
                
                RequestDispatcher obj = request.getRequestDispatcher("BuyTicket.jsp");
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

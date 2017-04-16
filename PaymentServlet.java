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
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

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

            HttpSession session = request.getSession();

            String Order_ID = (String) session.getAttribute("Order_ID");
            String User_ID = (String) session.getAttribute("User_ID");
            int NumOfTicket = (int) session.getAttribute("NumOfTicket");
            //String Order_ID = "RD005";
            //String User_ID = "MEM001";
                        
            String SelectBTN = (String) request.getParameter("btn");
            String Payment_method = (String) request.getParameter("method");  //Credit Card,M Cash, Payment
            String Tickets_refund = (String) request.getParameter("refund");

            try {
                Statement stmt = conn.createStatement();
                float Service_charge = 0;

                //---------------CANCLE---------------//
                if (SelectBTN.equals("Cancel")) {
                    out.println("cancle");
                    //DELETE Ticket
                    String sqlc = "Delete From Ticket Where Order_ID = '" + Order_ID + "'";
                    stmt.executeUpdate(sqlc);

                    //DELETE Reservation
                    String sql1 = "Delete From Reservation Where Order_ID = '" + Order_ID + "'";
                    stmt.executeUpdate(sql1);

                    RequestDispatcher obj = request.getRequestDispatcher("PurchaseOrder.html");
                    obj.forward(request, response);
                }

                //---------------CONFIRM--------------//

                //Balance จากตาราง Member
                String sql_ = "Select Balance from Member where User_ID = '" + User_ID + "'";
                ResultSet rs = stmt.executeQuery(sql_);
                rs.next();
                float price = rs.getFloat("Balance");

                //Total_Price จาก Reservation
                String sql = "Select Total_Price from Reservation where Order_ID = '" + Order_ID + "'";
                ResultSet rs1 = stmt.executeQuery(sql);
                rs1.next();
                float Total_Price = rs1.getFloat("Total_Price");

                if (SelectBTN.equals("Confirm")) {

                    if (Payment_method.equals("credit")) {
                        Service_charge = (float) 49.69;
                    } else if (Payment_method.equals("bill")) {
                        Service_charge = (float) 62.61;
                    } else if (Payment_method.equals("mcash")) {
                        Service_charge = (float) 0;
                    }

                    //TICKET REFUND
                    if (Tickets_refund.equals("YES")) {
                        String sql5 = "Update Reservation SET getRefund = '" + "YES" + "' WHERE Order_ID = '" + Order_ID + "'";
                        stmt.executeUpdate(sql5);

                        Service_charge += (float) 100*NumOfTicket;
                    }

                    //UPDATE Service_charge
                    Service_charge = ((Total_Price + Service_charge) * (7 / 100)) + Service_charge;
                    String sql4 = "Update Reservation SET Service_charge = '" + Service_charge + "' WHERE Order_ID = '" + Order_ID + "'";
                    stmt.executeUpdate(sql4);

                    if (Payment_method.equals("mcash")) {
                        //UPDATE Balance
                        float Balance = price - (Total_Price + Service_charge);
                        String sql2 = "Update Member SET Balance = '" + Balance + "' WHERE User_ID = '" + User_ID + "'";
                        stmt.executeUpdate(sql2);
                    }

                    //++++++++ Payment Table ++++++++//
                    //Create Payment_ID
                    String numPay = "Select count(Payment_ID) from Payment where Payment_ID LIKE 'PAY%'";
                    ResultSet numPay1 = stmt.executeQuery(numPay);
                    numPay1.next();
                    String numPayment = numPay1.getString("count(Payment_ID)");
                    String Payment_ID = "PAY";
                    for (int i = numPayment.length(); i < 4; i++) {
                        Payment_ID += "0";
                    }
                    Payment_ID += numPayment;
                    //UPDATE Payment
                    String sqlp = "Insert into Payment values('" + Order_ID + "', '" + Payment_ID + "', '" + Payment_method + "')";
                    stmt.executeUpdate(sqlp);

                    RequestDispatcher obj = request.getRequestDispatcher("Artical.html");
                    obj.forward(request, response);
                }
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

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
import model.Member;
import model.Order;
import model.Payment;

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
                
                float Service_charge = 0;
                Order order = new Order();

                //-------------------------CANCLE-------------------------//
                if (SelectBTN.equals("Cancel")) {
                    //DELETE Reservation
                    order.deleteOrder(Order_ID);

                    RequestDispatcher obj = request.getRequestDispatcher("PurchaseOrder.html");
                    obj.forward(request, response);
                }

                //------------------------CONFIRM-------------------------//
                //Get Balance from MemberTable
                Member member = new Member();
                float balanceBefore = member.getBalance(User_ID);

                //Get Total_Price จาก Reservation
                float Total_Price = order.getTotalPrice(Order_ID);

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
                        order.setUseTicketRefund(Order_ID);
                        Service_charge += (float) 100 * NumOfTicket;
                    }

                    //UPDATE Service_charge
                    Service_charge = ((Total_Price + Service_charge) * (7 / 100)) + Service_charge;
                    order.setServiceCharge(Service_charge, Order_ID);

                    if (Payment_method.equals("mcash")) {
                        //UPDATE Balance
                        float Balance = balanceBefore - (Total_Price + Service_charge);
                        member.UpdateBalance(Balance, User_ID);

                        //UPDATE Status
                        order.UpdateStatusPAID(Order_ID);
                    }

                    //++++++++ Payment Table ++++++++//
                    //Create Payment_ID
                    Payment payment = new Payment();
                    String Payment_ID = payment.getPayment_ID();

                    //UPDATE Payment
                    payment.insertPayment(Order_ID, Payment_ID, Payment_method);

                    RequestDispatcher obj = request.getRequestDispatcher("index.jsp");
                    obj.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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

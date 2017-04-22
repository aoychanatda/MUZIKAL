/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ContactPerson;
import model.Member;
import model.User;
import javax.servlet.http.Part;
import java.io.File;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "SaveProfileServlet", urlPatterns = {"/SaveProfileServlet"})
public class SaveProfileServlet extends HttpServlet {

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
            try {

               String savePath = "C:\\Users\\lenovo\\Desktop\\Projecttest\\web\\img";
                String strButton = request.getParameter("save");

                String strFName = request.getParameter("Fname");
                String strLName = request.getParameter("Lname");
                String strEmail = request.getParameter("Email");
                String strPhoneNum = request.getParameter("Phone_Number");
                String strPhonenum = request.getParameter("Phone_number");
                String strBDate = request.getParameter("Birth_Date");
                String strAddress = request.getParameter("Address");
                String strIDcard = request.getParameter("IDcard");
                String strGen = request.getParameter("Gender");
                String strProfileimg = request.getParameter("Profile_img");
                 HttpSession session = request.getSession(true);
                 String LoginID = (String) session.getAttribute("Login_ID");
                
                Part UserPic = request.getPart("upload");
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                String profilepic = extractFileName(UserPic);
                UserPic.write(savePath + File.separator + profilepic);
                profilepic = "img/" + profilepic;

                 User user = new User();
                 user.UpdateUser(strFName, strLName, strEmail, LoginID, strProfileimg);

                if (strButton.equals("Member")) {
                    Member member = new Member();
                    member.UpdateMember(strPhonenum, strGen, strAddress, strIDcard, strBDate, LoginID);
                    response.sendRedirect("ProfileMember.jsp");
                }
                else if(strButton.equals("Admin")){
                    response.sendRedirect("ProfileAdmin.jsp");
                }
                else if(strButton.equals("Organize")){
                    ContactPerson contract_person = new ContactPerson();
                    contract_person .UpdateContactPerson(strPhonenum, LoginID);
                    response.sendRedirect("ProfileOrganize.jsp");
                }

            } catch (Exception e) {
                out.println(e.getMessage());
                e.printStackTrace();
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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(SaveProfileServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SaveProfileServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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

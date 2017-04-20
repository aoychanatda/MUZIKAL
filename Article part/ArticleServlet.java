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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
 * @author admin
 */
@WebServlet(name = "ArticleServlet", urlPatterns = {"/ArticleServlet"})
public class ArticleServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            Statement stmt = conn.createStatement();
            String id = request.getParameter("id");
//            out.println(id);
//            id = "CON_MID000";
            request.setAttribute("conID", id);
            String[] conDate = new String[50];
            String[][] conZone = new String[50][50];
            int[][] conPrice = new int[50][50];
            int[][] conSeat = new int[50][50];
            int i = -1, j = 0;
            String comp = "";

//            response.sendRedirect("Article.jsp");
            String sql = "SELECT Picture_Cover, Article_Name, Location_Name, Start_Date, End_Date, Start_Time, End_Time, Content, Map FROM Article, Concert, Location WHERE (Concert_ID = '" + id + "') AND (Concert_Name = Article_Name) AND (Concert.Location_ID = Location.Location_ID);";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            request.setAttribute("conPic", rs.getString("Picture_Cover"));
            request.setAttribute("conName", rs.getString("Article_Name"));
            request.setAttribute("conLoc", rs.getString("Location_Name"));
            request.setAttribute("conSDate", rs.getString("Start_Date"));
            request.setAttribute("conEDate", rs.getString("End_Date"));
            request.setAttribute("conSTime", rs.getString("Start_Time"));
            request.setAttribute("conETime", rs.getString("End_Time"));
            request.setAttribute("conTent", rs.getString("Content"));
            request.setAttribute("conMap", rs.getString("Map"));

            out.println(rs.getString("Picture_Cover"));
            out.println(rs.getString("Article_Name"));
            out.println(rs.getString("Start_Date"));
            out.println(rs.getString("End_Date"));
            out.println(rs.getString("Start_Time"));
            out.println(rs.getString("End_Time") + "<br>");
            out.println(rs.getString("conTent") + "<br>");
            String sql2 = "SELECT c.Concert_ID, c.Concert_Name, s.Date, z.Zone_ID, Zone_Name, z.Price , z.Number_of_Seat, count(t.Ticket_ID) 'Booked',z.Number_of_Seat-count(t.Ticket_ID) 'Remain' \n"
                    + "FROM Concert c\n"
                    + "JOIN Showtime s\n"
                    + "ON s.Concert_ID= c.Concert_ID\n"
                    + "JOIN Zone z\n"
                    + "ON z.Showtime_ID = s.Showtime_ID\n"
                    + "LEFT OUTER JOIN Ticket t\n"
                    + "ON z.Zone_ID = t.Zone_ID\n"
                    + "WHERE c.Concert_ID = '" + id + "'\n"
                    + "GROUP BY z.Zone_ID ";
            ResultSet rs2 = stmt.executeQuery(sql2);
            while (rs2.next()) {
                if (!comp.equals(rs2.getString("Date"))) {
                    i++;
                    conDate[i] = rs2.getString("Date");
                    comp = rs2.getString("Date");
                    j = 0;
                }
                conZone[i][j] = rs2.getString("Zone_Name");
                conPrice[i][j] = rs2.getInt("Price");
                conSeat[i][j] = rs2.getInt("Remain");

                j++;

            }
            
            //** ปริ้นดูค่าได้ แค่เอา comment ออก
//            for (i = 0; i < conDate.length; i++) {
//                if(conDate[i].isEmpty()){
//                    break;
//                }
//                out.println("Showtime " + conDate[i] + "<br>");
//                out.println("Zone : ");
//                for (j = 0; j < conZone.length; j++) {
//                    if (conZone[i][j] == null){}
//                    else
//                    out.println(conZone[i][j] + " |");
//
//                }
//                out.println("<br>");
//                out.println("Price : ");
//                for (j = 0; j < conPrice.length; j++) {
//                    if (conPrice[i][j] == 0){}
//                    else
//                    out.println(conPrice[i][j] + " |");
//
//                }
//                out.println("<br>");
//                out.println("Number of seat : ");
//                for (j = 0; j < conSeat.length; j++) {
//                    if (conSeat[i][j] == 0){}
//                    else
//                    out.println(conSeat[i][j] + " |");
//
//                }
//                out.println("<br>");
//                out.println("-----------------"+ "<br>");
//                        
//            }


              // ตรงนี้ยังไม่เสร็จ ยากเกิ้นนนนนนนนนนนนนนนนนน
//            ArrayList abc = new ArrayList(Arrays.asList(conDate));
//            ArrayList def = new ArrayList(Arrays.asList(conZone));

//            for (i = 0; i < abc.size(); i++) {
//                if (abc.get(i) == null) {
//                    abc.remove(i);
//                } else {
//                    out.println(abc.get(i) + "<br>");
//                }
//
//            }
//            for (i = 0; i < def.size(); i++) {
//                for (String[] val : def.get(i)) {
//                    out.println(val + "<br>");
//                }
//            }
            request.setAttribute("conDate", conDate);
            request.setAttribute("conZone", conZone);
            request.setAttribute("conPrice", conPrice);
            request.setAttribute("conSeat", conSeat);
            
            //*** ตรงนี้ไว้ส่ง Dispatcher **///
//            request.getRequestDispatcher("Article.jsp?show='"+conDate+"'").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ArticleServlet.class.getName()).log(Level.SEVERE, null, ex);
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

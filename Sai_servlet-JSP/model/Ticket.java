/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.*;

/**
 *
 * @author jirpinya
 */
public class Ticket {

    Connection con;

    public Ticket() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Ticket_ID;

    public void createTicket_ID(String Zone_ID) {
        try {
            Statement stmt = con.createStatement();
            String numTic = "Select count(Ticket_ID) from Ticket where Ticket_ID LIKE 'T%'";
            ResultSet numTic1 = stmt.executeQuery(numTic);
            numTic1.next();
            String numTicket = numTic1.getString("count(Ticket_ID)");
            Ticket_ID = "T" + numTicket + "" + (Zone_ID.substring(3));

        } catch (SQLException ex) {
        }
    }

    public String getTicket_ID(String Zone_ID){
        createTicket_ID(Zone_ID);
        return Ticket_ID;
    }
    
    public void insertTicket(String Ticket_ID, float price, String Order_ID, String Zone_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Insert into Ticket values('" + Ticket_ID + "', '" + price + "', '" + Order_ID + "', '" + Zone_ID + "')";
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
        }

    }
}

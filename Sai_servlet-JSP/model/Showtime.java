/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author jirpinya
 */
public class Showtime {

    Connection con;

    public Showtime() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Showtime_ID;
    private String numShowime;
    private ArrayList<String> ShowtimeDate = new ArrayList<>();
    private ArrayList<String> ShowtimeID = new ArrayList<>();

    public void createShowtime_ID(String Concert_ID) {
        Showtime_ID = "SH_" + Concert_ID.substring(4) + "_" + numShowime;
    }

    public String numShowtime() {
        try {
            Statement stmt = con.createStatement();
            String numSh = "Select count(Showtime_ID) from Showtime where Showtime_ID LIKE 'SH%'";
            ResultSet numSh1 = stmt.executeQuery(numSh);
            numSh1.next();
            numShowime = numSh1.getString("count(Showtime_ID)");
            return numShowime;
        } catch (SQLException ex) {
        }
        return null;
    }

    public String getShowtime_ID(String Concert_ID) {
        numShowtime();
        createShowtime_ID(Concert_ID);
        return Showtime_ID;
    }

    public void insertShowtime(String Showtime_ID, String Date, String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql3 = "Insert into Showtime values('" + Showtime_ID + "', '" + Date + "', '" + Concert_ID + "')";
            stmt.executeUpdate(sql3);
        } catch (SQLException ex) {
        }
    }

    public void showtimeDetail(String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String Showtime_table = "SELECT Showtime_ID, Date FROM Showtime WHERE Concert_ID = '" + Concert_ID + "'";
            ResultSet rs3 = stmt.executeQuery(Showtime_table);
            while (rs3.next()) {
                ShowtimeDate.add(rs3.getString("Date"));
                ShowtimeID.add(rs3.getString("Showtime_ID"));
            }
        } catch (SQLException ex) {
        }
    }

    public ArrayList<String> getShowtimeDate(String Concert_ID) {
        showtimeDetail(Concert_ID);
        return ShowtimeDate;
    }

    public ArrayList<String> getShowtimeID(String Concert_ID) {
        showtimeDetail(Concert_ID);
        return ShowtimeID;
    }

}

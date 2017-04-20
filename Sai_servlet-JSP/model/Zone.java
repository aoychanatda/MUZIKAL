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
public class Zone {

    Connection con;

    public Zone() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Zone_ID;
    private String Zone_Name;
    private String numZone;
    private float price;
    private ArrayList<String> ZoneName ;
    private ArrayList<Float> Price;

    public void createZone_ID(String Showtime_ID, String Zone_Name) {
        Zone_ID = "ZN_" + Showtime_ID.substring(3) + (Zone_Name.substring(0, 3)).toUpperCase() + numZone;
    }

    public String numZone() {
        try {
            Statement stmt = con.createStatement();
            String numZn = "Select count(Zone_ID) from Zone where Zone_ID LIKE 'ZN%'";
            ResultSet numZn1 = stmt.executeQuery(numZn);
            numZn1.next();
            numZone = numZn1.getString("count(Zone_ID)");
            return numZone;
        } catch (SQLException ex) {
        }
        return null;
    }

    public String getZone_ID(String Showtime_ID, String Zone_Name) {
        numZone();
        createZone_ID(Showtime_ID, Zone_Name);
        return Zone_ID;
    }

    public String getZoneName(String Zone_ID) {
        try {
            Statement stmt = con.createStatement();
            String sqlz = "Select Zone_Name from Zone where Zone_ID = '" + Zone_ID + "'";
            ResultSet zName = stmt.executeQuery(sqlz);
            zName.next();
            Zone_Name = zName.getString("Zone_Name");
            return Zone_Name;
        } catch (SQLException ex) {
        }
        return null;
    }

    public float getPrice(String Zone_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql_ = "Select Price from Zone where Zone_ID = '" + Zone_ID + "'";
            ResultSet rs = stmt.executeQuery(sql_);
            rs.next();
            price = rs.getFloat("Price");
            return price;
        } catch (SQLException ex) {
        }
        return 0;
    }

    public void insertZone(String Zone_ID, float price, String Zone_Name, String Showtime_ID, int number_of_Seat) {
        try {
            Statement stmt = con.createStatement();
            String sql4 = "Insert into Zone values('" + Zone_ID + "', '" + price + "', '" + Zone_Name + "', '" + Showtime_ID + "', '" + number_of_Seat + "')";
            stmt.executeUpdate(sql4);
        } catch (SQLException ex) {
        }
    }
    
    
    public void zoneDetail(String Showtime_ID) {
        try {
            Statement stmt = con.createStatement();
            String Zone_table = "SELECT Zone_Name, Price FROM `Zone` WHERE Showtime_ID = '" + Showtime_ID + "'";
            ResultSet rs4 = stmt.executeQuery(Zone_table);
            while (rs4.next()) {
                ZoneName.add(rs4.getString("Zone_Name"));
                Price.add(rs4.getFloat("Price"));
            }
        } catch (SQLException ex) {
        }
    }

    public ArrayList<String> getZone_Name(String Showtime_ID) {
        zoneDetail(Showtime_ID);
        return ZoneName;
    }

    public ArrayList<Float> get_Price(String Showtime_ID) {
        zoneDetail(Showtime_ID);
        return Price;
    }
}

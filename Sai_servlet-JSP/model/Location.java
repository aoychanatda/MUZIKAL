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

/**
 *
 * @author jirpinya
 */
public class Location {

    Connection con;

    public Location() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Location_ID;
    private String numLocation;

    public void createLocation_ID(String Location_Name) {
        Location_ID = "LO_" + (Location_Name.substring(0, 3)).toUpperCase() + numLocation;
    }

    public String numLocation() {
        try {
            Statement stmt = con.createStatement();
            String numLo = "Select count(Location_ID) from Location where Location_ID LIKE 'LO%'";
            ResultSet numLo1 = stmt.executeQuery(numLo);
            numLo1.next();
            numLocation = numLo1.getString("count(Location_ID)");
            return numLocation;
        } catch (SQLException ex) {
        }
        return null;
    }

    public String getLocation_ID(String Location_Name) {
        numLocation();
        createLocation_ID(Location_Name);
        return Location_ID;
    }

    public void insertLocation(String Location_ID, String Location_Name, String Hall_Name) {
        try {
            Statement stmt = con.createStatement();
            String sql2 = "Insert into Location values('" + Location_ID + "', '" + Location_Name + "', '"+ Hall_Name + "')";
            stmt.executeUpdate(sql2);
        } catch (SQLException ex) {
        }
    }
}

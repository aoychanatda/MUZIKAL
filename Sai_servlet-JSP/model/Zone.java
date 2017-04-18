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
    private float price;

    public String getZoneName(String Zone_ID) {
        try {
            Statement stmt = con.createStatement();
            String sqlz = "Select Zone_Name from Zone where Zone_ID = '" + Zone_ID + "'";
            ResultSet zName = stmt.executeQuery(sqlz);
            zName.next();
            Zone_Name = zName.getString("Zone_Name");
            return Zone_Name;
        } catch (SQLException ex) {}
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
        } catch (SQLException ex) {}
        return 0;
    }
}

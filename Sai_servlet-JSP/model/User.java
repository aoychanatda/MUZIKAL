/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jirpinya
 */
public class User {

    Connection con;

    public User() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String User_ID;

    public void UpdateUser(String strFName, String strLName, String strEmail, String LoginID) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Update User set Fname='" + strFName + "', Lname='" + strLName + "', Email='" + strEmail + "' where User_ID='" + LoginID + "';";
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
        }
    }

    public void insertUser(String Login_ID1, String fname, String email, String lname) {
        try {
            Statement stmt = con.createStatement();
            String sql2 = "Insert into User values('" + Login_ID1 + "', '"+ fname + "', '" + email + "', '" + lname + "')";
            stmt.executeUpdate(sql2);
        } catch (SQLException ex) {
        }
    }
}

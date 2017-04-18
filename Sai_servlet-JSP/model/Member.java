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
public class Member {

    Connection con;

    public Member() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String User_ID;

    public float getBalance(String User_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql_ = "Select Balance from Member where User_ID = '" + User_ID + "'";
            ResultSet rs = stmt.executeQuery(sql_);
            rs.next();
            float balance = rs.getFloat("Balance");
            return balance;
        } catch (SQLException ex) {
        }
        return 0;
    }

    public void UpdateBalance(float Balance, String User_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql2 = "Update Member SET Balance = '" + Balance + "' WHERE User_ID = '" + User_ID + "'";
            stmt.executeUpdate(sql2);

        } catch (SQLException ex) {
        }
    }
}

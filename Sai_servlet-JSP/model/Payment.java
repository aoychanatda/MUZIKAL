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
public class Payment {

    Connection con;

    public Payment() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Payment_ID;

    public void createPayment_ID() {
        try {
            Statement stmt = con.createStatement();
            String numPay = "Select count(Payment_ID) from Payment where Payment_ID LIKE 'PAY%'";
            ResultSet numPay1 = stmt.executeQuery(numPay);
            numPay1.next();
            String numPayment = numPay1.getString("count(Payment_ID)");
            Payment_ID = "PAY";
            for (int i = numPayment.length(); i < 4; i++) {
                Payment_ID += "0";
            }
            Payment_ID += numPayment;

        } catch (SQLException ex) {
        }
    }

    public String getPayment_ID() {
        createPayment_ID();
        return Payment_ID;
    }

    public void insertPayment(String Order_ID, String Payment_ID, String Payment_method) {
        try {
            Statement stmt = con.createStatement();
            String sqlp = "Insert into Payment values('" + Order_ID + "', '" + Payment_ID + "', '" + Payment_method + "')";
            stmt.executeUpdate(sqlp);
        } catch (SQLException ex) {
        }
    }

}

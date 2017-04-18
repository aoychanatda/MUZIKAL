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
public class Order {

    Connection con;

    public Order() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Order_ID;

    public void createOrder_ID() {
        try {
            Statement stmt = con.createStatement();
            String numOrd = "Select count(Order_ID) from Reservation where Order_ID LIKE 'RD%'";
            ResultSet numOrd1 = stmt.executeQuery(numOrd);
            numOrd1.next();
            String numOrder = numOrd1.getString("count(Order_ID)");
            Order_ID = "RD";
            for (int i = numOrder.length(); i < 3; i++) {
                Order_ID += "0";
            }
            Order_ID += numOrder;

        } catch (SQLException ex) {
        }
    }

    public String getOrder_ID() {
        createOrder_ID();
        return Order_ID;
    }

    public float getTotalPrice(String Order_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Select Total_Price from Reservation where Order_ID = '" + Order_ID + "'";
            ResultSet rs1 = stmt.executeQuery(sql);
            rs1.next();
            float Total_Price = rs1.getFloat("Total_Price");
            return Total_Price;
        } catch (SQLException ex) {
        }
        return 0;
    }

    public void insertOrder(String Order_ID, String Order_Status, float Total_Price, String User_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql1 = "Insert into Reservation values('" + Order_ID + "', '" + Order_Status + "', '" + Total_Price + "',CURDATE(), '" + User_ID + "', '" + "NO" + "', '" + 0 + "')";
            stmt.executeUpdate(sql1);

        } catch (SQLException ex) {
        }
    }

    public void deleteOrder(String Order_ID) {
        try {
            Statement stmt = con.createStatement();
            //DELETE Ticket
            String sqlc = "Delete From Ticket Where Order_ID = '" + Order_ID + "'";
            stmt.executeUpdate(sqlc);

            //DELETE Reservation
            String sql1 = "Delete From Reservation Where Order_ID = '" + Order_ID + "'";
            stmt.executeUpdate(sql1);

        } catch (SQLException ex) {
        }
    }

    public void setServiceCharge(float Service_charge, String Order_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql4 = "Update Reservation SET Service_charge = '" + Service_charge + "' WHERE Order_ID = '" + Order_ID + "'";
            stmt.executeUpdate(sql4);

        } catch (SQLException ex) {
        }
    }

    public void setUseTicketRefund(String Order_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql5 = "Update Reservation SET getRefund = '" + "YES" + "' WHERE Order_ID = '" + Order_ID + "'";
            stmt.executeUpdate(sql5);

        } catch (SQLException ex) {
        }
    }

    public void UpdateStatusPAID(String Order_ID) {
        try {
            Statement stmt = con.createStatement();
            String sqls = "Update Reservation SET Order_Status = '" + "PAID" + "' WHERE Order_ID = '" + Order_ID + "'";
            stmt.executeUpdate(sqls);

        } catch (SQLException ex) {
        }
    }
}

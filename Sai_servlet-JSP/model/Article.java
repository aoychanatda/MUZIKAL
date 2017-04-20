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
public class Article {

    Connection con;

    public Article() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Article_ID;

    public String getArticle_ID(String Concert_ID) {
        Article_ID = "AR" + Concert_ID.substring(3);
        return Article_ID;
    }

    public void insertConcert(String ConcertName, String Content, String User_ID, String Map) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Insert into Article values('" + Article_ID + "',NOW(), '" + ConcertName + "', '" + Content + "', '" + User_ID + "', '" + Map + "')";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
        }
    }

    public void UpdateStatusPUBLISHED(String ConcertName) {
        try {
            Statement stmt = con.createStatement();
            String ChangeS = "UPDATE Concert SET Status = 'PUBLISHED' WHERE Concert_Name ='" + ConcertName + "';";
            stmt.executeUpdate(ChangeS);

        } catch (SQLException ex) {
        }
    }

    public void UpdateDateTime(String Article_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql = "UPDATE Article SET Date_Time=NOW() WHERE Article_ID='" + Article_ID + "';";
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
        }
    }
        
                

    public void UpdateContent(String Article_ID, String Content) {
        try {
            Statement stmt = con.createStatement();
            String sql = "UPDATE Article SET Content='" + Content + "'WHERE Article_ID='" + Article_ID + "';";
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
        }
    }

}

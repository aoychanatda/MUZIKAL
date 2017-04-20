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
public class Account {

    Connection con;

    public Account() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String Login_ID = "MEM";
    ;
    private String Username;
    private String Password;
    private String numAccountMem;
    private String numAccountOrg;

    public void getAccount(String usernameIn) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Select Login_ID, Username, Password from Account where Username = '" + usernameIn + "' ";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            Login_ID = rs.getString("Login_ID");
            Username = rs.getString("Username");
            Password = rs.getString("Password");

        } catch (SQLException ex) {
        }
    }

    public String numAccountMem() {
        try {
            Statement stmt = con.createStatement();
            String num = "Select count(Login_ID) from Account where Login_ID Like'MEM%'";
            ResultSet num1 = stmt.executeQuery(num);
            num1.next();
            numAccountMem = num1.getString("count(Login_ID)");
            return numAccountMem;
        } catch (SQLException ex) {
        }
        return null;
    }
    
    public String numAccountOrg() {
        try {
            Statement stmt = con.createStatement();
            String num = "Select count(Login_ID) from Account where Login_ID Like'ORG%'";
            ResultSet num1 = stmt.executeQuery(num);
            num1.next();
            numAccountOrg = num1.getString("count(Login_ID)");
            return numAccountOrg;
        } catch (SQLException ex) {
        }
        return null;
    }

    public void insertAccount(String Login_ID, String password, String username) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Insert into Account values('" + Login_ID + "', '" + password + "', '" + username + "', '" + Login_ID + "')";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
        }
    }

    public String createMemLogin_ID() {
        numAccountMem();
        for (int i = numAccountMem.length(); i < 3; i++) {
            Login_ID += "0";
        }
        Login_ID += numAccountMem;
        return Login_ID;
    }

    public String createOrgLogin_ID() {
        numAccountOrg();
        for (int i = numAccountOrg.length(); i < 3; i++) {
            Login_ID += "0";
        }
        Login_ID += numAccountOrg;
        return Login_ID;
    }

    public String getLogin_ID(String usernameIn) {
        getAccount(usernameIn);
        return Login_ID;
    }

    public String getUsername(String usernameIn) {
        getAccount(usernameIn);
        return Username;
    }

    public String getPassword(String usernameIn) {
        getAccount(usernameIn);
        return Password;
    }

}

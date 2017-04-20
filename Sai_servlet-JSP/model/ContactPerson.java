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
public class ContactPerson {

    Connection con;

    public ContactPerson() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }

    private String Company_name;
    private String Contact_name;
    private String Email;
    private String Phone;

    public void UpdateContactPerson(String strPhonenum, String LoginID) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Update Contact_person set Phone_number='" + strPhonenum + "' where User_ID='" + LoginID + "';";
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
        }
    }

    public void insertContactPerson(String Login_ID, String comPhone, String com_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql3 = "Insert into Contact_person values('" + Login_ID + "', '" + comPhone + "', '" + com_ID + "')";
            stmt.executeUpdate(sql3);
        } catch (SQLException ex) {
        }
    }

    public void ContactPersonDetail(String User_ID) {
        try {
            Statement stmt = con.createStatement();
            String Org_table = "SELECT User_ID, Company_name, Fname, Lname, Email, con.Phone_number 'Phone_number_ct'"
                    + " FROM User u"
                    + " JOIN Contact_person con"
                    + " USING (User_ID)"
                    + " JOIN Organizer_company org"
                    + " USING (Company_ID)"
                    + " WHERE u.User_ID = '" + User_ID + "';";
            ResultSet rs5 = stmt.executeQuery(Org_table);
            rs5.next();
            //--------- Organizer's Detail
            Company_name = rs5.getString("Company_name");
            Contact_name = rs5.getString("Fname") + " " + rs5.getString("Lname");
            Email = rs5.getString("Email");
            Phone = rs5.getString("Phone_number_ct");
        } catch (SQLException ex) {
        }
    }

    public String getCompany_name(String User_ID) {
        ContactPersonDetail(User_ID);
        return Company_name;
    }

    public String getContact_name(String User_ID) {
        ContactPersonDetail(User_ID);
        return Contact_name;
    }

    public String getEmail(String User_ID) {
        ContactPersonDetail(User_ID);
        return Email;
    }

    public String getPhone(String User_ID) {
        ContactPersonDetail(User_ID);
        return Phone;
    }
}

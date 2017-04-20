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
public class OrganizerCompany {

    Connection con;

    public OrganizerCompany() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String com_ID2;

    public void createOrganizerCompany() {
        try {
            Statement stmt = con.createStatement();
            String numCom = "Select count(Company_ID) from Organizer_company";
            ResultSet numCom1 = stmt.executeQuery(numCom);
            numCom1.next();
            String comS = numCom1.getString("count(Company_ID)");
            for (int i = comS.length(); i < 3; i++) {
                com_ID2 += "0";
            }
            com_ID2 += comS;

        } catch (SQLException ex) {
        }
    }

    public String getOrganizerCompanyID() {
        createOrganizerCompany();
        return com_ID2;
    }

    public void insertContactPerson(String com_ID, String comPhone, String comName) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Insert into Organizer_company values('" + com_ID + "', '" + comPhone + "', '" + comName + "')";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
        }

    }

    public void addNewOrganizerCompany(String comName2, String Login_ID2, String comPhone2) {
        try {
            Statement stmt = con.createStatement();
            String check = "Select * from Organizer_company where Company_name = '" + comName2 + "' ";
            ResultSet rs = stmt.executeQuery(check);

            if (rs.next()) {
                com_ID2 = rs.getString("Company_ID");

                //CREATE New ContactPerson
                ContactPerson contact_person = new ContactPerson();
                contact_person.insertContactPerson(Login_ID2, comPhone2, com_ID2);

            } else {
                //CREATE New OrganizerCompany
                OrganizerCompany organizer_company = new OrganizerCompany();
                com_ID2 = organizer_company.getOrganizerCompanyID();  //getID
                organizer_company.insertContactPerson(com_ID2, comPhone2, comName2);

                //CREATE New ContactPerson
                ContactPerson contact_person = new ContactPerson();
                contact_person.insertContactPerson(Login_ID2, comPhone2, com_ID2);

            }
        } catch (SQLException ex) {
        }

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author jirpinya
 */
public class Concert {

    Connection con;

    public Concert() throws SQLException {
        this.con = DriverManager.getConnection(
                "jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp?zeroDateTimeBehavior=convertToNull&amp;characterEncoding=utf8",
                "it58070053_webp",
                "utKavVnZ79");
    }
    private String User_ID;
    private String Concert_ID;
    private String numConcert;
    private String ConcertName;
    private String Status;
    private String Start_Date;
    private String End_Date;
    private String Start_Time;
    private String End_Time;
    private String Location_Name;
    private String Hall_Name;
    private String Picture_Cover;
    private String Picture_Poster;

    public void createConcert_ID(String Concert_Name) {
        Concert_ID = "CON_" + (Concert_Name.substring(0, 3)).toUpperCase() + numConcert;
    }

    public String numConcert() {
        try {
            Statement stmt = con.createStatement();
            String numCon = "Select count(Concert_ID) from Concert where Concert_ID LIKE 'CON%'";
            ResultSet numCon1 = stmt.executeQuery(numCon);
            numCon1.next();
            numConcert = numCon1.getString("count(Concert_ID)");
            return numConcert;
        } catch (SQLException ex) {
        }
        return null;
    }

    public String getNewConcert_ID(String Concert_Name) {
        numConcert();
        createConcert_ID(Concert_Name);
        return Concert_ID;
    }

    public void insertConcert(String Concert_Name, String Status, String Location_ID, String User_ID, String covername, String postername, String Start_Date, String End_Date, String Start_Time, String End_Time) {
        try {
            Statement stmt = con.createStatement();
            String sql = "Insert into Concert values('" + Concert_ID + "', '" + Concert_Name + "', '" + Status + "', '" + Location_ID + "', '" + User_ID + "', '" + covername + "', '" + postername + "', '" + Start_Date + "', '" + End_Date + "', '" + Start_Time + "', '" + End_Time + "', NOW())";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
        }
    }

    public String getConcert_Name(String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String sql_ = "Select Concert_Name from Concert where Concert_ID = '" + Concert_ID + "'";
            ResultSet rs = stmt.executeQuery(sql_);
            rs.next();
            ConcertName = rs.getString("Concert_Name");
            return ConcertName;
        } catch (SQLException ex) {
        }
        return null;
    }

    public void showAllRequest(ArrayList<String> Concert_Name, ArrayList<String> Status, ArrayList<Timestamp> Date_Time, ArrayList<String> Contact_name) {
        try {
            Statement stmt = con.createStatement();
            String Concert_table = "SELECT Concert_Name, Status, Date_Time, Fname, Lname "
                    + "FROM Concert JOIN User USING (User_ID) ORDER BY Date_Time DESC;";
            ResultSet rs1 = stmt.executeQuery(Concert_table);

            while (rs1.next()) {
                Concert_Name.add(rs1.getString("Concert_Name"));
                Status.add(rs1.getString("Status"));
                Date_Time.add(rs1.getTimestamp("Date_Time"));
                Contact_name.add(rs1.getString("Fname") + " " + rs1.getString("Lname"));
            }
        } catch (SQLException ex) {
        }
    }

    public void AcceptedRequest(ArrayList<String> Concert_NameAc, ArrayList<Timestamp> Date_TimeAc, ArrayList<String> Contact_nameAc) {
        try {
            Statement stmt = con.createStatement();
            String ConcertAc_table = "SELECT Concert_Name, Date_Time, Fname, Lname "
                    + "FROM Concert JOIN User USING (User_ID) WHERE Status = 'ACCEPTED' ORDER BY Date_Time DESC;";
            ResultSet rs2 = stmt.executeQuery(ConcertAc_table);
            while (rs2.next()) {
                Concert_NameAc.add(rs2.getString("Concert_Name"));
                Date_TimeAc.add(rs2.getTimestamp("Date_Time"));
                Contact_nameAc.add(rs2.getString("Fname") + " " + rs2.getString("Lname"));
            }
        } catch (SQLException ex) {
        }
    }

    public void ConcertDetail(String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String ConcertA_table = "SELECT * FROM Concert"
                    + " JOIN Location"
                    + " USING (Location_ID)"
                    + " Where Concert_ID = '" + Concert_ID + "';";
            ResultSet rs2 = stmt.executeQuery(ConcertA_table);
            rs2.next();
            ConcertName = rs2.getString("Concert_Name");
            Status = rs2.getString("Status");
            Start_Date = rs2.getString("Start_Date");
            End_Date = rs2.getString("End_Date");
            Start_Time = rs2.getString("Start_Time");
            End_Time = rs2.getString("End_Time");
            Location_Name = rs2.getString("Location_Name");
            Hall_Name = rs2.getString("Hall_Name");
            Picture_Cover = rs2.getString("Picture_Cover");
            Picture_Poster = rs2.getString("Picture_Poster");

        } catch (SQLException ex) {
        }
    }

    public String getStatus(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Status;
    }

    public String getStart_Date(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Start_Date;
    }

    public String getEnd_Date(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return End_Date;
    }

    public String getStart_Time(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Start_Time;
    }

    public String getEnd_Time(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return End_Time;
    }

    public String getLocation_Name(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Location_Name;
    }

    public String getHall_Name(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Hall_Name;
    }

    public String getPicture_Cover(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Picture_Cover;
    }

    public String getPicture_Poster(String Concert_ID) {
        ConcertDetail(Concert_ID);
        return Picture_Poster;
    }

    public void updateStatusCANCELED(String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String status = "UPDATE Concert\n"
                    + "SET Status = 'CANCELED'\n"
                    + "WHERE Concert_ID = '" + Concert_ID + "' ;";
            ResultSet rs2 = stmt.executeQuery(status);
            rs2.next();
        } catch (SQLException ex) {
        }
    }

    public void updateStatusACCEPTED(String Concert_ID) {
        try {
            Statement stmt = con.createStatement();
            String status = "UPDATE Concert\n"
                    + "SET Status = 'ACCEPTED'\n"
                    + "WHERE Concert_ID = '" + Concert_ID + "' ;";
            ResultSet rs2 = stmt.executeQuery(status);
            rs2.next();
        } catch (SQLException ex) {
        }
    }

    public String getConcert_ID(String Concert_Name) {
        try {
            Statement stmt = con.createStatement();
            String Concert_table = "SELECT Concert_ID, User_ID FROM Concert WHERE Concert_Name = '" + ConcertName + "';";
            ResultSet rs1 = stmt.executeQuery(Concert_table);
            rs1.next();
            Concert_ID = rs1.getString("Concert_ID");
            return Concert_ID;
        } catch (SQLException ex) {
        }
        return null;
    }
        
    public String getUser_ID(String Concert_Name) {
        try {
            Statement stmt = con.createStatement();
            String Concert_table = "SELECT Concert_ID, User_ID FROM Concert WHERE Concert_Name = '" + ConcertName + "';";
            ResultSet rs1 = stmt.executeQuery(Concert_table);
            rs1.next();
            User_ID = rs1.getString("User_ID");
            return User_ID;
        } catch (SQLException ex) {
        }
        return null;
    }
}

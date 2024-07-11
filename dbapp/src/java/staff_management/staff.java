/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff_management;

import java.sql.*;
import java.util.*;

/**
 *
 * @author ccslearner
 */
public class staff {
    public int staff_id;
    public String position;
    public String first_name;
    public String last_name;
    public String email;
    public long mobileNumber;
    public ArrayList<Integer> staff_idList = new ArrayList<>();
    public ArrayList<String> positionList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    public ArrayList<String> emailList = new ArrayList<>();
    public ArrayList<Long> mobileNumberList = new ArrayList<>();
    
    public int addRecord () {           // Method add a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=Yalowi7(");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(staff_id) + 1 as new_id FROM staff" );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                staff_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO staff VALUES (?,?,?,?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, staff_id);
            pstmt.setString (2, first_name);
            pstmt.setString (3, last_name);
            pstmt.setString (4, position);
            pstmt.setString (5, email);
            pstmt.setLong    (6, mobileNumber);
            // 7. Execute the SQL Statement
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int modRecord () {           // Method modify a Record
        
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE staff          " +
                                                            "SET   position = ? ,"+
                                                            "first_name   = ? ," + 
                                                            "last_name   = ? ," +
                                                            "email   = ? ," +
                                                            "mobile_no = ? "+
                                                            "WHERE  staff_id = ? ");
            // 5. Supply the statement with values
            
            pstmt.setString (1, position);
            pstmt.setString (2, first_name);
            pstmt.setString (3, last_name);
            pstmt.setString (4, email);
            pstmt.setLong   (5, mobileNumber);
            pstmt.setInt    (6, staff_id);
            
            // 6. Execute the SQL Statement
            pstmt.executeUpdate();   
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        } 
    }

    public int delRecord () {           // Method delete a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            
            // delete subject table corresponding to the staff
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM transactions WHERE authorizing_staff = ?");
            pstmt.setInt    (1, staff_id);
            pstmt.executeUpdate();
            
            
            // delete staff
            pstmt = conn.prepareStatement("DELETE FROM staff WHERE staff_id = ?");
            pstmt.setInt    (1, staff_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM staff WHERE staff_id = ?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, staff_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            staff_idList.clear();
            positionList.clear();
            first_nameList.clear();
            last_nameList.clear();
            emailList.clear();
            mobileNumberList.clear();
            while (rs.next()) {
                staff_id  = rs.getInt("staff_id");
                position    = rs.getString("position");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                email = rs.getString("email");
                mobileNumber = rs.getLong("mobileNumber");
                staff_idList.add(staff_id);
                positionList.add(position);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                emailList.add(email);
                mobileNumberList.add(mobileNumber);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int viewFilterRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM staff WHERE first_name = ? AND last_name = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, first_name);
            pstmt.setString    (2, last_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            staff_idList.clear();
            positionList.clear();
            first_nameList.clear();
            last_nameList.clear();
            emailList.clear();
            mobileNumberList.clear();
            while (rs.next()) {
                staff_id  = rs.getInt("staff_id");
                position    = rs.getString("position");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                email = rs.getString("email");  
                mobileNumber = rs.getLong("mobileNumber");  
                staff_idList.add(staff_id);
                positionList.add(position);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                emailList.add(email);
                mobileNumberList.add(mobileNumber);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int loadRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM staff");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            staff_idList.clear();
            positionList.clear();
            first_nameList.clear();
            last_nameList.clear();
            emailList.clear();
            mobileNumberList.clear();
            while (rs.next()) {
                staff_id  = rs.getInt("staff_id");
                position    = rs.getString("position");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                email = rs.getString("email"); 
                mobileNumber = rs.getLong("mobile_no"); 
                staff_idList.add(staff_id);
                positionList.add(position);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                emailList.add(email);
                mobileNumberList.add(mobileNumber);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public static void main (String args[])
    {
        staff n = new staff();
        n.staff_id = 1901;
        n.first_name = "e";
        n.last_name = "nee";
        n.position = "Librarian";
        n.mobileNumber = 2341241;
        n.email = "sdf";
        n.modRecord();
    }
   
}

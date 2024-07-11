package borrowermanagement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;

public class borrower {
    
    //fields of borrower
    public int borrower_id;
    public String first_name;
    public String last_name;
    public String email;
    public Long mobile_no;
    public String type_of_user;
    public int quanti_borrowed;
    public int quanti_returned;
    public int quanti_lost_damage;
    
    //list of borrowers
    public ArrayList<Integer> borrower_idList       = new ArrayList<> ();
    public ArrayList<String>  first_nameList        = new ArrayList<> ();
    public ArrayList<String>  last_nameList         = new ArrayList<> ();
    public ArrayList<String>  email_List            = new ArrayList<> ();
    public ArrayList<Long> mobile_noList         = new ArrayList<> ();
    public ArrayList<String>  type_of_userList      = new ArrayList<> ();
    public ArrayList<Integer> quanti_borrowedList   = new ArrayList<> ();
    public ArrayList<Integer> quanti_returnedList   = new ArrayList<> ();
    public ArrayList<Integer> quanti_lost_damageList= new ArrayList<> ();
    
    public borrower(){
        
    }
    
    public int add_borrower() {

        try {
            // 1. connect to our database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=Yalowi7(&useSSL=false");
            System.out.println("Connection Successful");

            // 2. Prepare our sql statements
            // 2.1 Get the next BorrowerID
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(borrower_id) + 1 AS newID FROM borrowers");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                borrower_id = rst.getInt("newID");
            }
            // 2.2 Save the new borrower
            pstmt = conn.prepareStatement("INSERT INTO borrowers (borrower_id, first_name, last_name, email, mobile_no, type_of_user, quanti_borrowed, quanti_returned, quanti_lost_damage) VALUE (?, ?, ?, ?, ?, ?, 0, 0, 0)");
            pstmt.setInt(1, borrower_id);
            pstmt.setString(2, first_name);
            pstmt.setString(3, last_name);
            pstmt.setString(4, email);
            pstmt.setLong(5, mobile_no);
            pstmt.setString(6, type_of_user);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            System.out.println("Successful");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int search_view_borrower(int borrowerID) {
        try {
            // 1. connect to our database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");

            // 2. Prepare our sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, borrowerID);

            ResultSet rs = pstmt.executeQuery();

            // Check if the borrower exists
            if (rs.next()) {
                borrower_id = rs.getInt("borrower_id");
                first_name = rs.getString("first_name");
                last_name = rs.getString("last_name");
                email = rs.getString("email");
                mobile_no = rs.getLong("mobile_no");
                type_of_user = rs.getString("type_of_user");
                quanti_borrowed = rs.getInt("quanti_borrowed");
                quanti_returned = rs.getInt("quanti_returned");
                quanti_lost_damage = rs.getInt("quanti_lost_damage");

                // Close the result set and prepared statement
                rs.close();
                pstmt.close();
                conn.close();

                return 1; // Borrower found
            } else {
                // No matching borrower found
                rs.close();
                pstmt.close();
                conn.close();
                return 0;
            }
        } catch (SQLException e) {
            // Log or print the exception details
            e.printStackTrace();
            return 0; // Error occurred
        }
    }
        
   // Function to get Quantity Borrowed
    public int getQuantityBorrowed(String borrowerID) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement pstmt = conn.prepareStatement("SELECT quanti_borrowed FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, Integer.parseInt(borrowerID));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int quantityBorrowed = rs.getInt("quanti_borrowed");

                rs.close();
                pstmt.close();
                conn.close();

                return quantityBorrowed;
            } else {
                rs.close();
                pstmt.close();
                conn.close();

                return -1; 
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; 
        }
    }

    // Function to get Quantity Returned
    public int getQuantityReturned(String borrowerID) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement pstmt = conn.prepareStatement("SELECT quanti_returned FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, Integer.parseInt(borrowerID));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int quantityReturned = rs.getInt("quanti_returned");

                rs.close();
                pstmt.close();
                conn.close();

                return quantityReturned;
            } else {
                rs.close();
                pstmt.close();
                conn.close();

                return -1; 
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; 
        }
    }

    // Function to get Quantity Lost/Damaged
    public int getQuantityLostDamaged(String borrowerID) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement pstmt = conn.prepareStatement("SELECT quanti_lost_damage FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, Integer.parseInt(borrowerID));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int quantityLostDamaged = rs.getInt("quanti_lost_damage");

                rs.close();
                pstmt.close();
                conn.close();

                return quantityLostDamaged;
            } else {
                rs.close();
                pstmt.close();
                conn.close();
                
                return -1; 
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; 
        }
    }
    
    public int updateBorrowerField(String fieldName, String newValue) {
        try {
            // 1. connect to our database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful");

            // 2. Prepare our sql statement
            String updateQuery = "UPDATE borrowers SET " + fieldName + " = ? WHERE borrower_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            switch (fieldName) {
                case "first_name":
                    pstmt.setString(1, newValue);
                    break;
                case "last_name":
                    pstmt.setString(1, newValue);
                    break;
                case "email":
                    pstmt.setString(1, newValue);
                    break;
                case "mobile_no":
                    pstmt.setLong(1, Long.parseLong(newValue));
                    break;
                case "type_of_user":
                    pstmt.setString(1, newValue);
                    break;
                case "quanti_borrowed":
                    pstmt.setInt(1, Integer.parseInt(newValue));
                    break;
                case "quanti_returned":
                    pstmt.setInt(1, Integer.parseInt(newValue));
                    break;
                case "quanti_lost_damage":
                    pstmt.setInt(1, Integer.parseInt(newValue));
                    break;
                default:
                    return 0; 
            }

            pstmt.setInt(2, borrower_id);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            if (rowsAffected > 0) {
                return 1; 
            } else {
                return -1; 
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
public int deleteBorrower(int borrowerID) {
    try {
        // 1. connect to our database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

        // 2. Prepare our sql statement
        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM borrowers WHERE borrower_id = ?");
        pstmt.setInt(1, borrowerID);

        int rowsAffected = pstmt.executeUpdate();

        pstmt.close();
        conn.close();
        return rowsAffected;
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return -1; 
    }
}
    
    public static void main(String argd[]){
        
        borrower B = new borrower();
        B.first_name = "Juan";
        B.last_name = "Dela Cruz";
        B.email = "juandelacruz@gmail.com";
        B.mobile_no = 2767484L;
        B.type_of_user = "S";
        
        
        System.out.println(B.search_view_borrower(121501));
        System.out.println(B.first_name);
        System.out.println(B.mobile_no);
            
    }
    
}
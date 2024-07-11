package borrowreportmanagement;

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

public class MYBorrowReport {
    public String first_name;
    public String last_name;
    public String email;
    public String type_of_user;
    public int quanti_borrowed;

    public ArrayList<Integer> transaction_idList = new ArrayList<>();
    public ArrayList<Integer> book_idList = new ArrayList<>();
    public ArrayList<Integer> borrower_idList = new ArrayList<>();
    public ArrayList<String> checkout_dateList = new ArrayList<>();
    public ArrayList<String> return_dateList = new ArrayList<>();
    public ArrayList<String> statusList = new ArrayList<>();
    public ArrayList<Integer> authorizing_staffList = new ArrayList<>();

    public MYBorrowReport() {
    }

    public int generateMonthlyReport(String month) {

        try {
            // 1. connect to our database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=Yalowi7(&useSSL=false");

            // 2. Prepare our sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM transactions WHERE MONTH(checkout_date) = ?");
            pstmt.setString(1, month);

            ResultSet rs = pstmt.executeQuery();

            // Check if the borrower exists
            while (rs.next()) {
                transaction_idList.add(rs.getInt("transaction_id"));
                book_idList.add(rs.getInt("book_id"));
                borrower_idList.add(rs.getInt("borrower_id"));
                checkout_dateList.add(rs.getString("checkout_date"));
                return_dateList.add(rs.getString("return_date"));
                statusList.add(rs.getString("status"));
                authorizing_staffList.add(rs.getInt("authorizing_staff"));

                // Close the result set and prepared statement
                
            } 
            
            rs.close();
            pstmt.close();
            conn.close();

            return 1; // Borrower found

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; // Error occurred
        }
    }
    
    public int generateYearlyReport(String year) {
        
        try {
            // 1. connect to our database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            // 2. Prepare our sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM transactions WHERE YEAR(checkout_date) = ?");
            pstmt.setString(1, year);

            ResultSet rs = pstmt.executeQuery();

            // Check if the borrower exists
            while (rs.next()) {
                transaction_idList.add(rs.getInt("transaction_id"));
                book_idList.add(rs.getInt("book_id"));
                borrower_idList.add(rs.getInt("borrower_id"));
                checkout_dateList.add(rs.getString("checkout_date"));
                return_dateList.add(rs.getString("return_date"));
                statusList.add(rs.getString("status"));
                authorizing_staffList.add(rs.getInt("authorizing_staff"));

                // Close the result set and prepared statement
                
            } 
            
            rs.close();
            pstmt.close();
            conn.close();

            return 1; // Borrower found

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0; // Error occurred
        }
    }
    
//    public int filterQuantity(String filterType, String year, String month) {
//        try {
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
//            String query = "";
//
//            if (filterType.equals("total")) {
//                query = "SELECT borrower_id, first_name, last_name, email, type_of_user, quanti_borrowed FROM borrowers";
//            } else if (filterType.equals("section")) {
//                query = "SELECT borrower_id, first_name, last_name, email, type_of_user, quanti_borrowed FROM borrowers WHERE section = ?";
//            } else if (filterType.equals("onlineOffline")) {
//                query = "SELECT borrower_id, first_name, last_name, email, type_of_user, quanti_borrowed FROM borrowers WHERE is_available_online = ?";
//            }
//
//            PreparedStatement pstmt = conn.prepareStatement(query);
//
//            if (filterType.equals("section")) {
//                // Set additional parameters for section filter
//                pstmt.setString(1, "your_section_value"); // replace with the actual section value
//            } else if (filterType.equals("onlineOffline")) {
//                // Set additional parameters for online/offline filter
//                pstmt.setString(1, "your_online_offline_value"); // replace with the actual online/offline value
//            }
//
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                int borrowerID = rs.getInt("borrower_id");
//                String firstName = rs.getString("first_name");
//                String lastName = rs.getString("last_name");
//                String email = rs.getString("email");
//                String typeOfUser = rs.getString("type_of_user");
//                int quantityBorrowed = rs.getInt("quanti_borrowed");
//
//                // Add data to lists for display or further processing
////                borrower_idList.add(Integer.toString(borrowerID));
////                first_nameList.add(firstName);
////                last_nameList.add(lastName);
////                email_List.add(email);
////                type_of_userList.add(typeOfUser);
////                quanti_borrowedList.add(quantityBorrowed);
//            }
//
//            rs.close();
//            pstmt.close();
//            conn.close();
//
//            return 1; // Filtered data found
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            return -1; // Error occurred
//        }
//    }
//    
//    public static void main(String[] args) {
//        MYBorrowReport b = new MYBorrowReport();
////        b.generateMonthlyReport(121503, "11");
//        System.out.println(b.first_name);
//    }
}
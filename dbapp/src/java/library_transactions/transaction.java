/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library_transactions;

import java.util.*;
import java.sql.*;

/**
 *
 * @author ccslearner
 */
public class transaction {
    // transaction fields
    public int transaction_id;
    public int book_id;
    public int borrower_id;
    public String checkout_date;
    public String return_date;
    public String status;
    public int authorizing_staff;
    public String msg;
    
    public int incident_id;
    public String desc;
    public String incident_date;
    public int inc_book;
    public String type;
    
    
    // list of transactions
    public ArrayList<Integer> transaction_idList = new ArrayList<>();
    public ArrayList<Integer> book_idList = new ArrayList<>();
    public ArrayList<Integer> borrower_idList = new ArrayList<>();
    public ArrayList<String> checkout_dateList = new ArrayList<>();
    public ArrayList<String> return_dateList = new ArrayList<>();
    public ArrayList<String> statusList = new ArrayList<>();
    public ArrayList<Integer> authorizing_staffList = new ArrayList<>();
    
    public int add_transaction() {
        try {
            // code that will interact with database
            
            // 1. connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(transaction_id) + 1 AS newID FROM transactions");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                transaction_id = rst.getInt("newID"); 
            }
            
            // 2.2. save the new transaction
            pstmt =  conn.prepareStatement("INSERT INTO transactions (transaction_id, book_id, borrower_id, checkout_date, return_date, status, authorizing_staff) VALUE (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, transaction_id);
            pstmt.setInt(2, book_id);
            pstmt.setInt(3, borrower_id);
            pstmt.setString(4, checkout_date);
            pstmt.setString(5, return_date);
            pstmt.setString(6, status);
            pstmt.setInt(7, authorizing_staff);
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Transaction Added!");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int find_book_id(String title, String author) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT book_id FROM books WHERE title = ? AND author = ?");
            pstmt.setString(1, title);
            pstmt.setString(2, author);
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                book_id = rst.getInt("book_id"); 
            }

            System.out.println("Book ID Retrieved!");
            return book_id;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public ArrayList<Integer> get_books() {
        ArrayList<Integer> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT book_id FROM books ORDER BY book_id ASC");
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                int data = rst.getInt("book_id");
                column_data.add(data);
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public ArrayList<Integer> get_borrowers() {
        ArrayList<Integer> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT borrower_id FROM borrowers ORDER BY borrower_id ASC");
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                int data = rst.getInt("borrower_id");
                column_data.add(data);
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public ArrayList<Integer> get_id_list(String column) {
        ArrayList<Integer> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT " + column + " FROM transactions ORDER BY " + column + " ASC");
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                int data = rst.getInt(column);
                column_data.add(data);
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public void get_transaction_details(int transaction_id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM transactions WHERE transaction_id = ?");
            pstmt.setInt(1, transaction_id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                this.book_id =  rst.getInt("book_id");
                this.borrower_id =  rst.getInt("borrower_id");
                this.checkout_date =  rst.getString("checkout_date");
                this.return_date =  rst.getString("return_date");
                this.status = rst.getString("status");
                this.authorizing_staff =  rst.getInt("authorizing_staff");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public int borrow_book(int book_id) {
        // 1. connect to database
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(transaction_id) + 1 AS newID FROM transactions");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                transaction_id = rst.getInt("newID"); 
            }
            
            // 2.2. save the new transaction
            pstmt =  conn.prepareStatement("INSERT INTO transactions (transaction_id, book_id, borrower_id, checkout_date, return_date, status, authorizing_staff) VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, transaction_id);
            pstmt.setInt(2, book_id);
            pstmt.setInt(3, borrower_id);
            pstmt.setString(4, checkout_date);
            pstmt.setString(5, null);
            pstmt.setString(6, "pending");
            pstmt.setNull(7, java.sql.Types.INTEGER);

            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            return 1;
            
        } catch (Exception e) {
            msg = e.getMessage();
            return 0;
        }
    }
    
    public int approve_borrow(int id) {
        int quanti_borrowed_curr = 0;
        try {
            // code that will interact with database
            
            // 1. connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE transactions SET status = ?, authorizing_staff = ? WHERE transaction_id = ?");
            pstmt.setString(1, "approved");
            pstmt.setInt(2, authorizing_staff);
            pstmt.setInt(3, id);            
            
            pstmt.executeUpdate();
            
            // get borrower id from transaction
            pstmt = conn.prepareStatement("SELECT borrower_id FROM transactions WHERE transaction_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                borrower_id = rst.getInt("borrower_id"); 
            }
            
            // get current quanti_borrowed + 1
            pstmt = conn.prepareStatement("SELECT quanti_borrowed FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, borrower_id);
            
            rst = pstmt.executeQuery();
            
            while (rst.next()) {
                quanti_borrowed_curr = rst.getInt("quanti_borrowed"); 
            }
            
            // add to quanti_borrowed of borrower_id
            quanti_borrowed_curr++;
            pstmt = conn.prepareStatement("UPDATE borrowers SET quanti_borrowed = ? WHERE borrower_id = ?");
            pstmt.setInt(1, quanti_borrowed_curr);
            pstmt.setInt(2, borrower_id);
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Transaction Updated!");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int return_book(int id) {
        int days = 0;
        int quanti_returned_curr = 0;
        try {
            // code that will interact with database
            
            // 1. connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            // find num of days between checkout and return
            PreparedStatement pstmt = conn.prepareStatement("UPDATE transactions SET return_date = ? WHERE transaction_id = ?");
            pstmt.setString(1, return_date);
            pstmt.setInt(2, id);
            
            pstmt.executeUpdate();
                    
            pstmt = conn.prepareStatement("SELECT DATEDIFF(return_date, checkout_date) AS days_difference FROM transactions where transaction_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                days = rst.getInt("days_difference"); 
            }
                    
            pstmt = conn.prepareStatement("UPDATE transactions SET status = ? WHERE transaction_id = ?");
            if (days <= 14) {
                pstmt.setString(1, "returned");
            } else {
                pstmt.setString(1, "late");
            }
            pstmt.setInt(2, id);
            
            pstmt.executeUpdate();
            
            // get borrower id from transaction
            pstmt = conn.prepareStatement("SELECT borrower_id FROM transactions WHERE transaction_id = ?");
            pstmt.setInt(1, id);
            
            rst = pstmt.executeQuery();
            
            while (rst.next()) {
                borrower_id = rst.getInt("borrower_id"); 
            }
            
            // get current quanti_borrowed + 1
            pstmt = conn.prepareStatement("SELECT quanti_returned FROM borrowers WHERE borrower_id = ?");
            pstmt.setInt(1, borrower_id);
            
            rst = pstmt.executeQuery();
            
            while (rst.next()) {
                quanti_returned_curr = rst.getInt("quanti_returned"); 
            }
            
            // add to quanti_borrowed of borrower_id
            quanti_returned_curr++;
            pstmt = conn.prepareStatement("UPDATE borrowers SET quanti_returned = ? WHERE borrower_id = ?");
            pstmt.setInt(1, quanti_returned_curr);
            pstmt.setInt(2, borrower_id);
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Transaction Updated!");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public ArrayList<Integer> get_pending() {
        ArrayList<Integer> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT transaction_id FROM transactions WHERE status = 'pending' ORDER BY transaction_id ASC");
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                int data = rst.getInt("transaction_id");
                column_data.add(data);
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public ArrayList<Integer> get_approved(int id) {
        ArrayList<Integer> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT transaction_id FROM transactions WHERE status = 'approved' AND borrower_id = ? ORDER BY transaction_id ASC");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                int data = rst.getInt("transaction_id");
                column_data.add(data);
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public int update_transaction(int id) {
        try {
            // code that will interact with database
            
            // 1. connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE transactions SET book_id = ?, borrower_id = ?, checkout_date = ?, return_date = ?, status = ?, authorizing_staff = ? WHERE transaction_id = ?");
            pstmt.setInt(1, book_id);
            pstmt.setInt(2, borrower_id);
            pstmt.setString(3, checkout_date);
            pstmt.setString(4, return_date);
            pstmt.setString(5, status);
            pstmt.setInt(6, authorizing_staff);
            pstmt.setInt(7, id);            
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Transaction Updated!");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public String get_first_name(int id, String table, String id_name) {
        String str = "";
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT first_name FROM " + table + " WHERE " + id_name + "_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                str = rst.getString("first_name");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return str;
    }
    
    public String get_last_name(int id, String table, String id_name) {
        String str = "";
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT last_name FROM " + table + " WHERE " + id_name + "_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                str = rst.getString("last_name");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return str;
    }
    
    public String get_title(int id) {
        String str = "";
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT title FROM books WHERE book_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                str = rst.getString("title");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return str;
    }
    
    public String get_author(int id) {
        String str = "";
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT author FROM books WHERE book_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                str = rst.getString("author");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return str;
    }
    
    public int delete_transaction(int id) {
        try {
            // code that will interact with database
            
            // 1. connect to database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            System.out.println("Connection Successful!");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM transactions WHERE transaction_id = ?");
            pstmt.setInt(1, id);         
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Transaction Deleted!");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
       
    public ArrayList<Integer> filter_list(int book_id, String title, String author, int borrower_id, String borrower_name, String staff_name) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            StringBuilder query = new StringBuilder();
            query.append("SELECT t.transaction_id " +
                         "FROM transactions t JOIN books b " +
                         "ON t.book_id = b.book_id " +
                         "JOIN staff s " +
                         "ON t.authorizing_staff = s.staff_id " +
                         "JOIN borrowers br " +
                         "ON t.borrower_id = br.borrower_id " +
                         "WHERE 1 = 1");
                    
            
            
            if (book_id > 0) {
                query.append(" AND b.book_id = ").append(book_id);
            }
            
            if (!title.isEmpty()) {
            query.append(" AND b.title = '").append(title).append("'");
            }

            if (!author.isEmpty()) {
                query.append(" AND b.author = '").append(author).append("'");
            }

            if (borrower_id > 0) {
                query.append(" AND t.borrower_id = ").append(borrower_id);
            }

            if (!borrower_name.isEmpty()) {
                query.append(" AND CONCAT (br.first_name, ' ',  br.last_name) = '").append(borrower_name).append("'");
            }

            if (!staff_name.isEmpty()) {
                query.append(" AND CONCAT (s.first_name, ' ',  s.last_name) = '").append(staff_name).append("'");
            }
            
            PreparedStatement pstmt = conn.prepareStatement(query.toString());
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                id_list.add(rst.getInt("transaction_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public ArrayList<Integer> get_filtered_useID(int id, String column) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM transactions WHERE " + column + "_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("transaction_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public ArrayList<Integer> get_filtered_useName(String full_name, String table, String column, String columnb) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT t.transaction_id " +
                                                            "FROM transactions t JOIN "+ table + " b " +
                                                            "                    ON t." + column + " = b." + columnb + "_id " +
                                                            "WHERE CONCAT(b.first_name, ' ', b.last_name) = ?;");
            pstmt.setString(1, full_name);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("transaction_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public ArrayList<Integer> get_filtered_book(String key, String column) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT t.transaction_id " +
                                                            "FROM transactions t JOIN books b " +
                                                            "                    ON t.book_id = b.book_id " +
                                                            "WHERE " + column + " = ?;");
            pstmt.setString(1, key);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("transaction_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public ArrayList<Integer> generate_report(String type) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT incident_id " +
                                                            "FROM incidents " +
                                                            "WHERE incident_type = ?;");
            pstmt.setString(1, type);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("incident_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public void get_incident(int id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM incidents WHERE incident_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                this.incident_id =  id;
                this.incident_date =  rst.getString("incident_date");
                this.desc =  rst.getString("description");
                this.inc_book =  rst.getInt("book_id");
                this.type = rst.getString("incident_type");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public transaction() {
        // constructor method
    }
    
//    public static void main(String[] args) {
//        transaction T = new transaction();
////        ArrayList<Integer> arrayList = new ArrayList<>();
//        
////        arrayList = T.get_pending();
//        
////        for (int element : arrayList) {
////            System.out.println(element);
////        }
//
//        T.authorizing_staff = 192002;
//        T.approve_borrow(1803);
//    }

}

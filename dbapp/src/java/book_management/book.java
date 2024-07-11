/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book_management;
import java.sql.*;
import java.util.*;
/**
 *
 * @author ccslearner
 */

public class book {
    public int book_id;
    public String title;
    public String author;
    public long isbn;
    public String section;
    public boolean is_available_offline;
    public boolean is_available_online;
    public String msg;
    
    public ArrayList <Integer> book_idList = new ArrayList <>();
    public ArrayList <String> title_list = new ArrayList <>();
    public ArrayList <String> author_list = new ArrayList <>();
    public ArrayList <Long> isbn_list = new ArrayList <>();
    public ArrayList <String> section_list = new ArrayList <>();
    public ArrayList <Boolean> is_available_offline_list = new ArrayList <>();
    public ArrayList <Boolean> is_available_online_list = new ArrayList <>();
    
    public int addBook () {           // Method add a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=Yalowi7(");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(book_id) + 1 as new_id FROM books " );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                book_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO books VALUES (?,?,?,?,?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, book_id);
            pstmt.setString (2, title);
            pstmt.setString (3, author);
            pstmt.setLong (4, isbn);
            pstmt.setString (5, section);
            pstmt.setBoolean (6, is_available_online);
            pstmt.setBoolean (7, is_available_offline);
            
            // 7. Execute the SQL Statement
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
        } catch (SQLException e) {
            msg = e.getMessage();
            return 0;
        }
    }

    public int modRecord (int id) {           // Method modify a Record
        
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE books          " +
                                                            "SET   title = ?, "+  
                                                            "author   = ?, " +
                                                            "isbn   = ?, " +
                                                            "section   = ?, " +
                                                            "is_available_online   = ?, " +
                                                            "is_available_offline   = ? " +
                                                            "WHERE book_id  = ? ");
            // 5. Supply the statement with values
            pstmt.setString (1, title);
            pstmt.setString (2, author);
            pstmt.setLong (3, isbn);
            pstmt.setString (4, section);
            pstmt.setBoolean (5, is_available_online);
            pstmt.setBoolean (6, is_available_offline);
            pstmt.setInt    (7, id);
            
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

    public int delRecord (int book_id) {           // Method delete a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            
                      
            // delete book
            PreparedStatement pstmt = conn.prepareStatement("UPDATE books SET is_available_online = false, is_available_offline = false WHERE book_id=?");
            pstmt.setInt    (1, book_id);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            msg = e.getMessage();
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE book_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, book_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            book_idList.clear();
            title_list.clear();
            author_list.clear();
            isbn_list.clear();
            section_list.clear();
            is_available_offline_list.clear();
            is_available_online_list.clear();
            while (rs.next()) {
                book_id  = rs.getInt("book_id");
                title = rs.getString("title");
                author = rs.getString("author");
                isbn = rs.getInt("isbn");
                section = rs.getString("section");
                is_available_offline = rs.getBoolean("is_available_offline");
                is_available_online = rs.getBoolean("is_available_online");
                book_idList.add(book_id);
                title_list.add(title);
                author_list.add(author);
                isbn_list.add(isbn);
                section_list.add(section);
                is_available_offline_list.add(is_available_offline);
                is_available_online_list.add(is_available_online);
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
    
    public ArrayList<Integer> viewFilterRecordbyauthor(String author)
    {
       ArrayList<Integer> id_list = new ArrayList<>();
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE author = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, author);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                id_list.add(rs.getInt("book_id"));
            }
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } 
        
        return id_list;
    }
    
    public ArrayList<Integer> viewFilterRecordbytitle(String title)
    {
       ArrayList<Integer> id_list = new ArrayList<>();
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE title = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1,title );
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {               
                id_list.add(rs.getInt("book_id"));
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } 
        
        return id_list;
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE title = ? AND author = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, title);
            pstmt.setString    (2, author);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            book_idList.clear();
            title_list.clear();
            author_list.clear();
            isbn_list.clear();
            section_list.clear();
            is_available_offline_list.clear();
            is_available_online_list.clear();
            while (rs.next()) {
                book_id  = rs.getInt("book_id");
                author = rs.getString("author");
                isbn = rs.getInt("isbn");
                section = rs.getString("section");
                is_available_offline = rs.getBoolean("is_available_offline");
                is_available_online = rs.getBoolean("is_available_online");
                book_idList.add(book_id);
                title_list.add(title);
                author_list.add(author);
                isbn_list.add(isbn);
                section_list.add(section);
                is_available_offline_list.add(is_available_offline);
                is_available_online_list.add(is_available_online);
                System.out.println(title);
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
    
    public ArrayList<Integer> get_filtered_ISBN(long ISBN) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE isbn = ?");
                pstmt.setLong(1, ISBN);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("book_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public ArrayList<Integer> get_filtered_Section(String section) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE section = ?");
                pstmt.setString(1, section);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                id_list.add(rst.getInt("book_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            book_idList.clear();
            title_list.clear();
            author_list.clear();
            isbn_list.clear();
            section_list.clear();
            is_available_offline_list.clear();
            is_available_online_list.clear();
            while (rs.next()) {
                book_id  = rs.getInt("book_id");
                title = rs.getString("title");
                author = rs.getString("author");
                isbn = rs.getInt("isbn");
                section = rs.getString("section");
                is_available_offline = rs.getBoolean("is_available_offline");
                is_available_online = rs.getBoolean("is_available_online");
                
                book_idList.add(book_id);
                title_list.add(title);
                author_list.add(author);
                isbn_list.add(isbn);
                section_list.add(section);
                is_available_offline_list.add(is_available_offline);
                is_available_online_list.add(is_available_online);
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
    
    public ArrayList<Integer> get_ids() {
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
    
    public void get_book(int id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM books WHERE book_id = ?");
            pstmt.setInt(1, id);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                book_id = id;
                title = rst.getString("title");
                author = rst.getString("author");
                isbn = rst.getLong("isbn");
                section = rst.getString("section");
                is_available_offline = rst.getBoolean("is_available_offline");
                is_available_online = rst.getBoolean("is_available_online");
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList<String> get_dist_string(String col) {
        ArrayList<String> column_data = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT " + col + " FROM books");
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                column_data.add(rst.getString(col));
            }

            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return column_data;
    }
    
    public ArrayList<Integer> filter_list(String author, String section, boolean avail_online, boolean avail_offline) {
        ArrayList<Integer> id_list = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            StringBuilder query = new StringBuilder();
            query.append("SELECT book_id " +
                         "FROM books " +
                         "WHERE 1 = 1");
                    
            
            
            if (!author.isEmpty()) {
                query.append(" AND author = '").append(author).append("'");
            }
            
            if (!section.isEmpty()) {
                query.append(" AND section = '").append(section).append("'");
            }

            if (avail_online) {
                query.append(" AND is_available_online = true");
            }

            if (avail_offline) {
                query.append(" AND is_available_offline = true");
            }
            
            PreparedStatement pstmt = conn.prepareStatement(query.toString());
            
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                id_list.add(rst.getInt("book_id"));
            }
            
            pstmt.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return id_list;
    }
    
    public int checkIncident()
    {
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE books          " +
                                                            "SET   is_available_offline = ? "+  
                                                            "where book_id  = ? ");
            // 5. Supply the statement with values
            
            is_available_offline = false;
            pstmt.setBoolean(1, is_available_offline);
            pstmt.setInt    (2, book_id);
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
    
    public book() {
        // constructor method
    }
    
//    public static void main (String args[])
//    {
//        book n = new book();
//        n.title = "nick";
//        n.author = "nick";
//        n.addBook();
//        n.viewFilterRecordbytitle();
//    }
}
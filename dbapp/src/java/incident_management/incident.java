package incident_management;

import java.sql.*;
import java.util.*;


public class incident {
    public int incident_id;
    public String incident_date;
    public String description;
    public int book_id;
    public String incident_type;
    public ArrayList <Integer> incident_idList = new ArrayList<>();
    public ArrayList <String> incident_dateList = new ArrayList<>();
    public ArrayList <String> descriptionList = new ArrayList<>();
    public ArrayList <Integer> book_idList = new ArrayList<>();
    public ArrayList <String> incident_typeList = new ArrayList<>();
    
    public int addRecord()
    {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=Yalowi7(");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(incident_id) + 1 as new_id FROM incidents" );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                incident_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO incidents VALUES (?,?,?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, incident_id);
            pstmt.setString (2, incident_date);
            pstmt.setString (3, description);
            pstmt.setInt (4, book_id);
            pstmt.setString (5, incident_type);
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
    public int loadRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app_grp3?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM incidents");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            incident_idList.clear();
            incident_dateList.clear();
            descriptionList.clear();
            book_idList.clear();
            incident_typeList.clear();
            while (rs.next()) {
                incident_id = rs.getInt("incident_id");
                incident_date = rs.getString("incident_date");
                description = rs.getString("description");
                book_id  = rs.getInt("book_id");
                incident_type = rs.getString("incident_type");
                book_idList.add(book_id);
                incident_idList.add(incident_id);
                descriptionList.add(description);
                incident_dateList.add(incident_date);
                incident_typeList.add(incident_type);
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
}

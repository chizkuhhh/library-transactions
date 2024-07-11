<%-- 
    Document   : addbook.jsp
    Created on : 11 15, 23, 2:31:25 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, book_management.*, incident_management.*,java.text.*"%>
<%
  // Create a Date object to represent the current date
  Date currentDate = new Date();

  // Define a date format
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

  // Format the current date according to the defined format
  String formattedDate = dateFormat.format(currentDate);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Incident</title>
    </head>
    <body>
        <h1>Added Incident Report</h1>
        <jsp:useBean id="b" class="book_management.book" scope="session" />
        <jsp:useBean id="i" class="incident_management.incident" scope="session" />
        <%
            String book_id = request.getParameter("book");
            String description = request.getParameter("description");
//            String incident_date = request.getParameter("incident_date");
            String incident_type = request.getParameter("incident_type");
            
            i.book_id = Integer.parseInt(book_id);
            i.description = description;
            i.incident_date = formattedDate;
            i.incident_type = incident_type;
            i.addRecord();
            b.book_id = i.book_id;
            if(incident_type.equals("lost")){
                b.checkIncident();
            }
                
        %>    
        Added details Success! <br>

                Book ID: <%=i.book_id%><br>
                Type: <%=i.incident_type%><br>
                Date: <%=i.incident_date%><br>
                Description: <%=i.description%><br>
                
        <br>
        click <a href="incident_report.jsp">report another incident</a><br>
    </body>
</html>

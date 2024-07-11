<%-- 
    Document   : addbook.jsp
    Created on : 11 15, 23, 2:31:25 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, book_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
    </head>
    <body>
        <h1>Added Staff</h1>
        <jsp:useBean id="staff" class="staff_management.staff" scope="session" />
        <%
            
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            String position = request.getParameter("staffs");
            String email = request.getParameter("email");
            String mobileNumber = request.getParameter("mobileNumber");
            staff.first_name = first_name;
            staff.last_name = last_name;
            staff.email = email;
            staff.mobileNumber = Long.parseLong(mobileNumber);
            staff.position = position;
            staff.addRecord();
        %>    
        Added details Success! <br>

                First Name: <%=staff.first_name%><br>
                Last Name: <%=staff.last_name%><br>
                Email: <%=staff.email%><br>
                Position: <%=staff.position%><br>
                Mobile Number<%=staff.mobileNumber%><br>              
        <br>
        click <a href="incident_report.jsp">here to go back to home page</a><br>
    </body>
</html>
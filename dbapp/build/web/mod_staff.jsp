<%-- 
    Document   : mod_staff
    Created on : 11 15, 23, 4:16:18 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, staffs_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Mod</title>
    </head>
    <body>
        <h1>Modify a Staff</h1>
        
        <jsp:useBean id="staff" class="staff_management.staff" scope="session" />
        <%
            String staff_id = request.getParameter("staffs");
            String first_name = request.getParameter("first_name");
            String last_name= request.getParameter("last_name");
            String position = request.getParameter("staff");
            String mobileNumber = request.getParameter("mobileNumber");
            String email = request.getParameter("email");
            staff.staff_id = Integer.parseInt(staff_id);
            staff.first_name = first_name;
            staff.last_name =  last_name;
            staff.position = position;
            staff.email = email;
            staff.mobileNumber = Long.parseLong(mobileNumber);
            staff.modRecord();
        %>  
        Modified successfully!
        <br>

                First Name: <%=staff.first_name%><br>
                Last Name: <%=staff.last_name%><br>
                Position: <%=staff.position%><br>
                Email: <%=staff.email%><br>
                Mobile Number: <%=staff.mobileNumber%><br>
        <br>
        click <a href="staff_homepage.jsp">here to go back to home page</a><br>
    </body>
</html>

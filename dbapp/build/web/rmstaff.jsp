<%-- 
    Document   : rmprof
    Created on : 11 10, 23, 8:41:14 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, staff_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a staff</title>
    </head>
    <body>
        <h1>Removed staff</h1>
        <jsp:useBean id="staff" class="staff_management.staff" scope="session" />
        <%
            String staff_id = request.getParameter("staff");
            staff.staff_id = Integer.parseInt(staff_id);
            staff.viewRecord();
            
            staff.delRecord();
        %>    
        Remove Staff Success! <br>

                First Name: <%=staff.first_name%><br>
                Last Name: <%=staff.last_name%><br>
                Position: <%=staff.position%><br>
                Email: <%=staff.email%><br>
                Mobile Number: <%=staff.mobileNumber%><br>
        <br>
        click <a href="staff_homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
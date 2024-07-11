<%-- 
    Document   : addborrower_processing
    Created on : 11 20, 23, 9:22:33 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowermanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Borrower Data Processing</title>
    </head>
    <body>
        <form>
            <jsp:useBean id="R" class="borrowermanagement.borrower" scope="session" />
            <% 
                // Receive the values from addborrower.html
                String v_first_name = request.getParameter("borrower_fname");
                R.first_name = v_first_name;
                String v_last_name = request.getParameter("borrower_lname");
                R.last_name = v_last_name;
                String v_email = request.getParameter("borrower_email");
                R.email = v_email;
                Long v_mobile_no = Long.parseLong(request.getParameter("borrower_mobnum"));
                R.mobile_no = v_mobile_no;
                String v_type_of_user = request.getParameter("borrower_type");
                R.type_of_user = v_type_of_user;

                int addStatus = R.add_borrower();
                if (addStatus == 1) {
            %>
                <h1>Add Borrower Data Successful</h1>
            <%  
                } else {
            %>  
                <h1>Add Borrower Data Failed</h1>
            <%  
                }
            %>
            <a href="addborrower.html">Back to Add Borrower</a>
        </form>
    </body>
</html>
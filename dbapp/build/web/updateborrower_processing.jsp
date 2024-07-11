<%-- 
    Document   : updateborrower_processing
    Created on : 11 20, 23, 3:10:20 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowermanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Borrower</title>
        
        <style>
            body {
                padding: 5vw;
                margin: 0;
            }
        </style>
    </head>
    <body>
    <center>
       <%
            String borrowerID = request.getParameter("borrower_id");
            String updateOption = request.getParameter("update_option");
            String newValue = request.getParameter("new_value");
            
            borrower Borrower = new borrower();
            int result = Borrower.search_view_borrower(Integer.parseInt(borrowerID));
            
            if (result == 1) {
                int updateResult = Borrower.updateBorrowerField(updateOption, newValue);
                
                if (updateResult == 1) {
                    Borrower.search_view_borrower(Integer.parseInt(borrowerID));
        %>
                    <h2>Update Successful</h2>
                    <p>Borrower ID: <%=Borrower.borrower_id%></p>
                    <p>First Name: <%=Borrower.first_name%></p>
                    <p>Last Name: <%=Borrower.last_name%></p>
                    <p>Email: <%=Borrower.email%></p>
                    <p>Mobile Number: <%=Borrower.mobile_no%></p>
                    <p>Type of User: <%=Borrower.type_of_user%></p>
                    <p>Quantity Borrowed: <%=Borrower.quanti_borrowed%></p>
                    <p>Quantity Returned: <%=Borrower.quanti_returned%></p>
                    <p>Quantity Lost/Damaged: <%=Borrower.quanti_lost_damage%></p>
        <%
                } else {
        %>
                    <h2>Error Updating Borrower Information</h2>
        <%
                }
            } else {
        %>
                <h2>Borrower Not Found</h2>
        <%
            }
        %>
        <br>
        <a href="updateborrower.html">Back to Update Borrower</a>
    </center>
    </body>
</html>
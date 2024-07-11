<%-- 
    Document   : search_view_processing
    Created on : 11 20, 23, 12:02:13 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowermanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search and View Borrower Data Result</title>
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
            // Get the borrower ID from the form
            int borrowerID = Integer.parseInt(request.getParameter("borrowerID"));

            // Create a new borrower object
            borrower borrowerObject = new borrower();

            // Search and view the borrower data
            int result = borrowerObject.search_view_borrower(borrowerID);

            // Check if the search was successful
            if (result == 1) {
        %>
            <h2>Borrower Data</h2>
            <table border="1">
                <tr>
                    <th>Borrower ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Type of User</th>
                    <th>Quantity Borrowed</th>
                    <th>Quantity Returned</th>
                    <th>Quantity Lost/Damaged</th>
                </tr>
                <tr>
                    <td><%= borrowerObject.borrower_id %></td>
                    <td><%= borrowerObject.first_name %></td>
                    <td><%= borrowerObject.last_name %></td>
                    <td><%= borrowerObject.email %></td>
                    <td><%= borrowerObject.mobile_no %></td>
                    <td><%= borrowerObject.type_of_user %></td>
                    <td><%= borrowerObject.quanti_borrowed %></td>
                    <td><%= borrowerObject.quanti_returned %></td>
                    <td><%= borrowerObject.quanti_lost_damage %></td>
                </tr>
            </table>
        <%
            } else {
        %>
            <h2>Borrower not found!</h2>
            <p><%= borrowerID %></p>
            <p><%= result %></p>
            
            <p><%= borrowerObject.borrower_id %></p>
            <p><%= borrowerObject.first_name %></p>
            <p><%= borrowerObject.last_name %></p>
            <p><%= borrowerObject.email %></p>
            <p><%= borrowerObject.mobile_no %></p>
            <p><%= borrowerObject.type_of_user %></p>
            <p><%= borrowerObject.quanti_borrowed %></p>
            <p><%= borrowerObject.quanti_returned %></p>
            <p><%= borrowerObject.quanti_lost_damage %></p>
        <%
            }
        %>
        
        <br><br><br>
        <a href="search_view.html">Back to Borrower Search</a>
    </center>
    </body>
</html>
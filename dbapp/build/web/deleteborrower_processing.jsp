<%-- 
    Document   : deleteborrower_processing
    Created on : 11 20, 23, 3:27:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowermanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Borrower</title>
        
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
            String borrowerIDToDelete = request.getParameter("borrower_id");
            if (borrowerIDToDelete != null && !borrowerIDToDelete.isEmpty()) {
                try {
                    int borrowerID = Integer.parseInt(borrowerIDToDelete);

                    borrower borrowerManagement = new borrower();

                    int deleteResult = borrowerManagement.deleteBorrower(borrowerID);

                    if (deleteResult == 1) {
        %>
                        <h3>Borrower with ID <%= borrowerID %> successfully deleted.</h3>
        <%
                    } else if (deleteResult == 0) {
        %>
                        <h3>Borrower not found. Please check the borrower ID.</h3>
        <%
                    } else {
        %>
                        <h3>Error deleting borrower. Please try again.</h3>
        <%
                    }
                } catch (NumberFormatException e) {
        %>
                    <h3>Error parsing borrower ID. Please enter a valid numeric ID.</h3>
        <%
                }
            } else {
        %>
                <h3>Please enter a valid borrower ID.</h3>
        <%
            }
        %>

        <br>
        <a href="deleteborrower.html">Back to Delete Borrower</a>
    </center>
    </body>
</html>
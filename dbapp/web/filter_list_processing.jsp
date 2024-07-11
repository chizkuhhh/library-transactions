<%-- 
    Document   : filter_list_processing
    Created on : 11 20, 23, 1:25:03 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowermanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and List Borrowers Data Result</title>
        
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
            String borrowerId = request.getParameter("borrower_id");
            String dataType = request.getParameter("data_type");

            // Perform data retrieval based on the chosen data type
            String result = "";
            borrower borrowerInstance = new borrower(); 

            switch (dataType) {
                case "quanti_borrowed":
                    result = "Quantity Borrowed: " + borrowerInstance.getQuantityBorrowed(borrowerId);
                    break;
                case "quanti_returned":
                    result = "Quantity Returned: " + borrowerInstance.getQuantityReturned(borrowerId);
                    break;
                case "quanti_lost_damage":
                    result = "Quantity Lost/Damaged: " + borrowerInstance.getQuantityLostDamaged(borrowerId);
                    break;
                default:
                    result = "Invalid data type selected";
            }
        %>

        <h2>Filter and List Borrowers Data Result</h2>
        <p>Borrower ID: <%= borrowerId %></p>
        <p>Data Type: <%= dataType %></p>
        <p><%= result %></p>

        <a href="filter_list.html">Back to Filter and List Borrowers Data</a>
    </center>
    </body>
</html>
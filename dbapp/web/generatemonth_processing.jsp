<%-- 
    Document   : generatemonth_processing
    Created on : 11 20, 23, 11:14:36 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowreportmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Monthly Borrowing Activity</title>
        
        <style>
            body {
                padding: 5vw;
                margin: 0;
            }
            
            th {
                padding: 10px;
            }
            
            td {
                padding: 10px;
            }
            
            .btn {
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px;
                width: 16vw;
                margin-top: 50px;
            }

            .btn:hover {
                background-color: lavender;
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px
            }
        </style>
    </head>
    <body>
        <%
            String month = request.getParameter("month");

            // Create an instance of MYBorrowReport
            MYBorrowReport report = new MYBorrowReport();

            // Generate monthly report
            int result = report.generateMonthlyReport(month);

            if (result == 1) {
        %>
            <h1>Monthly Borrowing Activity Report</h1>
            <table border="1">
                <tr>
                    <th>Transaction ID</th>
                    <th>Book ID</th>
                    <th>Borrowed by</th>
                    <th>Checkout Date</th>
                    <th>Return Date</th>
                    <th>Authorizing Officer</th>
                </tr>
                <%
                    for (int i = 0; i < report.transaction_idList.size(); i++) {
                        // get details using id
                %>
                <tr>
                    <td><%= report.transaction_idList.get(i)%></td>
                    <td><%= report.book_idList.get(i) %></td>
                    <td><%= report.borrower_idList.get(i) %></td>
                    <td><%= report.checkout_dateList.get(i) %></td>
                    <td><%= report.return_dateList.get(i) %></td>
                    <td><%= report.statusList.get(i) %></td>
                    <td><%= report.authorizing_staffList.get(i) %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            } else if (result == 0) {
        %>
            <h1>Borrower Not Found</h1>
        <%
            } else {
        %>
            <h1>Error Occurred</h1>
            <p><%= result %></p>
            <p><%= month %></p>
        <%
            }
        %>
        <br>
        <a href="borrow_report.html">Back to Report Options</a>
    </body>
</html>
<%-- 
    Document   : generateyear_processing
    Created on : 11 21, 23, 1:05:40 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowreportmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Yearly Borrowing Activity</title>
    </head>
    <body>
        <% 
            String year = request.getParameter("year");

            MYBorrowReport report = new MYBorrowReport();
            int result = report.generateYearlyReport(year);

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
                out.println("<h1>Borrower not found for the specified ID and year</h1>");
            } else {
                out.println("<h1>Error occurred while processing the report</h1>");
            }
        %>
        <br>
        <a href="borrow_report.html">Back to Report Options</a>
    </body>
</html>
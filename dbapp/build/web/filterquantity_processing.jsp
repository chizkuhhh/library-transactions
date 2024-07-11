<%-- 
    Document   : filterquantity_processing
    Created on : 11 21, 23, 1:15:02 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, borrowreportmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Filtered Report</title>
    </head>
    <body>
       <%
            String reportType = request.getParameter("reportType");
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            String filterType = request.getParameter("filterType");

            MYBorrowReport report = new MYBorrowReport();

            if (reportType.equals("monthly")) {
                int result = report.generateMonthlyReport(0, month); // Use 0 as borrowerID to get total for all borrowers

                if (result == 1) {
                    out.println("<h1>Monthly Report Generated Successfully</h1>");
                } else if (result == 0) {
                    out.println("<h1>No Data Found for the Monthly Report</h1>");
                } else {
                    out.println("<h1>Error Occurred while Generating Monthly Report</h1>");
                }
            } else if (reportType.equals("yearly")) {
                int result = report.generateYearlyReport(0, year);

                if (result == 1) {
                    out.println("<h1>Yearly Report Generated Successfully</h1>");
                } else if (result == 0) {
                    out.println("<h1>No Data Found for the Yearly Report</h1>");
                } else {
                    out.println("<h1>Error Occurred while Generating Yearly Report</h1>");
                }
            } else {
                int result = report.filterQuantity(filterType, year, month);

                if (result == 1) {
                    out.println("<h1>Filtered Report Generated Successfully</h1>");
                } else if (result == 0) {
                    out.println("<h1>No Data Found for the Filtered Report</h1>");
                } else {
                    out.println("<h1>Error Occurred while Generating Filtered Report</h1>");
                }
            }
        %>
        <br>
        <a href="borrow_report.html">Back to Report Options</a>
    </body>
</html>
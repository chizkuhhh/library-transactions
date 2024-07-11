<%-- 
    Document   : incident_summary_proc
    Created on : 11 21, 23, 4:26:39 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and List Transactions</title>
        
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
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
        <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
        <center>
            <h2>Incident Summary Report</h2>
            <%
                String category = request.getParameter("category");
                
                if (category.equals("lost")) {
                    %>
                    <h4>Lost</h4>
                    <% 
                } else {
                    %>
                    <h4>Damaged</h4>
                    <% 
                }
            %>

            <table border = "1">
                <tr>
                    <th>Incident ID</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Book ID</th>
                    <th>Incident Type</th>
                </tr>
                <%
                    L.transaction_idList = L.generate_report(category);
                    %>
                        <h4><%=L.transaction_idList.size()%> results retrieved</h4>
                    <%
                    for (int i = 0; i <  L.transaction_idList.size(); i++) {
                    L.get_incident(L.transaction_idList.get(i));
                %>
                <tr>
                    <td><%= L.transaction_idList.get(i) %></td>
                    <td><%= L.incident_date %></td>
                    <td><%= L.desc %></td>
                    <td><%= L.inc_book %></td>
                    <td><%= L.type %></td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <a href="incident_summary.jsp">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Generate Another Report</i>
                </button>
            </a>
        </center>
    </body>
</html>

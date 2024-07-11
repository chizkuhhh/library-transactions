<%-- 
    Document   : return_selected
    Created on : 11 19, 23, 5:01:12 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return a Book</title>
        
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
            <h2>Select Book to Return</h2>
            <%
                String borrower_id_filter = request.getParameter("borrower_id_drop");
            %>

            <table border = "1">
                <tr>
                    <th>Transaction ID</th>
                    <th>Book Title</th>
                    <th>Author</th>
                    <th>Borrowed by</th>
                    <th>Checkout Date</th>
                    <th>Return Date</th>
                    <th>View</th>
                </tr>
                <%
                    L.transaction_idList = L.get_approved(Integer.parseInt(borrower_id_filter));
                    %>
                        <h4><%=L.transaction_idList.size()%> results retrieved</h4>
                    <%
                    for (int i = 0; i <  L.transaction_idList.size(); i++) {
                    L.get_transaction_details(L.transaction_idList.get(i));
                %>
                <tr>
                    <td><%= L.transaction_idList.get(i) %></td>
                    <td><%= L.get_title(L.book_id) %></td>
                    <td><%= L.get_author(L.book_id) %></td>
                    <td><%= L.get_first_name(L.borrower_id, "borrowers", "borrower") + " " + L.get_last_name(L.borrower_id, "borrowers", "borrower") %></td>
                    <td><%= L.checkout_date %></td>
                    <td><%= L.return_date %></td>
                    <td style="text-align: center;">
                        <form action="return_proc.jsp">
                            <input type="search" id="transaction_id_return" name="transaction_id_return" value="<%= L.transaction_idList.get(i) %>" style="display: none;">
                            <input type="submit" value="Return Book">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <a href="return.jsp">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Borrower Select</i>
                </button>
            </a>
        </center>
    </body>
</html>

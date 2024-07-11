<%-- 
    Document   : view_all_trans
    Created on : 11 14, 23, 6:21:57 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Transactions</title>
        
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
            <h2>View All Transactions</h2>
            <%
                ArrayList<Integer> trans_id_list = L.get_id_list("transaction_id");
            %>
            <h4><%=trans_id_list.size()%> results retrieved</h4>
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
                    for (int id : trans_id_list) {
                        // get details using id
                        L.get_transaction_details(id);
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= L.get_title(L.book_id) %></td>
                    <td><%= L.get_author(L.book_id) %></td>
                    <td><%= L.get_first_name(L.borrower_id, "borrowers", "borrower") + " " + L.get_last_name(L.borrower_id, "borrowers", "borrower") %></td>
                    <td><%= L.checkout_date %></td>
                    <td><%= L.return_date %></td>
                    <td>
                        <form action="search.jsp">
                            <input type="search" id="transaction_id_search" name="transaction_id_search" value="<%= id %>" style="display: none;">
                            <input type="submit" value="View Details">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <a href="library_transactions.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Library Transactions</i>
                    </button>
            </a>
        </center>
    </body>
</html>

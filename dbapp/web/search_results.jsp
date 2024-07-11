<%-- 
    Document   : search_results
    Created on : 11 15, 23, 2:21:41 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and View Transaction</title>
        
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
        <center>
            <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
            <%
                String search_type = request.getParameter("search_type");
                String search_val = request.getParameter("search");

                ArrayList<Integer> results = new ArrayList<>();
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
                        if (search_type.equals("trans_id")) {
                            results.add(Integer.parseInt(search_val));
                        } else if (search_type.equals("title")) {
                            results.addAll(L.get_filtered_book(search_val, "title"));
                        } else if (search_type.equals("author")) {
                            results.addAll(L.get_filtered_book(search_val, "author"));
                        } else if (search_type.equals("borrower")) {
                            results.addAll(L.get_filtered_useName(search_val, "borrowers", "borrower_id", "borrower"));
                        } else if (search_type.equals("staff")) {
                            results.addAll(L.get_filtered_useName(search_val, "staff", "authorizing_staff", "staff"));
                        }
                    %>
                        <h4><%=results.size()%> results retrieved</h4>
                        <%
                            for (int i = 0; i <  results.size(); i++) {
                            L.get_transaction_details(results.get(i));
                        %>
                    <tr>
                        <td><%= results.get(i) %></td>
                        <td><%= L.get_title(L.book_id) %></td>
                        <td><%= L.get_author(L.book_id) %></td>
                        <td><%= L.get_first_name(L.borrower_id, "borrowers", "borrower") + " " + L.get_last_name(L.borrower_id, "borrowers", "borrower") %></td>
                        <td><%= L.checkout_date %></td>
                        <td><%= L.return_date %></td>
                        <td>
                            <form action="search.jsp">
                                <input type="search" id="transaction_id_search" name="transaction_id_search" value="<%= results.get(i) %>" style="display: none;">
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

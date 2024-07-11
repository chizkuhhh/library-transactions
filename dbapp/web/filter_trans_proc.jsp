<%-- 
    Document   : filter_trans_proc
    Created on : 11 15, 23, 8:52:10 AM
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
            <h2>Filter and List Transactions</h2>
            <%
                String book_id_filter = request.getParameter("book_id_drop");
                String title_filter = request.getParameter("title_drop");
                String author_filter = request.getParameter("author_drop");
                String borrower_id_filter = request.getParameter("borrower_id_drop");
                String borrower_name_filter = request.getParameter("borrower_name_drop");
                String staff_filter = request.getParameter("staff_drop");

                ArrayList<Integer> book_id_trans = new ArrayList<>();
                ArrayList<Integer> title_trans = new ArrayList<>();
                ArrayList<Integer> author_trans = new ArrayList<>();
                ArrayList<Integer> borrower_id_trans = new ArrayList<>();
                ArrayList<Integer> borrower_trans = new ArrayList<>();
                ArrayList<Integer> staff_trans = new ArrayList<>();
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
                    L.transaction_idList = L.filter_list(Integer.parseInt(book_id_filter), title_filter, author_filter, Integer.parseInt(borrower_id_filter), borrower_name_filter, staff_filter);
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
                        <form action="search.jsp">
                            <input type="search" id="transaction_id_search" name="transaction_id_search" value="<%= L.transaction_idList.get(i) %>" style="display: none;">
                            <input type="submit" value="View Details">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <a href="filter_trans.jsp">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Filters</i>
                </button>
            </a>
        </center>
    </body>
</html>

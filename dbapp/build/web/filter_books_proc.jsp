<%-- 
    Document   : filter_books_proc
    Created on : 11 20, 23, 3:42:15 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and List Books</title>
        
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
        <jsp:useBean id="B" class="book_management.book" scope="session" />
        <center>
            <h2>Filter and List Books</h2>
            <%
                String author_filter = request.getParameter("author_drop");
                String section_filter = request.getParameter("section_drop");
                
                String[] availOnlineValues = request.getParameterValues("avail_online");
                String[] availOfflineValues = request.getParameterValues("avail_offline");

                // Check if the arrays are not null and contain values
                boolean isAvailableOnline = availOnlineValues != null && availOnlineValues.length > 0;
                boolean isAvailableOffline = availOfflineValues != null && availOfflineValues.length > 0;
            %>

            <table border = "1">
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Section</th>
                    <th>Available Online</th>
                    <th>Available Offline</th>
                    <th>View Details</th>
                </tr>
                <%
                    B.book_idList = B.filter_list(author_filter, section_filter, isAvailableOnline, isAvailableOffline);
                    %>
                        <h4><%=B.book_idList.size()%> results retrieved</h4>
                    <%
                    for (int i = 0; i <  B.book_idList.size(); i++) {
                    B.get_book(B.book_idList.get(i));
                %>
                <tr>
                    <td><%= B.book_idList.get(i) %></td>
                    <td><%= B.title %></td>
                    <td><%= B.author %></td>
                    <td><%= B.isbn %></td>
                    <td><%= B.section %></td>
                    <td><%= B.is_available_online %></td>
                    <td><%= B.is_available_offline %></td>
                    <td>
                        <form action="view_del_book.jsp">
                            <input type="search" id="book_id_search" name="book_id_search" value="<%= B.book_idList.get(i) %>" style="display: none;">
                            <input type="submit" value="View Details">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            
            <a href="filter_books.jsp">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Filters</i>
                </button>
            </a>
        </center>
    </body>
</html>

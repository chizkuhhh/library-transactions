<%-- 
    Document   : delete_book
    Created on : 11 20, 23, 4:08:51 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Book</title>
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
            <h2>Select Book to Delete</h2>
            <%
                ArrayList<Integer> book_id_list = B.get_ids();
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
                    <th>Delete</th>
                </tr>
                <%
                    for (int id : book_id_list) {
                        // get details using id
                        B.get_book(id);
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= B.title %></td>
                    <td><%= B.author %></td>
                    <td><%= B.isbn %></td>
                    <td><%= B.section %></td>
                    <td><%= B.is_available_online %></td>
                    <td><%= B.is_available_offline %></td>
                    <td>
                        <form action="view_del_book.jsp">
                            <input type="search" id="book_id_search" name="book_id_search" value="<%= B.book_id %>" style="display: none;">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
           
            <a href="book_management.html">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Book Management</i>
                </button>
            </a>
        </center>
    </body>
</html>

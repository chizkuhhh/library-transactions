<%-- 
    Document   : search_book_results
    Created on : 11 20, 23, 10:49:03 AM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and View a Book</title>
        
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
            <jsp:useBean id="B" class="book_management.book" scope="session" />
            <%
                String search_type = request.getParameter("search_type");
                String search_val = request.getParameter("search");

                ArrayList<Integer> results = new ArrayList<>();
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
                        if (search_type.equals("book_id")) {
                            results.add(Integer.parseInt(search_val));
                        } else if (search_type.equals("title")) {
                            results.addAll(B.viewFilterRecordbytitle(search_val));
                        } else if (search_type.equals("author")) {
                            results.addAll(B.viewFilterRecordbyauthor(search_val));
                        } else if (search_type.equals("isbn")) {
                            results.addAll(B.get_filtered_ISBN(Long.parseLong(search_val)));
                        } else if (search_type.equals("section")) {
                            results.addAll(B.get_filtered_Section(search_val));
                        }
                    %>
                        <h4><%=results.size()%> results retrieved</h4>
                        <%
                            for (int i = 0; i <  results.size(); i++) {
                            B.get_book(results.get(i));
                        %>
                    <tr>
                        <td><%= results.get(i) %></td>
                        <td><%= B.title %></td>
                        <td><%= B.author %></td>
                        <td><%= B.isbn %></td>
                        <td><%= B.section %></td>
                        <td><%= B.is_available_online %></td>
                        <td><%= B.is_available_offline %></td>
                        <td>
                            <form action="view_del_book.jsp">
                                <input type="search" id="book_id_search" name="book_id_search" value="<%= results.get(i) %>" style="display: none;">
                                <input type="submit" value="View Details">
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
            </table>

            <a href="search_book.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Search</i>
                    </button>
            </a>
        </center>
    </body>
</html>

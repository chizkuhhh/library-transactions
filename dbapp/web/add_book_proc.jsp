<%-- 
    Document   : add_book_proc
    Created on : 11 20, 23, 9:03:23 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book</title>
        
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            body {
                padding: 10vw; 
                margin: 0; 
            }
            
            .btn {
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px;
                width: 20vw;
            }
            
            .btn:hover {
                background-color: lavender;
                border-radius: 5px;
            }
            
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="B" class="book_management.book" scope="session" />
        <%
            String var_title = request.getParameter("title");
            String var_author = request.getParameter("author");
            
            String var_isbn = request.getParameter("isbn");
            String var_section = request.getParameter("section");
            String var_avail_online = request.getParameter("avail_online");
            String var_avail_offline = request.getParameter("avail_offline");
            
            B.title = request.getParameter("title");
            B.author = request.getParameter("author");
            B.isbn = Long.parseLong(request.getParameter("isbn"));
            B.section = request.getParameter("section");
            
            
            String[] availOnlineValues = request.getParameterValues("avail_online");
            String[] availOfflineValues = request.getParameterValues("avail_offline");

            // Check if the arrays are not null and contain values
            boolean isAvailableOnline = availOnlineValues != null && availOnlineValues.length > 0;
            boolean isAvailableOffline = availOfflineValues != null && availOfflineValues.length > 0;

            // Set values in the bean
            B.is_available_online = isAvailableOnline;
            B.is_available_offline = isAvailableOffline;
            
            int addStatus = B.addBook(); 
            
            if (addStatus == 1) {
            %>
            <center>
                <h1>Book Successfully Added!</h1>
                <a href="add_book.html">
                    <button class="btn">
                        <i class="fa fa-plus">     Add Another Book</i>
                    </button>
                </a><br><br>
                    
                <a href="book_management.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Book Management Page</i>
                    </button>
                </a>
            </center>
            <%
            } else {
            %>
            <center>
                <h1>Failed to store Transaction Details!</h1>

                <h2>Acquired Information:</h2>
                <p>Book ID: <%= B.book_id %></p>
                <p>Title: <%= B.title %></p>
                <p>Author: <%= B.author %></p>
                <p>ISBN: <%= B.isbn %></p>
                <p>Section: <%= B.section %></p>
                <p>Avail Online: <%= B.is_available_online %></p>
                <p>Avail Offline: <%= B.is_available_offline %></p>
                
                <p>Error: <%= B.msg %></p>
            </center>
            <%
            }
        %>
    </body>
</html>

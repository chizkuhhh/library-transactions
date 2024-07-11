<%-- 
    Document   : mod_book_proc
    Created on : 11 20, 23, 10:31:08 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Details</title>
        
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
    <center>
        <%
            String var_id = request.getParameter("book_id");
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
            
            int updStatus = B.modRecord(Integer.parseInt(var_id));
            
            if (updStatus == 1) {
            %>
            <h1>Book Record Successfully Updated!</h1><br><br>
                <a href="mod_book.jsp">
                    <button class="btn">
                        <i class="fa fa-pencil">     Modify Another Book Record</i>
                    </button>
                </a><br><br>
                    
                <a href="book_management.html">
                    <button class="btn">
                        <i class="fa fa-home">     Return to Book Management</i>
                    </button>
                </a>
            <%
            } else {
            %>
                <h1>Failed to store Transaction Details!</h1>

                <h2>Acquired Information:</h2>
                    <p>Book ID: <%= B.book_id %></p>
                <p>Title: <%= B.title %></p>
                <p>Author: <%= B.author %></p>
                <p>ISBN: <%= B.isbn %></p>
                <p>Section: <%= B.section %></p>
                <p>Avail Online: <%= B.is_available_online %></p>
                <p>Avail Offline: <%= B.is_available_offline %></p>
            <%
            }
        %>
    </center>
    </body>
</html>

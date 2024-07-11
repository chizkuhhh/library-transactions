<%-- 
    Document   : delete_book_proc
    Created on : 11 20, 23, 7:12:58 PM
    Author     : ccslearner
--%>

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
            String var_id = request.getParameter("book_id");
            
            int delStatus = B.delRecord(Integer.parseInt(var_id)); 
            
            if (delStatus == 1) {
            %>
            <center>
                <h1>Book Successfully Deleted!</h1>
                <a href="delete_book.html">
                    <button class="btn">
                        <i class="fa fa-plus">     Delete Another Book</i>
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

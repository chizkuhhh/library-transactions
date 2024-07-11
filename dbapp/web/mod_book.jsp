<%-- 
    Document   : mod_book
    Created on : 11 20, 23, 9:48:13 AM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Transaction</title>
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            body {
                padding: 5vw;
                margin: 0;
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
            <form action="mod_book_selected.jsp">
                <jsp:useBean id="B" class="book_management.book" scope="session" />
                <h2>Select Book to Modify</h2>
                <select id="book_id_drop" name="book_id_drop">
                    <%
                        ArrayList<Integer> book_id_list = B.get_ids();

                        for (int id : book_id_list) {
                            %>
                            <option value="<%= id%>"><%= id %></option>
                            <%
                        }
                    %>
                </select>
                <input type="submit" value="Modify">
            </form>
                
            <a href="book_management.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Book Management</i>
                    </button>
            </a>
        </center>
    </body>
</html>

<%-- 
    Document   : filter_books
    Created on : 11 20, 23, 3:15:43 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
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
            
            .container {
                width: 80%;
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .filters {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .filter {
                width: 100%;
                max-width: 400px; /* Adjust max-width as needed */
                margin-bottom: 10px;
            }

            select {
                width: 100%;
                box-sizing: border-box;
                font-size: 1rem;
                padding: 5px;
            }

            input[type="submit"],
            input[type="reset"] {
                display: inline;
                width: 49%;
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: lavender; /* Change the background color on hover */
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px;
            }
            
            h2 {
                text-align: center;
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
        <div class="container">
            <form action="filter_books_proc.jsp" method="post">
                <jsp:useBean id="B" class="book_management.book" scope="session" />
                <h2>Filters</h2>
                <br>
                <div class="filters">
                    <div class="filter">
                        Author: 
                        <select id="author_drop" name="author_drop">
                            <option value="">Select Author</option>
                            <%
                                ArrayList<String> author_list= new ArrayList<>();
                                author_list = B.get_dist_string("author");
                                
                                for (String author : author_list) {
                                    %>
                                    <option value="<%= author%>"><%= author %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>
                    
                    <div class="filter">
                            Section: 
                        <select id="section_drop" name="section_drop">
                            <option value="">Select Section</option>
                            <%
                                ArrayList<String> section_list= new ArrayList<>();
                                section_list = B.get_dist_string("section");
                                
                                for (String section : section_list) {
                                    %>
                                    <option value="<%= section%>"><%= section %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>
                        
                    <div class="filter">
                        <input type="checkbox" id="avail_online" name="avail_online"> Available Online<br>
                        <input type="checkbox" id="avail_offline" name="avail_offline"> Available Offline<br>
                    </div>
                </div>
                <br>
                <input type="submit" value="Confirm" onclick="setCheckboxValues()">
                <input type="reset" value="Reset Filters">
            </form>
                        
            <br><br><br>            
            <a href="book_management.html">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Book Management</i>
                </button>
            </a>
        </div>
                        
        <script>
            function setCheckboxValues() {
                var availOnlineCheckbox = document.getElementById('avail_online');
                var availOfflineCheckbox = document.getElementById('avail_offline');

                // Assign true if checked, false otherwise
                availOnlineCheckbox.value = availOnlineCheckbox.checked;
                availOfflineCheckbox.value = availOfflineCheckbox.checked;
            }
        </script>
    </body>
</html>

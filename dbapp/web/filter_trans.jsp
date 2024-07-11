<%-- 
    Document   : filter_trans
    Created on : 11 14, 23, 9:50:27 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and List Transaction</title>
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
            <form action="filter_trans_proc.jsp" method="post">
                <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
                <h2>Filters</h2>
                <br>
                <div class="filters">
                    <div class="filter">
                        Book ID: 
                        <select id="book_id_drop" name="book_id_drop">
                            <option value="0000">Select Book ID</option>
                            <%
                                ArrayList<Integer> book_id_list = L.get_id_list("book_id");

                                for (int id : book_id_list) {
                                    %>
                                    <option value="<%= id%>"><%= id %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>
                        
                    <div class="filter">
                        Book Title: 
                        <select id="title_drop" name="title_drop">
                            <option value="">Select Book Title</option>
                            <%
                                    for (int id : book_id_list) {
                                    %>
                                    <option value="<%= L.get_title(id)%>"><%= L.get_title(id) %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>
                    
                    <div class="filter">
                        Book Author: 
                        <select id="author_drop" name="author_drop">
                            <option value="">Select Book Author</option>
                            <%
                                    for (int id : book_id_list) {
                                    %>
                                    <option value="<%= L.get_author(id)%>"><%= L.get_author(id) %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>

                    <div class="filter">
                        Borrower ID: 
                        <select id="borrower_id_drop" name="borrower_id_drop">
                            <option value="000000">Select Borrower ID</option>
                            <%
                                ArrayList<Integer> borrower_id_list = L.get_id_list("borrower_id");

                                for (int id : borrower_id_list) {
                                    %>
                                    <option value="<%= id%>"><%= id %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>

                    <div class="filter">
                        Borrower Name: 
                        <select id="borrower_name_drop" name="borrower_name_drop">
                            <option value="">Select Borrower Name</option>
                            <%
                                for (int id : borrower_id_list) {
                                    %>
                                    <option value="<%= L.get_first_name(id, "borrowers", "borrower") + " " + L.get_last_name(id, "borrowers", "borrower")%>"><%= L.get_first_name(id, "borrowers", "borrower") + " " + L.get_last_name(id, "borrowers", "borrower") %></option>
                                    <%
                                }
                            %>
                        </select><br><br>
                    </div>

                    <div class="filter">
                        Authorizing Staff: 
                        <select id="staff_drop" name="staff_drop">
                            <option value="">Select Authorizing Staff</option>
                            <%
                                ArrayList<Integer> staff_id_list = L.get_id_list("authorizing_staff");

                                for (int id : staff_id_list) {
                                    %>
                                    <option value="<%= L.get_first_name(id, "staff", "staff") + " " + L.get_last_name(id, "staff", "staff")%>"><%= L.get_first_name(id, "staff", "staff") + " " + L.get_last_name(id, "staff", "staff") %></option>
                                    <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <br>
                <input type="submit" value="Confirm">
                <input type="reset" value="Reset Filters">
            </form>
                        
            <br><br><br>            
            <a href="library_transactions.html">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Library Transactions</i>
                </button>
            </a>
        </div>
    </body>
</html>

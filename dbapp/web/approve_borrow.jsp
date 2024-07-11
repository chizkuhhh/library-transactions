<%-- 
    Document   : approve_borrow
    Created on : 11 19, 23, 8:48:03 AM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve a Borrow Request</title>
        <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            body {
                padding: 5vw;
                margin: 0;
            }

            .form-container {
                width: 80%; /* Adjust the maximum width as needed */
                padding: 2%;
                margin: 0 auto; /* Center the form container */
                border: 1px solid #ddd;
            }

            form {
                width: 100%; 
                padding: 10px;
                box-sizing: border-box; /* Include padding and border in the total width/height */
            }

            .input-container {
                display: inline-block;
                width: calc(30% - 20px); /* Calculate width considering margins and padding */
                margin-right: 2%; /* Adjust margin as needed */
                padding: 8px;
                box-sizing: border-box;
            }

            .input-container2 {
                display: inline-block;
                width: 100%; /* Calculate width considering margins and padding */
                margin-right: 2%; /* Adjust margin as needed */
                padding: 8px;
                box-sizing: border-box;
            }

            form h3 {
                margin-bottom: 10px; /* Add some space between the heading and inputs */
            }

            #submit-btn {
                display: block; /* Ensure the button takes up the full width */
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                border-radius: 5px;
            }

            #submit-btn:hover {
                background-color: lavender; /* Change the background color on hover */
            }
        
            .btn {
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px;
                width: 16vw;
                margin-top: 20px;
            }
            
            .btn:hover {
                background-color: lavender;
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px
            }
            
            a {
                text-decoration: none;
            }
            
            table {
                width: 95%;
            }
            
            td {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
        <%-- 
            First Name, Last Name, Borrower ID
            Book Title & Author (from dropdown)
            record current date @ staff acccount
            show "ur transaction is pending approval"
        --%>
        <center>
            <h2>Approve a Borrow Request</h2>
        </center>

        <div class="form-container">
            <form action="approve_proc.jsp">
                <h3>Staff Details</h3>
                <div class="input-container">
                    First Name: <input type="text" id="sfirst_name" name="sfirst_name" placeholder="John" required>
                </div>
                <div class="input-container">
                    Last Name: <input type="text" id="slast_name" name="slast_name" placeholder="Doe" required>
                </div>
                <div class="input-container">
                    Staff ID: <input type="number" id="staff_id" name="staff_id" placeholder="000000" required> 
                </div> 
                
                <br><br><br>
                <h3>Select Borrow Request to Approve</h3>
            
            <center>
                <table border = "1">
                    <tr>
                        <th>Transaction ID</th>
                        <th>Book Title</th>
                        <th>Author</th>
                        <th>Borrowed by</th>
                        <th>Checkout Date</th>
                        <th>Approve</th>
                    </tr>
                    <%
                        L.transaction_idList = L.get_pending();

                        for (int i = 0; i <  L.transaction_idList.size(); i++) {
                        L.get_transaction_details(L.transaction_idList.get(i));
                    %>
                    <tr>
                        <td><%= L.transaction_idList.get(i) %></td>
                        <td><%= L.get_title(L.book_id) %></td>
                        <td><%= L.get_author(L.book_id) %></td>
                        <td><%= L.get_first_name(L.borrower_id, "borrowers", "borrower") + " " + L.get_last_name(L.borrower_id, "borrowers", "borrower") %></td>
                        <td><%= L.checkout_date %></td>
                        <td style="text-align: center;">
                                <input type="search" id="trans_id_approve" name="trans_id_approve" value="<%= L.transaction_idList.get(i) %>" style="display: none;">
                                <button id="submit-btn" type="submit">Approve</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center>
            </form>
        </div>
                        
        <center>
            <a href="staff_view.html">
                <button class="btn">
                    <i class="fa fa-home">     Return to Main Menu</i>
                </button>
            </a>
        </center>
    </body>
</html>

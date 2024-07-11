<%-- 
    Document   : return_proc
    Created on : 11 19, 23, 5:10:39 PM
    Author     : ccslearner
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return a Book</title>
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
        <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
        <%
            String trans_id_select = request.getParameter("transaction_id_return");

            L.get_transaction_details(Integer.parseInt(trans_id_select));
            
            // Get the current date
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();

            // Format the date in the desired format
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            L.return_date = sdf.format(currentDate);
            
            int retStatus = L.return_book(Integer.parseInt(trans_id_select)); // if it's add transaction
            
            if (retStatus == 1) {
            %>
                <h1>Book Successfully Returned!</h1>
                <a href="return_selected.jsp">
                    <button class="btn">
                        <i class="fa fa-plus"><br><br>Return Another Book</i>
                    </button>
                </a>
                    
                <a href="borrower_view.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left"><br><br>Return to Main Menu</i>
                    </button>
                </a>
            <%
            } else {
            %>
                <h1>Failed to store Transaction Details!</h1>

                <h2>Debug Information:</h2>
                <p>Book ID: <%= L.book_id %></p>
                <p>Borrower ID: <%= L.borrower_id %></p>
                <p>Checkout Date: <%= L.checkout_date %></p>
                <p>Return Date: <%= L.return_date %></p>
                <p>Authorizing Staff: <%= L.authorizing_staff %></p>
            <%
            }
        %>
    </body>
</html>

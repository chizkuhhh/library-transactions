<%-- 
    Document   : borrower_details
    Created on : 11 12, 23, 6:40:02 PM
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
        <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
        <%
            String var_title = request.getParameter("title");
            String var_author = request.getParameter("author");
            
            String var_borrower_id = request.getParameter("borrower_id");
            String var_checkout_date = request.getParameter("checkout_date");
            String var_return_date = request.getParameter("return_date");
            String var_status = request.getParameter("status_drop");
            String var_authorizing_staff = request.getParameter("staff_id");
            
            L.book_id = L.find_book_id(var_title, var_author);
            L.borrower_id = Integer.parseInt(var_borrower_id);
            L.checkout_date = var_checkout_date;
            if (L.return_date != null && L.return_date.isEmpty()) {
                L.return_date = null;
            } else {
                L.return_date = var_return_date;
            }
            L.status = var_status;
            L.authorizing_staff = Integer.parseInt(var_authorizing_staff);
            
            int addStatus = L.add_transaction(); // if it's add transaction
            
            if (addStatus == 1) {
            %>
            <center>
                <h1>Transaction Details Successfully Stored!</h1>
                <a href="add_trans.html">
                    <button class="btn">
                        <i class="fa fa-plus">     Add Another Transaction</i>
                    </button>
                </a><br><br>
                    
                <a href="library_transactions.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Library Transactions Page</i>
                    </button>
                </a>
            </center>
            <%
            } else {
            %>
            <center>
                <h1>Failed to store Transaction Details!</h1>

                <h2>Acquired Information:</h2>
                <p>Book ID: <%= L.book_id %></p>
                <p>Borrower ID: <%= L.borrower_id %></p>
                <p>Checkout Date: <%= L.checkout_date %></p>
                <p>Return Date: <%= L.return_date %></p>
                <p>Authorizing Staff: <%= L.authorizing_staff %></p>
            </center>
            <%
            }
        %>
    </body>
</html>

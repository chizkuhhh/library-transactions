<%-- 
    Document   : update_trans_proc
    Created on : 11 14, 23, 9:23:00 AM
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
                width: 15vw;
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
    <center>
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
            L.return_date = var_return_date;
            if (L.return_date.isEmpty()) {
                L.return_date = null;
            } else {
                L.return_date = var_return_date;
            }
            L.status = var_status;
            L.authorizing_staff = Integer.parseInt(var_authorizing_staff);
            
            int updStatus = L.update_transaction(Integer.parseInt(request.getParameter("trans_id")));
            
            if (updStatus == 1) {
            %>
            <h1>Transaction Details Successfully Updated!</h1><br><br>
                <a href="update_trans.html">
                <button class="btn">
                    <i class="fa fa-plus"><br><br>Update Another Transaction</i>
                </button>
                    
                <a href="index.html">
                <button class="btn">
                    <i class="fa fa-home"><br><br>Return to Main Menu</i>
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
    </center>
    </body>
</html>

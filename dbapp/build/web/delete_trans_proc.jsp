<%-- 
    Document   : delete_trans_proc
    Created on : 11 14, 23, 7:50:22 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Transaction</title>
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
        <%
            int delStatus = L.delete_transaction(Integer.parseInt(request.getParameter("trans_id")));
            
            if (delStatus == 1) {
            %>
                <h1>Transaction Details Successfully Deleted!</h1>
                <a href="delete_trans.jsp">
                <button class="btn">
                    <i class="fa fa-plus"><br><br>Delete Another Transaction</i>
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
    </body>
</html>

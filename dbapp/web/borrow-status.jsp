<%-- 
    Document   : borrow-status
    Created on : 11 19, 23, 8:42:46 AM
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
        <title>Borrow a Book</title>
        
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
            String var_title = L.get_title(Integer.parseInt(request.getParameter("book_id_drop")));
            String var_author = L.get_author(Integer.parseInt(request.getParameter("book_id_drop")));
            
            String var_borrower_id = request.getParameter("borrower_id");
            
            // Get the current date
            Calendar calendar = Calendar.getInstance();
            java.util.Date currentDate = calendar.getTime();

            // Format the date in the desired format
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String var_checkout_date = sdf.format(currentDate);
            
            String var_return_date = null;
            String var_status = "pending";
            String var_authorizing_staff = null;
            
            L.book_id = Integer.parseInt(request.getParameter("book_id_drop"));
            L.borrower_id = Integer.parseInt(var_borrower_id);
            L.checkout_date = var_checkout_date;
            
            int addStatus = L.borrow_book(L.book_id); 
            
            if (addStatus == 1) {
            %>
            <center>    
                <h1>Borrow Pending Approval...</h1>
                    <a href="borrow.jsp">
                    <button class="btn">
                        <i class="fa fa-book"><br><br>Borrow Another Book</i>
                    </button>
                    </a><br>

                    <a href="library_transactions.html">
                    <button class="btn">
                        <i class="fa fa-university"><br><br>Return to Library Transactions Page</i>
                    </button>
                    </a>
            </center>
            <%
            } else {
            %>
                <h1>Failed to store Transaction Details!</h1>

                <h2>Debug Information:</h2>
                <p>Transaction ID: <%= L.transaction_id %></p>
                <p>Book ID: <%= L.book_id %></p>
                <p>Borrower ID: <%= L.borrower_id %></p>
                <p>Checkout Date: <%= L.checkout_date %></p>
                <p>Return Date: <%= L.return_date %></p>
                <p>Authorizing Staff: <%= L.authorizing_staff %></p>
                
                <p><%=L.msg%></p>
            <%
            }
        %>
    </body>
</html>

<%-- 
    Document   : update_selected_trans
    Created on : 11 13, 23, 9:42:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Transaction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
            width: calc(48% - 20px); /* Calculate width considering margins and padding */
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
            padding: 15px;
            font-size: 1rem;
            border-radius: 5px;
            margin-top: 50px;
        }
        
        #submit-btn:hover {
            background-color: lavender; /* Change the background color on hover */
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
        String trans_id_select = request.getParameter("transaction_id_drop");
        
        L.get_transaction_details(Integer.parseInt(trans_id_select));
        
    %>
    <center>
        <h2>Update Transaction</h2>
    </center>

    <div class="form-container">
        <form action="update_trans_proc.jsp">
            <div class="input-container">
                Transaction ID: <input type="number" id="trans_id" name="trans_id" value="<%= request.getParameter("transaction_id_drop") %>" readonly>
            </div><br>
            <h3>Borrower Details</h3>
            <div class="input-container">
                First Name: <input type="text" id="bfirst_name" name="bfirst_name" value="<%= L.get_first_name(L.borrower_id, "borrowers", "borrower") %>">
            </div>
            <div class="input-container">
                Last Name: <input type="text" id="blast_name" name="blast_name" value="<%= L.get_last_name(L.borrower_id, "borrowers", "borrower") %>">
            </div>
            <div class="input-container">
                Borrower ID: <input type="number" id="borrower_id" name="borrower_id" value="<%= L.borrower_id %>">
                <!-- Turn into drop down list? -->
            </div>

            <h3>Book Details</h3>
            <div class="input-container2">
                Book Title: <input type="text" id="title" name="title" value="<%= L.get_title(L.book_id) %>">
                <!-- Turn into drop down list -->
            </div>
            <div class="input-container2">
                Author: <input type="text" id="author" name="author" value="<%= L.get_author(L.book_id) %>">
            </div>

            <h3>Transaction Details</h3>
            <div class="input-container">
                Checkout Date: <input type="date" id="checkout_date" name="checkout_date" value="<%= L.checkout_date %>">
            </div>
            <div class="input-container">
                Return Date: <input type="date" id="return_date" name="return_date" value="<%= L.return_date %>">
            </div>
            <div class="input-container">
                <% String statusValue = L.status; %>
                Status: <select id="status_drop" name="status_drop">
                            <option value="" disabled <%= statusValue.isEmpty() ? "selected" : "" %>>Status</option>
                            <option value="returned" <%= statusValue.equals("returned") ? "selected" : "" %>>Returned</option>
                            <option value="late" <%= statusValue.equals("late") ? "selected" : "" %>>Late</option>
                            <option value="pending" <%= statusValue.equals("pending") ? "selected" : "" %>>Pending</option>
                            <option value="approved" <%= statusValue.equals("approved") ? "selected" : "" %>>Approved</option>
                            <option value="lost" <%= statusValue.equals("lost") ? "selected" : "" %>>Lost</option>
                            <option value="damaged" <%= statusValue.equals("damaged") ? "selected" : "" %>>Damaged</option>
                        </select>
            </div>
            
            <h3>Authorizing Staff</h3>
            <div class="input-container">
                First Name: <input type="text" id="s_first_name" name="s_first_name" value="<%= L.get_first_name(L.authorizing_staff, "staff", "staff") %>">
            </div>
            <div class="input-container">
                Last Name: <input type="text" id="s_last_name" name="s_last_name" value="<%= L.get_last_name(L.authorizing_staff, "staff", "staff") %>">
            </div>
            <div class="input-container">
                Staff ID: <input type="number" id="staff_id" name="staff_id" value="<%= L.authorizing_staff %>">
            </div>
        </form>
        
        <button id="submit-btn" type="submit">Update</button>
    </div>
    
    <center>
        <a href="update_trans.jsp">
            <button class="btn">
                <i class="fa fa-arrow-circle-left">     Return to Update Options</i>
            </button>
        </a>
    </center>

    <script>
        // Get the submit button and forms
        var submitButton = document.getElementById('submit-btn');
        var forms = document.querySelectorAll('form');

        // Attach an event listener to the button
        submitButton.addEventListener('click', function() {
            // Loop through each form and submit it
            forms.forEach(function(form) {
                form.submit();
            });
        });
    </script>
</body>
</html>


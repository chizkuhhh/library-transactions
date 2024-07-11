<%-- 
    Document   : borrow
    Created on : 11 18, 23, 4:39:38 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
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
            padding: 15px;
            font-size: 1rem;
            border-radius: 5px;
            margin-top: 50px;
        }
        
        #submit-btn:hover {
            background-color: lavender; /* Change the background color on hover */
        }
        
        body {
                padding: 5vw; 
                margin: 0; 
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
            
            .square-btn:hover {
                background-color: lavender;
                border-radius: 5px;
                font-size: 1rem;
                padding: 10px
            }
            
            .square-btn {
                width: 10vw;
                height: 10vw;
                font-size: 1rem;
                
                padding: 10px;
                margin: 20px;
                border-radius: 5px;
                vertical-align: top;
            }
            
            a {
                text-decoration: none;
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
            <h2>Borrow a Book</h2>
        </center>

        <div class="form-container">
            <form action="borrow-status.jsp">
                <h3>Borrower Details</h3>
                <div class="input-container">
                    First Name: <input type="text" id="bfirst_name" name="bfirst_name" placeholder="John" required>
                </div>
                <div class="input-container">
                    Last Name: <input type="text" id="blast_name" name="blast_name" placeholder="Doe" required>
                </div>
                <div class="input-container">
                    Borrower ID: <input type="number" id="borrower_id" name="borrower_id" placeholder="000000" required>
                </div>

                <h3>Select Book to Borrow</h3>
                <div class="input-container2">
                    <select id="book_id_drop" name="book_id_drop" required>
                            <option value="" disabled selected>Select Book to Borrow</option>
                            <%
                                ArrayList<Integer> book_id_list = L.get_books();

                                for (int id : book_id_list) {
                                    %>
                                    <option value="<%= id%>"><%= L.get_title(id) %> by <%= L.get_author(id) %></option>
                                    <%
                                }
                            %>
                        </select>
                </div>
            </form>

            <button id="submit-btn" type="submit">Borrow Book</button>
        </div>
        
        <center>
            <a href="borrower_view.html">
                <button class="btn">
                    <i class="fa fa-home">     Return to Main Menu</i>
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

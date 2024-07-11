<%-- 
    Document   : incident_summary
    Created on : 11 21, 23, 4:20:30 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Incident Summary Report</title>
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
            <form action="incident_summary_proc.jsp" method="post">
                <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
                <h2>Generate Incident Summary Report</h2>
                <br>
                <div class="filters">
                    <div class="filter">
                        Category: 
                        <select id="category" name="category">
                            <option value="">Select Report Category</option>
                            <option value="lost">Lost</option>
                            <option value="damaged">Damaged</option>
                        </select><br><br>
                    </div>
                        
                </div>
                <br>
                <input type="submit" value="Confirm">
                <input type="reset" value="Reset Filters">
            </form>
                        
            <br><br><br>            
            <a href="staff_view.html">
                <button class="btn">
                    <i class="fa fa-arrow-circle-left">     Return to Main Menu</i>
                </button>
            </a>
        </div>
    </body>
</html>

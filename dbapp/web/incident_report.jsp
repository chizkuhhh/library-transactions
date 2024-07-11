<%-- 
    Document   : incident_report
    Created on : 11 20, 23, 6:28:36 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, incident_management.*, books_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report a Book Incident</title>
        
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
        <h2>Report An Incident</h2>
        <jsp:useBean id="i" class="incident_management.incident" scope="session" />
        <jsp:useBean id="b" class="book_management.book" scope="session" />
        <% i.loadRecord(); %>
        <% b.loadRecord(); %>
        <form action="addincident.jsp" method="POST">
            Select a Book -
               <select name="book"> 
                   <% b.book_idList.clear();
                   b.book_idList.addAll(b.get_ids());
                        for (int j=0; j < b.book_idList.size(); j++) { 
                                b.get_book(b.book_idList.get(j));
                                        %>
                            <option value="<%=b.book_idList.get(j)%>"><%=b.book_idList.get(j) + " - " +b.title + " " + b.author%></option>            
                    <% } %>
                </select><br>

             Select type of incident - 
             <select name ="incident_type">
                 <option value="lost">Lost</option>
                 <option value="damaged">Damaged</option>
             </select>
    	     
              <label for="description">Description:</label>
   	     <input type="text" name="description" placeholder="Description" required>
            <input type="submit" value="Add an incident report" />

        </form>
        <center>
            <a href="borrower_view.html">
                <button class="btn">
                    <i class="fa fa-home">     Return to Main Menu</i>
                </button>
            </a>
        </center>

    </body>
</html>

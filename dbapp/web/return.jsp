<%-- 
    Document   : return
    Created on : 11 19, 23, 4:54:24 PM
    Author     : ccslearner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Transaction</title>
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
        <center>
            <form action="return_selected.jsp">
                <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
                <h2>Select Borrower</h2>
                <select id="borrower_id_drop" name="borrower_id_drop">
                    <%
                        ArrayList<Integer> borrower_id_list = L.get_borrowers();

                        for (int id : borrower_id_list) {
                            %>
                            <option value="<%= id%>"><%= L.get_first_name(id, "borrowers", "borrower") + " " + L.get_last_name(id, "borrowers", "borrower")%></option>
                            <%
                        }
                    %>
                </select>
                <input type="submit" value="Return a Book">
            </form>

                <a href="borrower_view.html">
                    <button class="btn">
                        <i class="fa fa-home">     Return to Main Menu</i>
                    </button>
                </a>
        </center>
    </body>
</html>

<%-- 
    Document   : update_trans
    Created on : 11 13, 23, 8:09:14 PM
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
            <form action="update_selected_trans.jsp">
                <jsp:useBean id="L" class="library_transactions.transaction" scope="session" />
                <h2>Select Transaction to Update</h2>
                <select id="transaction_id_drop" name="transaction_id_drop">
                    <%
                        ArrayList<Integer> trans_id_list = L.get_id_list("transaction_id");

                        for (int id : trans_id_list) {
                            %>
                            <option value="<%= id%>"><%= id %></option>
                            <%
                        }
                    %>
                </select>
                <input type="submit" value="Update">
            </form>
                
            <a href="library_transactions.html">
                    <button class="btn">
                        <i class="fa fa-arrow-circle-left">     Return to Library Transactions</i>
                    </button>
            </a>
        </center>
    </body>
</html>

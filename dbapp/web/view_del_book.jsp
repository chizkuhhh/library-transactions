<%-- 
    Document   : view_del_book
    Created on : 11 20, 23, 4:16:53 PM
    Author     : ccslearner
--%>

<%@page import="java.net.URLDecoder" %>
<%@page import="java.io.UnsupportedEncodingException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
        String referer = request.getHeader("referer");

        if (referer != null) {
            try {
                referer = URLDecoder.decode(referer, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace(); // Handle the exception as needed
            }
        }
    %>
    
    <%
        if (referer.equals("http://localhost:8084/db_app_latest/delete_book.jsp")) {
            %>
            <title>Delete Book</title>
            <%
        } else {
            %>
            <title>View Book</title>
            <%
        }
    %>
    
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
    <jsp:useBean id="B" class="book_management.book" scope="session" />
    <center>
        <%
            if (referer.equals("http://localhost:8084/db_app_latest/delete_book.jsp")) {
                %>
                <h2>Delete Book</h2>
                <%
            } else {
                %>
                <h2>View Book</h2>
                <%
            }
            String book_id_select = request.getParameter("book_id_search");
            B.get_book(Integer.parseInt(book_id_select));
        %>
        
    </center>

    <div class="form-container">
        <form action="delete_book_proc.jsp">
            <div class="input-container">
                Book ID: <input type="number" id="book_id" name="book_id" value="<%= Integer.parseInt(book_id_select) %>" readonly>
            </div><br>
            
            <div class="input-container2">
                Title: <input type="text" id="title" name="title" value="<%= B.title %>" style="width: 80%;" readonly>
                <!-- Turn into drop down list -->
            </div>
            <div class="input-container2">
                Author: <input type="text" id="author" name="author" value="<%= B.author %>" style="width: 80%;" readonly>
            </div>
            
            <br>
                
                <div class="input-container2">
                    ISBN: <input type="number" id="isbn" name="isbn" value="<%= B.isbn %>" style="width: 70%;" readonly>
                </div>
                
                <br><br><br>
            
            <div class="input-container">
                <% String statusValue = B.section; %>
                Status: <select id="section" name="section" disabled>
                            <option value="" disabled <%= statusValue.isEmpty() ? "selected" : "" %>>Section</option>
                            <option value="references" <%= statusValue.equals("references") ? "selected" : "" %>>References</option>
                            <option value="periodicals" <%= statusValue.equals("periodicals") ? "selected" : "" %>>Periodicals</option>
                            <option value="fiction" <%= statusValue.equals("fiction") ? "selected" : "" %>>Fiction</option>
                            <option value="non-fiction" <%= statusValue.equals("non-fiction") ? "selected" : "" %>>Non-fiction</option>
                            <option value="filipiniana" <%= statusValue.equals("filipiniana") ? "selected" : "" %>>Filipiniana</option>
                        </select>
            </div>
            
            <br>

            <div class="input-container2">
                <input type="checkbox" id="avail_online" name="avail_online" <%= B.is_available_online ? "checked" : "" %> readonly>     Available Online
            </div>

            <div class="input-container2">
                <input type="checkbox" id="avail_offline" name="avail_offline" <%= B.is_available_offline ? "checked" : "" %> readonly>     Available Offline
            </div>
            
            <%
                if (referer.equals("http://localhost:8084/db_app_latest/delete_book.jsp")) {
                    %>
                    <button id="submit-btn" type="submit">Delete Book</button>
                    <%
                }
            %>
        </form>
        
        
    </div>
        
    <center>
        <a href="<%= referer%>">
            <button class="btn">
                <i class="fa fa-arrow-circle-left">     Return to Books List</i>
            </button>
        </a>
    </center>
</body>
</html>

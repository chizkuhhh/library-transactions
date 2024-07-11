<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, staff_management.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Report</title>
    
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

    <h2>Library Staff</h2>
        <jsp:useBean id="staff" class="staff_management.staff" scope="session" />
 

        <% staff.loadRecord(); %>
        <form action="searchstaff.jsp" method="POST">
            Select a staff -
    	     <select name="staffs"> 
                    <% for (int i=0; i < staff.staff_idList.size(); i++) { 
                                        %>
                            <option value="<%=staff.staff_idList.get(i)%>"><%=staff.staff_idList.get(i) + " - " +staff.first_nameList.get(i) + " " + staff.last_nameList.get(i)%></option>            
                    <% } %>
              </select><br><br>
            
  
            <input type="submit" value="Search and view staff"/>
        </form>
 

        <br><br>
        <form action="addstaff.jsp" method="POST">
       
    	     <label for="firstname">First name:</label>
    	     <input type="text" name="firstname" placeholder="First Name" required>

   	     <label for="lastname">Last name:</label>
   	     <input type="text" name="lastname" placeholder="Last Name" required>
             <br>
             <label for="email">Email:</label>
   	     <input type="text" name="email" placeholder="Email" required>
             
             <label for="mobileNumber">Mobile Number:</label>
   	     <input type="text" name="mobileNumber" placeholder="Mobile Number" required>
             
             Select Role- 
                <select name="staffs">         
                    <option value="Librarian">Librarian</option>
                    <option value="Custodian">Custodian</option>          
                </select><br>
             
            <input type="submit" value="Add a library staff" />

        </form>
        <form action="rmstaff.jsp" method="POST">
             Select a staff -
    	     <select name="staff"> 
                    <% for (int i=0; i < staff.staff_idList.size(); i++) { 
                                        %>
                            <option value="<%=staff.staff_idList.get(i)%>"><%=staff.staff_idList.get(i) + " - " +staff.first_nameList.get(i) + " " + staff.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>

  
            <input type="submit" value="Remove a staff"/>

        </form>
        <form action="mod_staff.jsp" method="POST">
             Select a staff -
    	     <select name="staffs"> 
                    <% for (int i=0; i < staff.staff_idList.size(); i++) { 
                                        %>
                            <option value="<%=staff.staff_idList.get(i)%>"><%=staff.staff_idList.get(i) + " - " +staff.first_nameList.get(i) + " " + staff.last_nameList.get(i)%></option>            
                    <% } %>
              </select><br><br>
               
             <label for="first_name">First Name:</label>
    	     <input type="text" name="first_name" placeholder="First Name" required>

   	     <label for="last_name">Last Name:</label>
   	     <input type="text" name="last_name" placeholder="Last Name" required>
               
             Select Role- 
                <select name="staff">         
                    <option value="Librarian">Librarian</option>
                    <option value="Custodian">Custodian</option>          
                </select><br>
               <label for="email">Email:</label>
   	     <input type="text" name="email" placeholder="Email" required>
             
             <label for="mobileNumber">Mobile Number:</label>
   	     <input type="text" name="mobileNumber" placeholder="Mobile Number" required>
             
            <input type="submit" value="Modify a staff"/>

        </form><br><br><br>
            
        <center>
            <a href="staff_view.html">
                <button class="btn">
                    <i class="fa fa-home">     Return to Main Menu</i>
                </button>
            </a>
        </center>
</body>
</html>

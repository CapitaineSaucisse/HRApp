<%-- 
    Document   : employees
    Created on : 29-Feb-2016, 11:28:10
    Author     : keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%@ page import="java.sql.ResultSet" %>
        <h2>AnyCo Corporation: HR Application</h2>
       
        <h3>Employee Data</h3>
        
      <jsp:useBean id = "empsbean" class = "hr.DataHandler" scope = "session" />
      <form action="employees.jsp">
            Filter by Employee Name:
            <input type="text" name="query"> 
            <input type="submit" value="Filter"> 
      </form>
    
       
 
               
                
            <table border="1">
                <tr>
                    <th bgcolour = "cccccc" align="left">First Name</th>
                    <th bgcolour = "cccccc" align="left">Last Name</th>
                    <th bgcolour = "cccccc" align="left">Email</th>
                    <th bgcolour = "cccccc" align="left">Job</th>
                    <th bgcolour = "cccccc" align="left">Phone</th>
                    <th bgcolour = "cccccc" align="right">Salary</th>
                    <th><a href="insert.jsp">Insert Employee</a></th>
                </tr> 
                
             <% ResultSet rset;
            try{ 
            String query = request.getParameter("query");
            if (query != null && query != null)
                rset = empsbean.getEmployeesByName(query);
            else
                rset = empsbean.getAllEmployees();
                   
                   
                   while (rset.next ()){

                out.println("<tr>");
                out.println("<td>" +
                    rset.getString("first_name") + "</td><td> " +
                    rset.getString("last_name") + "</td><td> " +
                    rset.getString("email") + "</td><td> " +
                    rset.getString("job_id") + "</td><td>" +
                    rset.getString("phone_number") + "</td><td>" +
                    rset.getDouble("salary") +
                    "</td><td> <a href=\"edit.jsp?empid=" + rset.getInt(1) +
                    "\">Edit</a>&nbsp<a href=\"delete_action.jsp?empid=" +
                    rset.getInt(1) + "\">Delete</a></td>");
                out.println("</tr>");
                   }
            }
                catch (Exception e){
            out.println("An exception occurred: " + e.getMessage());
                }%> 
            </table>
    </body>
</html>

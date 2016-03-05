<%-- 
    Document   : Edit
    Created on : 03-Mar-2016, 16:50:06
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
        
        <h2 align="center">AnyCo Corporation: HR Application</h2>
        
        <h3 align="left">Edit Employee Record</h3>
        
        <jsp:useBean id="empsbean" scope="session" class="hr.DataHandler" />
        <jsp:useBean id="employee" scope="page" class="hr.Employee" />
        
        <% Integer employee_id = new Integer(request.getParameter("empid"));
         employee = empsbean.findEmployeeById(employee_id.intValue()); %>
      
         <form action="update_action.jsp">
             <table border="1">
                 <thead>
                     <tr>
                         <th></th>
                         <th></th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <td>First Name</td>
                         <td><input type="hidden" name="employee_id" value="<%= employee.getEmployeeId()%>" />
                             <input type="text"   name="first_name" value="<%= employee.getFirstName()%>" /></td>
                     </tr>
                     <tr>
                         <td>Last Name</td>
                         <td><input type="text" name="last_name" value="<%= employee.getLastName()%>" /></td>
                     </tr>
                     <tr>
                         <td>Email</td>
                         <td><input type="text" name="email" value="<%= employee.getEmail()%>"</td>
                     </tr>
                     <tr>
                         <td>Phone</td>
                         <td><input type="text" name="phone_number" value="<%= employee.getPhoneNumber()%>" /></td>
                     </tr>
                     <tr>
                         <td>Job</td>
                         <td><input type="text" name="job_id" value="<%= employee.getJobId()%>" /></td>
                     </tr>
                     <tr>
                         <td>Monthly Salary</td>
                         <td><input type="text" name="salary" value="<%= employee.getSalary()%>" /></td>
                     </tr>
                 </tbody>
             </table>
                     <input type="submit" value="Update" />  
         </form>
    </body>
</html>

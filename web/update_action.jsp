<%-- 
    Document   : update_action
    Created on : 03-Mar-2016, 18:00:21
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
        <%-- <%@ page import="java.sql.ResultSet" %> --%>
        
        <jsp:useBean id="empsbean" scope="session" class="hr.DataHandler" />
        
        
        <%
           Integer employee_id = new Integer(request.getParameter("employee_id"));
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String phone_number = request.getParameter("phone_number");
            String salary = request.getParameter("salary");
            String job_id = request.getParameter("job_id");
            empsbean.updateEmployee(employee_id.intValue(), first_name, last_name, email,
            phone_number, salary, job_id ); %>
       
         <jsp:forward page= "employees.jsp"/>
    </body>
    
    
</html>

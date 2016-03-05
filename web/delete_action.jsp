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
        
        <jsp:useBean id="empsbean" scope="session" class="hr.DataHandler" />
        
        
        <%
          Integer employee_id =
            new Integer(request.getParameter("empid"));
            empsbean.deleteEmployeeById(employee_id.intValue());  %>
       
         <jsp:forward page= "employees.jsp"/>
    </body>
    
    
</html>

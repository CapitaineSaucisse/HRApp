<%-- 
    Document   : login_action
    Created on : 29-Feb-2016, 19:41:05
    Author     : keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.ResultSet" %>
        
        <jsp:useBean id = "empsbean" class = "hr.DataHandler" 
                     scope = "session" />
        
        <% boolean userIsValid = false;
            String host = request.getParameter("host");
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
            String jdbcUrl = "jdbc:oracle:thin:@" + host + ":1521:XE";
            userIsValid = empsbean.authenticateUser(jdbcUrl, userid, password,
                    session); %>

            <% if (userIsValid){ %>
                <jsp:forward page="employees.jsp"/>
           <% } else { %>
               <jsp:forward page="login.jsp"/> 
            <% } %>
    </body>
</html>

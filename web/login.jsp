<%-- 
    Document   : login
    Created on : 29-Feb-2016, 15:06:36
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
        <h3 align="left">Application Login</h3>
     
        <%
String loginerrormsg = null;
loginerrormsg = (String) session.getAttribute("loginerrormsg");
if (loginerrormsg != null) {
%>
<h4>
<%= loginerrormsg %>
</h4>
<%
}
%>

     <form action="login_action.jsp">
             <table border="1">
                <tr>
                    <td align="left">User ID:</td>
                    <td><input type="text" name="userid"></td>
                </tr> 
                <tr>
                    <td align="left">Password:</td>
                    <td><input type="text" name="password"></td>
                </tr>                
                <tr>
                    <td align="left">Host:</td>
                    <td><input type="text" name="host"></td>
                </tr>                
             </table>
          <input type="submit" value="Submit"> 
       </form>
    </body>
</html>

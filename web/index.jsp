<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%-- replaced redirect.jsp:
    1. web.xml welcome now refers to this jsp 
    2. Project Props Run Relative URL not entered --%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body>
        <jsp:forward page= "login.jsp"/>
    </body>
</html>

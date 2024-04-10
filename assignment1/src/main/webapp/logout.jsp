<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.iotbay.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Logout</title>
        <nav>
            <h1>Logout</h1>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="welcome.jsp">Welcome</a></li>
                <li><a href="main.jsp">Main</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </head>
    <body onload="startTime()" >
    <%
        if (session != null) {
            session.invalidate();
        }
    %>
    

    </body>
</html>

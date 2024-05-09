<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="java.util.Random"%>
<%@ page import="com.iotbay.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/index.js"></script>
    <title>Login</title>
    <nav>
        <h1>Login</h1>
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
<body>
    <div class="outer-container">
        <div class="flex-container">
            <%
            if (session != null && session.getAttribute("user") != null) { 
            %>
            <p>An account is already logged in.</p>
            <%
                } else {
            %>
    <form id="loginForm" action="welcome.jsp" method="post" class="login-form">
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="button" onclick="login()">Login</button>
    </form>
            <%
                }
            %>        
        </div>
    </div>
    </body>
</html>

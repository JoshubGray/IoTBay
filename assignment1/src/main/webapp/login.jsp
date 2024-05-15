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
        <%
        if (session != null && session.getAttribute("user") != null) { 
        %>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="account_details.jsp">Account</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>

        <!--Menu Items => If User is NOT logged in-->

        <%
        } else {
        %>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
        <% 
        }
        %>
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
    <form id="loginForm" action="login_controller.jsp" method="post" class="login-form">
        <div style="padding: 2%; display: flex; justify-content: center;">
            <h2>Login</h2>
        </div>
        <%
        String login = request.getParameter("login");
        if (login != null && login.equals("failed")) {
            %>
            <p>Login details incorrect. Please try again.</p>
            <%
        }
        %>
        <div style="padding: 2%;">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div style="padding: 2%;">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div style="display: flex; justify-content: center; padding-top: 10%;">
            <button id="register-buttons" style="padding: 2%;" type="submit">Login</button>
        </div>
    </form>
            <%
                }
            %>        
        </div>
    </div>
    </body>
</html>

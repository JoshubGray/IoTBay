<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="java.util.Random"%>
<%@ page import="com.iotbay.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Register</title>
        <nav>
            <h1>Register</h1>
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
                <p>An account is already logged in. Please logout to register a new account.</p>
                <%
                    } else {
                %>
                <h3 style="padding: 5%;">Please enter your details:</h3>
                <p> </p>
                <form action="welcome.jsp" method="post" class="login-form">
                    <div>
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div>
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="button-container">
                        <button type="submit">Login</button>
                    </div>
                </form>
                <%
                    }
                %>        
            </div>
        </div>
    </body>
</html>

<%@ page import="com.iotbay.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Welcome</title>
        <nav>
            <h1>Welcome</h1>
            <ul>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="welcome.jsp">Welcome</a></li>
                <li><a href="main.jsp">Main</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </head>
    <body>
        <%-- Retrieve form data using request.getParameter() --%>
        <% String email = request.getParameter("email"); %>
        <% String password = request.getParameter("password"); %>
        <div class="outer-container">
            <div class="flex-container">
                <%
                User user = (User) session.getAttribute("user");
                if (user == null) {
                    user = new User(email, password);
                    session.setAttribute("user", user);
                }
                %>
                <div style="padding: 20px;">
                    <h2>Welcome!</h2>
                </div>
                <p>Email: <%= user.getEmail() %></p>
                <p>Password: <%= user.getPassword() %></p>
            </div>
        </div>        
    </body>
</html>

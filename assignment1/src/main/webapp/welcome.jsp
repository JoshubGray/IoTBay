<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Login</title>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="#">Register</a></li>
                <li><a href="#">Welcome</a></li>
                <li><a href="#">Main</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </nav>
    </head>
    <body>
        <%-- Retrieve form data using request.getParameter() --%>
        <% String email = request.getParameter("email"); %>
        <% String password = request.getParameter("password"); %>
        <div class="outer-container">
            <div class="flex-container">
                <p>Email: <%= email %></p>
                <p>Password: <%= password %></p>
            </div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.iotbay.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Main</title>
        <nav>
            <h1>Main</h1>
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
                User user = (User) session.getAttribute("user");
                if (user != null) {
                %>
                <table>
                    <tr>
                        <th>Email:</th>
                        <td><%= user.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td><%= user.getPassword() %></td>
                    </tr>
                </table>             
                <%
                } else {
                    %>
                    <p>
                        Error: User not logged in.
                    </p>
                    <%
                }
                %>
            </div>            
        </div>        
    </body>
</html>

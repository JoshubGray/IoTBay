<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@ page import="com.iotbay.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>Home Page</title>
        <nav>
            <h1>Home</h1>

            <!--If User is logged in-->

            <%
            if (session != null && session.getAttribute("user") != null) { 
            %>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="account_details.jsp">Account</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>

            <!--If User is NOT logged in-->

            <%
        } else {
            %>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
<<<<<<< HEAD
                <li><a href="main.jsp">Main</a></li>
                <li><a href="logout.jsp">Logout</a></li>
=======
>>>>>>> 13f57fd748abca24cc255e6539e6e9c9668ce24e
            </ul>
            <% 
        }
            %>

        </nav>
    </head>
    <!-- Leave the "startTime()" in the tag-->
    <body onload="startTime()" >
        <div class="outer-container"></div>
    </body>
</html>

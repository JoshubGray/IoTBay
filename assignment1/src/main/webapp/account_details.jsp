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
        <title>Account Details</title>
        <nav>
            <h1>Account Details</h1>
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
                <div>
                    <%
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                        if (request.getAttribute("update") != null && request.getAttribute("update").equals("success")) {
                            %>
                            <p>Details Updated Successfully</p>
                            <br>
                            <%
                        }
                    %>
                    <table>
                        <tr>
                            <th>Email:</th>
                            <td><%= user.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>Name:</th>
                            <td><%= user.getFirstName() + user.getLastName() %></td>
                        </tr>
                        <tr>
                            <th> Account Type:</th>
                            <td><%= user instanceof CustomerUser ? "Customer" : "Staff" %></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                    <div style="display: flex; flex-direction: row; justify-content: center;">
                        <div style="padding-top: 10%; margin-right: 10px;">
                            <button style="padding: 2%; width: 150px; text-align: center;" onclick="redirectToUpdateUserDetails()">Update Details</button>
                        </div>
                        <div style="padding-top: 10%;">
                            <button style="padding: 2%; width: 150px; text-align: center;" onclick="redirectToUnregisterPage()">Unregister</button>
                        </div>
                        <div style="padding-top: 10%; margin-left: 10px;">
                            <button style="padding: 2%; width: 150px; text-align: center;" onclick="redirectToViewAccessLogs()">Access Logs</button>
                        </div>
                            <script>
                                function redirectToUnregisterPage() {
                                    window.location.href = "unregister.jsp";
                                }

                                function redirectToUpdateUserDetails() {
                                    window.location.href = "update_user_details.jsp";
                                }

                                function redirectToViewAccessLogs() {
                                    window.location.href = "view_access_logs.jsp";
                                }
                            </script>
                        </div>
                </div>
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

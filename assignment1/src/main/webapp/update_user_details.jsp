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
        <title>Update User Details</title>
        <nav>
            <h1>Update User Details</h1>
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
                User user = (User) session.getAttribute("user");

                if (user != null) {
                    if (user instanceof CustomerUser) {
                        CustomerUser customerUser = (CustomerUser) user;
                        %>
                        <!-- CustomerUser -->
                        <h3 style="padding: 5%;">Enter your new customer details:</h3>
                        <form action="update_user_details_controller.jsp" method="post" class="login-form">
                            <input type="hidden" id="userTypeCustomer" name="userType" value="customer">
                            <div id="form-item">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" maxlength="60" required value="<%= user != null ? customerUser.getEmail() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" maxlength="30" required>
                            </div>
                            <div id="form-item">
                                <label for="first_name">First Name:</label>
                                <input type="text" id="first_name" name="first_name" maxlength="20" required value="<%= user != null ? customerUser.getFirstName() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="last_name">Last Name:</label>
                                <input type="text" id="last_name" name="last_name" maxlength="20" required value="<%= user != null ? customerUser.getLastName() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="street_address">Street Address:</label>
                                <input type="text" id="street_address" name="street_address" maxlength="30" required value="<%= user != null ? customerUser.getAddress().getStreetAddress() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="postcode">Postcode:</label>
                                <input type="number" id="postcode" name="postcode" min="0" max="9999" required value="<%= user != null ? customerUser.getAddress().getPostcode() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="city">City:</label>
                                <input type="text" id="city" name="city" maxlength="40" required value="<%= user != null ? customerUser.getAddress().getCity() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="state">State:</label>
                                <select id="state" name="state" style="font-size: medium;" required>
                                    <option value="">Select a state</option>
                                    <option value="NSW">NSW</option>
                                    <option value="VIC">VIC</option>
                                    <option value="TAS">TAS</option>
                                    <option value="NT">NT</option>
                                    <option value="WA">WA</option>
                                    <option value="QLD">QLD</option>
                                    <option value="ACT">ACT</option>
                                    <option value="SA">SA</option>
                                    <option value="OT">OT</option>
                                </select>
                            </div>
                            <div id="form-item">
                                <label for="phone_number">Phone Number:</label>
                                <input type="number" id="phone_number" name="phone_number" value="<%= user != null ? customerUser.getHomePhoneNumber() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="mobile_number">Mobile Number:</label>
                                <input type="number" id="mobile_number" name="mobile_number" value="<%= user != null ? customerUser.getMobilePhoneNumber() : "" %>">
                            </div>
                            <div id="register-buttons">
                                <button type="submit">Update Details</button>
                            </div>
                        </form>
                        <%
                    }
                        else if (user instanceof Staff) {
                            Staff staff = (Staff) user;
                        %>
                        <!-- Staff -->
                        <h3 style="padding: 5%;">Enter your new staff details:</h3>
                        <form action="update_user_details_controller.jsp" method="post" class="staff-form">
                            <input type="hidden" id="userTypeStaff" name="userType" value="staff">
                            <div id="form-item">
                                <label for="staff_id">Staff ID:</label>
                                <input type="text" id="staff_id" name="staff_id" required value="<%= user != null ? staff.getStaffID() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" maxlength="60" required value="<%= user != null ? staff.getEmail() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" maxlength="30" required>
                            </div>
                            <div id="form-item">
                                <label for="first_name">First Name:</label>
                                <input type="text" id="first_name" name="first_name" maxlength="20" required value="<%= user != null ? staff.getFirstName() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="last_name">Last Name:</label>
                                <input type="text" id="last_name" name="last_name" maxlength="20" required value="<%= user != null ? staff.getLastName() : "" %>">
                            </div>
                            <div id="form-item">
                                <label for="staff_type">Staff Type:</label>
                                <select id="staff_type" name="staff_type" style="font-size: medium;" required>
                                    <option value="">Select a type</option>
                                    <option value="1">Stock Clerk</option>
                                    <option value="2">System Admin</option>
                                </select>
                            </div>
                            <div id="register-buttons" style="padding: 5%;">
                                <button type="submit">Update Details</button>
                            </div>
                        </form>                        
                        <%
                    }
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

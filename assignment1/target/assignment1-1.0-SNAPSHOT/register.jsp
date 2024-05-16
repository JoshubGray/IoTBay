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
    <script>
        function showForm(role) {
            const customerForm = document.getElementById('customer-form');
            const staffForm = document.getElementById('staff-form');

            if (role === 'customer') {
                customerForm.style.display = 'flex';
                staffForm.style.display = 'none';
            } else if (role === 'staff') {
                staffForm.style.display = 'flex';
                customerForm.style.display = 'none';
            }
        }
    </script>
    <title>Register</title>
</head>
<body>
    <nav>
        <h1>Register</h1>
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
        /*
            Register logic
            If registration is invalid, it redirects to this page and displays the error here.
        */

        String errorField = (String) request.getAttribute("errorField");
        %>
    </nav>
    <div class="outer-container">
        <div class="flex-container" style="flex-direction: column;">
            <% if (session != null && session.getAttribute("user") != null) { %>
                <p>An account is already logged in. Please logout to register a new account.</p>
            <% } else { %>
            <div id="register-buttons">
                <button onclick="showForm('customer')">Customer</button>
                <button onclick="showForm('staff')">Staff</button>
            </div>
    <!--
        Customer form -
        shows after 'customer' has been selected
    -->
            <div id="customer-form">
                <div>
                    <h3 style="padding: 5%;">Please enter your customer details:</h3>
                    <%
                    if (errorField != null) {
                    %>
                    <div>
                        <br>
                            <p>Error: <%= errorField %></p>
                        <br>
                    </div>
                    <%
                    }
                    %>
                        <form action="register_controller.jsp" method="post" class="login-form">
                            <input type="hidden" id="userTypeCustomer" name="userType" value="customer">
                            <div id="form-item">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" maxlength="60" required>
                            </div>
                            <div id="form-item">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" maxlength="30" required>
                            </div>
                            <div id="form-item">
                                <label for="first_name">First Name:</label>
                                <input type="text" id="first_name" name="first_name" maxlength="20" required>
                            </div>
                            <div id="form-item">
                                <label for="last_name">Last Name:</label>
                                <input type="text" id="last_name" name="last_name" maxlength="20" required>
                            </div>
                            <div id="form-item">
                                <label for="street_address">Street Address:</label>
                                <input type="text" id="street_address" name="street_address" maxlength="30" required>
                            </div>
                            <div id="form-item">
                                <label for="postcode">Postcode:</label>
                                <input type="number" id="postcode" name="postcode" min="0" max="9999" required>
                            </div>
                            <div id="form-item">
                                <label for="city">City:</label>
                                <input type="text" id="city" name="city" maxlength="40" required>
                            </div>
                            <div id="form-item">
                                <label for="state">State:</label>
                                </div>
                                <div>
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
                                    <input type="number" id="phone_number" name="phone_number"> 
                                </div>
                                <div id="form-item">
                                    <label for="mobile_number">Mobile Number:</label>
                                    <input type="number" id="mobile_number" name="mobile_number">
                                </div>
                            </div>
                                <div id="register-buttons">
                                    <button type="submit">Register</button>
                                </div>
                            </div>
                        </form>
    <!-- 
        Staff Form -
    shows when 'staff' has been selected
    -->
            <div id="staff-form" style="display: none;">
                <h3 style="padding: 5%;">Enter your staff details:</h3>
                <%
                if (errorField != null) {
                %>
                <div>
                    <br>
                        <p>Error: <%= errorField %></p>
                    <br>
                </div>
                <%
                }
                %>
                <div>
                <form action="register_controller.jsp" method="post" class="staff-form">
                    <input type="hidden" id="userTypeStaff" name="userType" value="staff">
                    <div id="form-item">
                        <label for="staff_id">Staff ID:</label>
                        <input type="text" id="staff_id" name="staff_id" required>
                    </div>
                    <div id="form-item">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" maxlength="60" required>
                    </div>
                    <div id="form-item">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" maxlength="30" required>
                    </div>
                    <div id="form-item">
                        <label for="first_name">First Name:</label>
                        <input type="text" id="first_name" name="first_name" maxlength="20" required>
                    </div>
                    <div id="form-item">
                        <label for="last_name">Last Name:</label>
                        <input type="text" id="last_name" name="last_name" maxlength="20" required>
                    </div>
                    <div id="form-item">
                        <label for="staff_type">Staff Type:</label>
                        </div>
                        <div>
                        <select id="staff_type" name="staff_type" style="font-size: medium;" required>
                            <option value="">Select a type</option>
                            <option value="1">Stock Clerk</option>
                            <option value="2">System Admin</option>
                        </select>
                        </div>
                    </div>
                        <div id="register-buttons" style="padding: 5%;">
                            <button type="submit">Register Staff Account    </button>
                        </div>
                </form>
            </div>
        </div>

        <% } %>

</body>
</html>

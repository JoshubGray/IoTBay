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
    <script>
        function showForm(role) {
            const customerForm = document.getElementById('customer-form');
            const staffForm = document.getElementById('staff-form');

            if (role === 'customer') {
                customerForm.style.display = 'block';
                staffForm.style.display = 'none';
            } else if (role === 'staff') {
                staffForm.style.display = 'block';
                customerForm.style.display = 'none';
            }
        }
    </script>
    <title>Register</title>
</head>
<body>
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
    <div id="register-buttons">
        <button onclick="showForm('customer')">Customer</button>
        <button onclick="showForm('staff')">Staff</button>
    </div>
    <!--
        Customer form -
        shows after 'customer' has been selected
    -->
    <div id="customer-form" style="display: none;">
        <div class="outer-container">
            <div class="flex-container">
                <% if (session != null && session.getAttribute("user") != null) { %>
                    <p>An account is already logged in. Please logout to register a new account.</p>
                <% } else { %>
                    <h3 style="padding: 2%;">Please enter your details</h3>
                        <form action="welcome.jsp" method="post" class="login-form">
                            <div>
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" maxlength="60" required>
                            </div>
                            <div>
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" maxlength="30" required>
                            </div>
                            <div>
                                <label for="first_name">First Name:</label>
                                <input type="text" id="first_name" name="first_name" maxlength="20" required>
                            </div>
                            <div>
                                <label for="last_name">Last Name:</label>
                                <input type="text" id="last_name" name="last_name" maxlength="20" required>
                            </div>
                            <div>
                                <label for="street_address">Street Address:</label>
                                <input type="text" id="street_address" name="street_address" maxlength="30" required>
                            </div>
                            <div>
                                <label for="postcode">Postcode:</label>
                                <input type="number" id="postcode" name="postcode" min="0" max="9999" required>
                            </div>
                            <div>
                                <label for="city">City:</label>
                                <input type="text" id="city" name="city" maxlength="40" required>
                            </div>
                            <div>
                                <label for="state">State:</label>
                                </div>
                                <div>
                                <select id="state" name="state" required>
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
                                <div>
                                    <label for="phone_number">Phone Number:</label>
                                    <input type="tel" id="phone_number" name="phone_number"
                                        pattern="\(\d{2}\) \d{4} \d{4}">
                                </div>
                                <div>
                                    <label for="mobile_number">Mobile Number:</label>
                                    <input type="tel" id="mobile_number" name="mobile_number"
                                        pattern="\(\d{2}\) \d{4} \d{4}">
                                </div>
                            </div>
                        </form>
                <% } %>
            </div>
        </div>
    </div>

    <!-- 
        Staff Form -
    shows when 'staff' has been selected
    -->
    <div id="staff-form" style="display: none;">
        <h4>Staff Details</h4>
        <!-- Staff-specific fields (add your desired content here) -->
        <form action="staff_welcome.jsp" method="post" class="staff-form">
            <div>
                <label for="staff_id">Staff ID:</label>
                <input type="text" id="staff_id" name="staff_id" required>
            </div>
            

        </form>
    </div>

</body>
</html>

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
    <title>Register</title>
</head>
<body>
    <nav>
        <h1>Register</h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="main.jsp">Main</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
    <div class="outer-container">
        <div class="flex-container" style="flex-direction: column;">
            <div>
                <h3 style="padding: 5%;">Please enter your payment details:</h3>
                    <form action="thankyou.jsp" method="post" class="login-form">
                        <input type="hidden" id="paymentID" name="paymentID" value="orderID">
                        <div id="form-item">
                            <label for="cardType">Payment Method:</label>
                            </div>
                            <div>
                                <select id="cardType" name="cardType" style="font-size: medium;" required>
                                    <option value="">Select a card type</option>
                                    <option value="Visa">Visa</option>
                                    <option value="Mastercard">Mastercard</option>
                                    <option value="Other">Other</option>
                                </select>
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
                            <select id="cardType" name="cardType" style="font-size: medium;" required>
                                <option value="">Select a state</option>
                                <option value="Visa">Visa</option>
                                <option value="Mastercard">Mastercard</option>
                                <option value="Other">Other</option>
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
        </div>
    </div>

</body>
</html>
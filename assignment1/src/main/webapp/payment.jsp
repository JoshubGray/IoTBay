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
    <title>Make Payment</title>
</head>
<body>
    <nav>
        <h1>Payment</h1>
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
                        <input type="hidden" id="paymentID" name="paymentID" value=${orderID}>
                        <div id="form-item">
                            <label for="cardType">Payment Method:</label>
                            </div>
                            <div>
                                <select id="cardType" name="cardType" style="font-size: medium;">
                                    <option value="">Select a card type</option>
                                    <option value="Visa">Visa</option>
                                    <option value="Mastercard">Mastercard</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        <div id="form-item">
                            <label for="cardNumber">Card Number:</label>
                            <input type="number" id="cardNumber" name="cardNumber" maxlength="19" required>
                        </div>
                        <div>
                            <label for="expiry_date">Expiry Date:</label>
                            <div id="date_input">
                                <input type="number" name="dateMonth" maxlength="2" required>
                                <span>/</span>
                                <input type="number" name="dateYear" maxlength="2" required>
                            </div>
                        </div>
                        <div id="form-item">
                            <label for="cvn">CVC/CVV:</label>
                            <input type="number" id="cvn" name="cvn" maxlength="3" required>
                        </div>
                        <input type="hidden" id="customerEmail" name="customerEmail" value="orderID">
                        <label>Amount Due: $99999.99</label> 
                        </div>
                            <div id="payment-buttons">
                                <button type="submit">Pay</button>
                            </div>
                        </div>
                    </form>
        </div>
    </div>

</body>
</html>
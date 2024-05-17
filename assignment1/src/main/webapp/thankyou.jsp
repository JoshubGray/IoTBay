<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/index.js"></script>
    <title>Welcome</title>
</head>
<body>
    <nav>
        <h1>Welcome</h1>
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

    <div class="outer-container">
        <div class="flex-container">
            <%
            String paymentID = request.getParameter("orderID");
            String cardType = request.getParameter("cardType");
            String cardNumber = request.getParameter("cardNumber"); 
            String cvn = request.getParameter("cvn");
            double amount = request.getParameter("amount");
            String email= session.getAttribute("user").getEmail();
            String expiryDateMonth= request.getParameter("dateMonth");
            String expiryDateYear= request.getParameter("dateYear");

            Payment.makePayment(PaymentID, cardType, cardNumber, cvn, amount, email, expiryDateMonth, expiryDateYear);
            %>
            <div style="padding: 20px;">
                <h2>Welcome, <%= user != null ? user.getFirstName(): "null"%></h2>
            </div>
            <br>
            <p>
                <% if (login != null && login.equals("success")) { %>
                    Login Successful!
                <% } else { %>
                    Thank you for registering!
                <% } %>
            </p>
        </div>
    </div>
</body>
</html>

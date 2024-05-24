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
    <title>Payment History</title>
</head>
<body>
    <nav>
        <h1>Payment History</h1>
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
            <table>
                <thead>
                    <th>PaymentID</th>
                    <th>Card Type</th>
                    <th>Card Number</th>
                    <th>Amount</th>
                    <th>Time Stamp</th>
                </thead>
                <%
                    ResultSet queryResult=Payment.queryHistory();
                    while(queryHistory.next()){
                        int paymentID=queryHistory.getInt("paymentID");
                        String cardType=queryHistory.getString("cardType");
                        String cardNumber=queryHistory.getString("cardNumber");
                        double amount=queryHistory.getDouble("amount");
                        Timestamp timestamp=queryHistory.getTimestamp("timestamp");
                    }
                %>
                <tbody>
                    <tr>
                        <td><%= paymentID %></td>
                        <td><%= cardType %></td>
                        <td><%= cardNumber %></td>
                        <td><%= amount %></td>
                        <td><%= timestamp %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
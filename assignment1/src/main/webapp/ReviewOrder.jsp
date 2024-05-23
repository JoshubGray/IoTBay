<%@ page import="java.util.List" %>
<%@ page import="com.iotbay.Dao.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Review Orders</title>
</head>
<body>
    <h2>Review Orders</h2>
    <form action="OrderServlet" method="get">
        <input type="hidden" name="action" value="search">
        <label for="orderId">Order ID:</label>
        <input type="text" id="orderId" name="orderId">
        <label for="date">Order Date:</label>
        <input type="date" id="date" name="date">
        <input type="submit" value="Search">
    </form>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("listOrder");
            if (orders != null) {
                for (Order order : orders) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getName() %></td>
            <td><%= order.getEmail() %></td>
            <td><%= order.getDate() %></td>
            <td>
                <a href="OrderServlet?action=edit&orderId=<%= order.getOrderId() %>">Edit</a>
                <a href="OrderServlet?action=delete&orderId=<%= order.getOrderId() %>">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <a href="index.jsp">Back to Main Menu</a>
</body>
</html>

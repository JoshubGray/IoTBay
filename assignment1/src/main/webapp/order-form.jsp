<%@ page import="com.iotbay.Dao.Orderclass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Order</title>
</head>
<body>
    <h2>Edit Order</h2>
    <form action="OrderServlet?action=update" method="post">
        <input type="hidden" name="orderId" value="<%= ((Order) request.getAttribute("order")).getOrderId() %>">
        <table>
            <tr>
                <td>Your full name:</td>
                <td><input type="text" name="name" value="<%= ((Order) request.getAttribute("order")).getName() %>" required></td>
            </tr>
            <tr>
                <td>Your email:</td>
                <td><input type="email" name="email" value="<%= ((Order) request.getAttribute("order")).getEmail() %>" required></td>
            </tr>
            <tr>
                <td>Order Date:</td>
                <td><input type="date" name="date" value="<%= ((Order) request.getAttribute("order")).getDate() %>" required></td>
            </tr>
        </table>
        <div>
            <a href="OrderIndex.jsp">Cancel</a>
            <input type="submit" value="Submit">
        </div>
    </form>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Order</title>
</head>
<body>
    <h2>Create a New Order</h2>
    <form action="OrderServlet?action=insert" method="post">
        <table>
            <tr><td>Your full name:</td><td><input type="text" name="name" required></td></tr>
            <tr><td>Your email:</td><td><input type="email" name="email" required></td></tr>
            <tr><td>Order Date:</td><td><input type="date" name="date" required></td></tr>
        </table>
        <div>
            <a href="OrderIndex.jsp">Cancel</a>
            <input type="submit" value="Submit">
        </div>
    </form>
</body>
</html>

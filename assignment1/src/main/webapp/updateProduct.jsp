<%@ page import="java.sql.Connection, java.sql.SQLException, com.iotbay.Product, com.iotbay.ProductManager, com.iotbay.Dao.DBConnector, com.iotbay.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null || !loggedInUser.isStaff()) {
        response.sendRedirect("listProducts.jsp");
        return;
    }

    int productID = Integer.parseInt(request.getParameter("id"));
    Product product = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));

        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            ProductManager productManager = new ProductManager(connection);
            product = new Product();
            product.setProductID(productID);
            product.setName(name);
            product.setDescription(description);
            product.setUnitPrice(unitPrice);
            product.setQuantityInStock(quantityInStock);
            productManager.updateProduct(product);
            dbConnector.closeConnection();

            response.sendRedirect("listProducts.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    } else {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            ProductManager productManager = new ProductManager(connection);
            product = productManager.getProductById(productID);
            dbConnector.closeConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
    <h1>Update Product</h1>
    <form method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= product.getName() %>" required>
        <br>
        <label for="description">Description:</label>
        <input type="text" name="description" id="description" value="<%= product.getDescription() %>" required>
        <br>
        <label for="unitPrice">Unit Price:</label>
        <input type="number" step="0.01" name="unitPrice" id="unitPrice" value="<%= product.getUnitPrice() %>" required>
        <br>
        <label for="quantityInStock">Quantity in Stock:</label>
        <input type="number" name="quantityInStock" id="quantityInStock" value="<%= product.getQuantityInStock() %>" required>
        <br>
        <button type="submit">Update Product</button>
    </form>
</body>
</html>

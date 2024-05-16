<%@ page import="java.sql.Connection, java.sql.SQLException, com.iotbay.Product, com.iotbay.ProductManager, com.iotbay.Dao.DBConnector" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setUnitPrice(unitPrice);
        product.setQuantityInStock(quantityInStock);

        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            ProductManager productManager = new ProductManager(connection);
            productManager.addProduct(product);
            dbConnector.closeConnection();

            response.sendRedirect("listProducts.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h1>Add Product</h1>
    <form method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>
        <br>
        <label for="description">Description:</label>
        <input type="text" name="description" id="description" required>
        <br>
        <label for="unitPrice">Unit Price:</label>
        <input type="number" step="0.01" name="unitPrice" id="unitPrice" required>
        <br>
        <label for="quantityInStock">Quantity in Stock:</label>
        <input type="number" name="quantityInStock" id="quantityInStock" required>
        <br>
        <button type="submit">Add Product</button>
    </form>
</body>
</html>

<%@ page import="java.util.List, com.iotbay.Product, com.iotbay.ProductManager, com.iotbay.Dao.DBConnector" %>
<%@ page import="java.sql.Connection, java.sql.SQLException" %>
<%
    List<Product> products = null;
    try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        ProductManager productManager = new ProductManager(connection);
        products = productManager.listProducts();
        dbConnector.closeConnection();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Unit Price</th>
                <th>Quantity in Stock</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if (products != null && !products.isEmpty()) { %>
                <% for (Product product : products) { %>
                    <tr>
                        <td><%= product.getProductID() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getUnitPrice() %></td>
                        <td><%= product.getQuantityInStock() %></td>
                        <td>
                            <a href="updateProduct.jsp?id=<%= product.getProductID() %>">Update</a>
                            <a href="deleteProduct.jsp?id=<%= product.getProductID() %>">Delete</a>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="6">No products found</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

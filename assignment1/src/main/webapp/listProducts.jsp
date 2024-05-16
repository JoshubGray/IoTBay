<%@ page import="java.util.List, com.iotbay.Product, com.iotbay.ProductManager, com.iotbay.Dao.DBConnector" %>
<%
    DBConnector dbConnector = new DBConnector();
    Connection connection = dbConnector.openConnection();
    ProductManager productManager = new ProductManager(connection);
    List<Product> products = productManager.listProducts();
    dbConnector.closeConnection();
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
            </tr>
        </thead>
        <tbody>
            <% for (Product product : products) { %>
                <tr>
                    <td><%= product.getProductID() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getUnitPrice() %></td>
                    <td><%= product.getQuantityInStock() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

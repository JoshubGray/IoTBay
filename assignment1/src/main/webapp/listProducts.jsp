<%@ page import="java.util.ArrayList, java.util.List, com.iotbay.Product" %>
<%
    List<Product> products = new ArrayList<>();

    // テストデータの作成
    Product product1 = new Product();
    product1.setProductID(1);
    product1.setName("Test Product 1");
    product1.setDescription("This is a test product.");
    product1.setUnitPrice(100.0);
    product1.setQuantityInStock(10);
    products.add(product1);

    Product product2 = new Product();
    product2.setProductID(2);
    product2.setName("Test Product 2");
    product2.setDescription("This is another test product.");
    product2.setUnitPrice(200.0);
    product2.setQuantityInStock(20);
    products.add(product2);
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
            <% if (products != null) { %>
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

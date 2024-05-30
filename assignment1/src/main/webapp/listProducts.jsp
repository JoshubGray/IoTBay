<%@ page import="java.sql.Connection, java.sql.SQLException, java.util.List, java.util.ArrayList, com.iotbay.Dao.DBConnector, com.iotbay.Product, com.iotbay.ProductManager, com.iotbay.User, com.iotbay.UserType" %>
<%
    String searchQuery = request.getParameter("searchQuery");
    List<Product> products = new ArrayList<>();
    User loggedInUser = (User) session.getAttribute("user");

    try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        ProductManager productManager = new ProductManager(connection);
        
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            products = productManager.searchProducts(searchQuery);
        } else {
            products = productManager.listProducts();
        }
        
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
    <form method="get">
        <input type="text" name="searchQuery" placeholder="Search products..." value="<%= searchQuery != null ? searchQuery : "" %>">
        <button type="submit">Search</button>
    </form>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Unit Price</th>
                <th>Quantity in Stock</th>
                <% if (loggedInUser != null && loggedInUser.getUserType() == UserType.STAFF) { %>
                <th>Actions</th>
                <% } %>
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
                        <% if (loggedInUser != null && loggedInUser.getUserType() == UserType.STAFF) { %>
                        <td>
                            <a href="updateProduct.jsp?id=<%= product.getProductID() %>">Update</a>
                            <a href="deleteProduct.jsp?id=<%= product.getProductID() %>">Delete</a>
                        </td>
                        <% } %>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="<%= loggedInUser != null && loggedInUser.getUserType() == UserType.STAFF ? 6 : 5 %>">No products found</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

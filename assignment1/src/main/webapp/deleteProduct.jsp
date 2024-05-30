<%@ page import="java.sql.Connection, java.sql.SQLException, com.iotbay.ProductManager, com.iotbay.Dao.DBConnector, com.iotbay.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null || !loggedInUser.isStaff()) {
        response.sendRedirect("listProducts.jsp");
        return;
    }

    int productID = Integer.parseInt(request.getParameter("id"));

    try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        ProductManager productManager = new ProductManager(connection);
        productManager.deleteProduct(productID);
        dbConnector.closeConnection();

        response.sendRedirect("listProducts.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>

package com.iotbay.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iotbay.Dao.DatabaseConnection;
import com.iotbay.Dao.OrderDAO;
import com.iotbay.model.Order;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private OrderDAO orderDAO;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        Connection connection = DatabaseConnection.getConnection();
        orderDAO = new OrderDAO(connection);
        try {
            switch (action) {
                case "insert":
                    insertOrder(request, response);
                    break;
                case "delete":
                    deleteOrder(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateOrder(request, response);
                    break;
                case "list":
                    listOrders(request, response);
                    break;
                case "search":
                    searchOrders(request, response);
                    break;
                default:
                    listOrders(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
    }

    private void insertOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        System.out.println("Inserting order: " + name + ", " + email + ", " + date); // 添加日志记录
        Order newOrder = new Order(name, email, 0, date); // 假设订单ID自动生成
        try {
            orderDAO.insertOrder(newOrder);
            System.out.println("Order inserted successfully.");
            response.sendRedirect("OrderServlet?action=list");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error inserting order: " + e.getMessage());
            throw e;
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderDAO.deleteOrder(orderId);
        response.sendRedirect("OrderServlet?action=list");
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String date = request.getParameter("date");
        Order order = new Order(name, email, orderId, date);
        orderDAO.updateOrder(order);
        response.sendRedirect("OrderServlet?action=list");
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Order> listOrder = orderDAO.selectAllOrders();
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("review.jsp").forward(request, response);
    }

    private void searchOrders(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String orderIdStr = request.getParameter("orderId");
        String date = request.getParameter("date");
        List<Order> orders = null;

        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            int orderId = Integer.parseInt(orderIdStr);
            orders = orderDAO.selectOrderById(orderId);
        } else if (date != null && !date.isEmpty()) {
            orders = orderDAO.selectOrderByDate(date);
        }

        request.setAttribute("listOrder", orders);
        request.getRequestDispatcher("review.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Order existingOrder = orderDAO.selectOrder(orderId);
        request.setAttribute("order", existingOrder);
        request.getRequestDispatcher("order-form.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

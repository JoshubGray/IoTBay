<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
if (session != null && session.getAttribute("user") != null) {
    User user = (User) session.getAttribute("user");
    UserManager.removeUser(user);
    response.sendRedirect("index.jsp?unregister=You have successfully unregistered your account");
    session.invalidate();
}
else {
    response.sendRedirect("index.jsp?unregister=Failed to unregister account");
}
%>
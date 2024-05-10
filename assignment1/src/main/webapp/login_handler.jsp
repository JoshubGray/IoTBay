
<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
User user = UserManager.loginUser(email, password);

if (user == null) {
    response.sendRedirect("login.jsp?login=failed");
} else {    
    switch(user.getUserType()) {
        case CUSTOMER_USER:
        session.setAttribute("user", (CustomerUser)user);
        break;
        case STAFF:
        session.setAttribute("user", (Staff)user);
    }
    response.sendRedirect("welcome.jsp?login=success");
}
%>
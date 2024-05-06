<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/index.js"></script>
    <title>Welcome</title>
</head>
<body>
    <nav>
        <h1>Welcome</h1>
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="welcome.jsp">Welcome</a></li>
            <li><a href="main.jsp">Main</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="outer-container">
        <div class="flex-container">
            <%
                String registeredUserType = request.getParameter("userType");
                String email = request.getParameter("email");
                String password = request.getParameter("password"); 
                String firstName = request.getParameter("first_name");
                String lastName = request.getParameter("last_name");

                if ("customer".equals(registeredUserType)) {
                    Address address = new Address(request.getParameter("street_address"), request.getParameter("postcode"), request.getParameter("city"), request.getParameter("state"));
                    String phoneNumber = request.getParameter("phone_number");
                    String mobileNumber = request.getParameter("mobile_number");
                    User customerUser = new CustomerUser(email, password, firstName, lastName, address);
                    if (phoneNumber != null && !phoneNumber.isEmpty() && phoneNumber.matches("\\d+")) {
                        ((CustomerUser) customerUser).setMobilePhoneNumber(Integer.parseInt(phoneNumber));
                    }
                    if (mobileNumber != null && !mobileNumber.isEmpty() && mobileNumber.matches("\\d+")) {
                        ((CustomerUser) customerUser).setHomePhoneNumber(Integer.parseInt(mobileNumber));
                    }
                    session.setAttribute("user", customerUser);
                } else {
                    String staffID = request.getParameter("staff_id");
                    String staffType = request.getParameter("staff_type");
                    User staff = new Staff(email, password, firstName, lastName);
                    if (staffID != null && !staffID.isEmpty() && staffID.matches("\\d+")) {
                        ((Staff) staff).setStaffID(Integer.parseInt(staffID));
                    }
                    if (staffID != null && !staffType.isEmpty() && staffType.matches("\\d+")) {
                        ((Staff) staff).setStaffTypeID(Integer.parseInt(staffType));
                    }
                    session.setAttribute("user", staff);
                }
                User user = null;
                if (session.getAttribute("user") != null) {
                    user = (User) session.getAttribute("user");
                }
                
            %>
            <div style="padding: 20px;">
                <h2>Welcome, <%= user.getFirstName()%></h2>
            </div>
            <p>Thank you for registering!</p>
            <!-- This is where I will save the user to the database -->
        </div>
    </div>
</body>
</html>

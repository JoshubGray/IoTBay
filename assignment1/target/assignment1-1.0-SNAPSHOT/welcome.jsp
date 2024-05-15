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
        <%
        if (session != null && session.getAttribute("user") != null) { 
        %>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="account_details.jsp">Account</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>

        <!--Menu Items => If User is NOT logged in-->

        <%
        } else {
        %>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
        <% 
        }
        %>
    </nav>

    <div class="outer-container">
        <div class="flex-container">
            <%
            User user = null;
            String login = request.getParameter("login");
            if (login != null && login.equals("success")) {
                user = (User) session.getAttribute("user");
            }
            else {
                String registeredUserType = request.getParameter("userType");
                String email = request.getParameter("email");
                String password = request.getParameter("password"); 
                String firstName = request.getParameter("first_name");
                String lastName = request.getParameter("last_name");

                if (registeredUserType.equals("customer")) {
                    Address address = new Address(request.getParameter("street_address"), Integer.parseInt(request.getParameter("postcode")), request.getParameter("city"), request.getParameter("state"));
                    String phoneNumber = request.getParameter("phone_number");
                    String mobileNumber = request.getParameter("mobile_number");
                    User customerUser = new CustomerUser(email, password, firstName, lastName, address);
                    if (phoneNumber != null && !phoneNumber.isEmpty() && phoneNumber.matches("\\d+")) {
                        ((CustomerUser) customerUser).setMobilePhoneNumber(Integer.parseInt(phoneNumber));
                    }
                    if (mobileNumber != null && !mobileNumber.isEmpty() && mobileNumber.matches("\\d+")) {
                        ((CustomerUser) customerUser).setHomePhoneNumber(Integer.parseInt(mobileNumber));
                    }
                    session.setAttribute("user", (CustomerUser)customerUser);
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
                    session.setAttribute("user", (Staff)staff);
                }

                if (session.getAttribute("user") != null) {
                    user = (User) session.getAttribute("user");
                    UserManager.addUserToDB(session.getId(), user);
                }
                else {
                    out.println("User is null");
                }
            }              
            %>
            <div style="padding: 20px;">
                <h2>Welcome, <%= user != null ? user.getFirstName(): "null"%></h2>
            </div>
            <br>
            <p>
                <% if (login != null && login.equals("success")) { %>
                    Login Successful!
                <% } else { %>
                    Thank you for registering!
                <% } %>
            </p>
        </div>
    </div>
</body>
</html>

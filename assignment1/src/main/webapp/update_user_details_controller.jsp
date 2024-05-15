
<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
// update DB

    String registeredUserType = request.getParameter("userType");
    if (registeredUserType.equals("customer")) {
        CustomerUser customerUser = new CustomerUser();
        customerUser.setEmail(request.getParameter("email"));
        customerUser.setPassword(request.getParameter("password"));
        customerUser.setFirstName(request.getParameter("first_name"));
        customerUser.setLastName(request.getParameter("last_name"));
        customerUser.setAddress(new Address(request.getParameter("street_address"), Integer.parseInt(request.getParameter("postcode")), request.getParameter("city"), request.getParameter("state")));
        String phoneNumber = request.getParameter("phone_number");
        String mobileNumber = request.getParameter("mobile_number");
        User customerUser = new CustomerUser(email, password, firstName, lastName, address);
        if (phoneNumber != null && !phoneNumber.isEmpty() && phoneNumber.matches("\\d+")) {
            customerUser.setMobilePhoneNumber(Integer.parseInt(phoneNumber));
        }
        if (mobileNumber != null && !mobileNumber.isEmpty() && mobileNumber.matches("\\d+")) {
            customerUser.setHomePhoneNumber(Integer.parseInt(mobileNumber));
        }
        UserManager.updateUserDetails(customerUser, session.getAttribute("user"));
        session.setAttribute("user", customerUser);

    } else {
        Staff staff = new Staff();
        staff.setEmail(request.getParameter("email"));
        staff.setPassword(request.getParameter("password"));
        staff.setFirstName(request.getParameter("first_name"));
        staff.setLastName(request.getParameter("last_name"));
        String staffID = request.getParameter("staff_id");
        String staffType = request.getParameter("staff_type");
        if (staffID != null && !staffID.isEmpty() && staffID.matches("\\d+")) {
            staff.setStaffID(Integer.parseInt(staffID));
        }
        if (staffID != null && !staffType.isEmpty() && staffType.matches("\\d+")) {
            staff.setStaffTypeID(Integer.parseInt(staffType));
        }
        UserManager.updateUserDetails(staff, session.getAttribute("user"));
        session.setAttribute("user", staff);
    }
    response.sendRedirect("main.jsp?update=success");
    %>
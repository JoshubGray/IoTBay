<%@ page import="com.iotbay.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>

<%
String errorField = null;

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
        if (phoneNumber != null && !phoneNumber.isEmpty() && phoneNumber.matches("\\d+")) {
            customerUser.setMobilePhoneNumber(Integer.parseInt(phoneNumber));
        }
        if (mobileNumber != null && !mobileNumber.isEmpty() && mobileNumber.matches("\\d+")) {
            customerUser.setHomePhoneNumber(Integer.parseInt(mobileNumber));
        }

        if (!UserValidation.isEmailValid(customerUser.getEmail())) {
            errorField = "Email";
        } else if (!UserValidation.isPasswordValid(customerUser.getPassword())) {
            errorField = "Password";
        } else if (!UserValidation.isFieldAlphaNum(customerUser.getFirstName())) {
            errorField = "First Name";
        } else if (!UserValidation.isFieldAlphaNum(customerUser.getLastName())) {
            errorField = "Last Name";
        } else if (!UserValidation.isFieldAlphaNum(customerUser.getAddress().getStreetAddress())) {
            errorField = "Street Address";
        } else if (!UserValidation.isPostcodeValid(customerUser.getAddress().getPostcode())) {
            errorField = "Postcode";
        } else if (!UserValidation.isFieldAlphaNum(customerUser.getAddress().getCity())) {
            errorField = "City";
        }

        if (errorField != null) {
            request.setAttribute("errorField", errorField + " input is invalid. Please try again.");
            response.sendRedirect("update_user_details.jsp?errorField=" + URLEncoder.encode((String) request.getAttribute("errorField"), "UTF-8"));            
        } else {
        UserManager.updateUserDetails(customerUser, (CustomerUser)session.getAttribute("user"));
            session.setAttribute("user", customerUser);
        }

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

        if (!UserValidation.isEmailValid(staff.getEmail())) {
            errorField = "Email";
        } else if (!UserValidation.isPasswordValid(staff.getPassword())) {
            errorField = "Password";
        } else if (!UserValidation.isFieldAlphaNum(staff.getFirstName())) {
            errorField = "First Name";
        } else if (!UserValidation.isFieldAlphaNum(staff.getLastName())) {
            errorField = "Last Name";
        }

        if (errorField != null) {
            request.setAttribute("errorField", errorField + " input is invalid. Please try again.");
            response.sendRedirect("update_user_details.jsp?errorField=" + URLEncoder.encode((String) request.getAttribute("errorField"), "UTF-8"));            
        } else {
            UserManager.updateUserDetails(staff, (Staff)session.getAttribute("user"));
            session.setAttribute("user", staff);
        }
    }
    response.sendRedirect("account_details.jsp?update=success");
    %>
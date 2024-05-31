<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.iotbay.*" %>
<%@ page import="java.net.URLEncoder" %>


<%
String registeredUserType = request.getParameter("userType");
String email = request.getParameter("email");
String password = request.getParameter("password"); 
String firstName = request.getParameter("first_name");
String lastName = request.getParameter("last_name");
String errorField = null;

    if (registeredUserType.equals("customer")) {
        Address address = new Address(request.getParameter("street_address"), Integer.parseInt(request.getParameter("postcode")), request.getParameter("city"), request.getParameter("state"));
        String phoneNumber = request.getParameter("phone_number");
        String mobileNumber = request.getParameter("mobile_number");
        User customerUser = new CustomerUser(email, password, firstName, lastName, address);
        if (phoneNumber != null && !phoneNumber.isEmpty() && phoneNumber.matches("\\d+")) {
            ((CustomerUser) customerUser).setMobilePhoneNumber(Integer.parseInt(phoneNumber));
            if (!UserValidation.isPhoneNumberValid(phoneNumber)) {
                errorField = "Home Phone";
            }
        }
        if (mobileNumber != null && !mobileNumber.isEmpty() && mobileNumber.matches("\\d+")) {
            ((CustomerUser) customerUser).setHomePhoneNumber(Integer.parseInt(mobileNumber));
            if (!UserValidation.isPhoneNumberValid(mobileNumber)) {
                errorField = "Mobile Phone";
            }
        }

        /*
        Validation checks for CustomerUser
        */

        if (!UserValidation.isEmailValid(email)) {
            errorField = "Email";
        } else if (!UserValidation.isPasswordValid(password)) {
            errorField = "Password";
        } else if (!UserValidation.isFieldAlphaNum(firstName)) {
            errorField = "First Name";
        } else if (!UserValidation.isFieldAlphaNum(lastName)) {
            errorField = "Last Name";
        } else if (!UserValidation.isFieldAlphaNum(address.getStreetAddress())) {
            errorField = "Street Address";
        } else if (!UserValidation.isPostcodeValid(address.getPostcode())) {
            errorField = "Postcode";
        } else if (!UserValidation.isFieldAlphaNum(address.getCity())) {
            errorField = "City";
        }

        if (errorField != null) {
            request.setAttribute("errorField", errorField + " input is invalid. Please try again.");
            response.sendRedirect("register.jsp?errorField=" + URLEncoder.encode((String) request.getAttribute("errorField"), "UTF-8"));            
        } else {
            session.setAttribute("user", (CustomerUser) customerUser);
            UserManager.addUserToDB(session.getId(), customerUser);
        }        

    } else {
        String staffID = request.getParameter("staff_id");
        String staffType = request.getParameter("staff_type");
        User staff = new Staff(email, password, firstName, lastName);
        if (staffID != null && !staffID.isEmpty() && staffID.matches("\\d+")) {
            ((Staff) staff).setStaffID(Integer.parseInt(staffID));
            if (!UserValidation.isStaffIdInvalid(staffID)) {
                errorField = "Staff Id";
            }
        }
        if (staffID != null && !staffType.isEmpty() && staffType.matches("\\d+")) {
            ((Staff) staff).setStaffTypeID(Integer.parseInt(staffType));
        }

        /*
        Validation checks for Staff
        */

        if (!UserValidation.isEmailValid(email)) {
            errorField = "Email";
        } else if (!UserValidation.isPasswordValid(password)) {
            errorField = "Password";
        } else if (!UserValidation.isFieldAlphaNum(firstName)) {
            errorField = "First Name";
        } else if (!UserValidation.isFieldAlphaNum(lastName)) {
            errorField = "Last Name";
        }

        if (errorField != null) {
            request.setAttribute("errorField", errorField + " input is invalid. Please try again.");
            response.sendRedirect("register.jsp?errorField=" + URLEncoder.encode((String) request.getAttribute("errorField"), "UTF-8"));            
        } else {
            session.setAttribute("user", (Staff) staff);
            UserManager.addUserToDB(session.getId(), staff);
        }
    }

    response.sendRedirect("welcome.jsp");
%>
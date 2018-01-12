<%-- 
    Document   : xxxxxxxxxxxxxxxxxx
    Created on : May 27, 2013, 3:38:00 PM
    Author     : Razer™
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CarPlus Rental Car System</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
    <link type="text/css" href="css/template.css" rel="stylesheet" />
    <link type="text/css" href="css/form.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-2.0.1.js"></script>
    <script type="text/javascript" src="js/jquery_corner.js"></script>
    <script type="text/javascript" src="js/corner_mode.js"></script>
    <script type="text/javascript" src="js/common_mode.js"></script>
    <script type="text/javascript" src="js/datetimepicker_css.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</head>
  
<body>
<div class="main">
    <div class="header" style="background: powderblue">
      <jsp:include page="header.jsp"></jsp:include>
  </div>  
  <div class="content" style="background-color: powderblue;">
    <div class="content_resize">
      <div class="mainbar">
        <%
            String option = request.getParameter("option");
            if (option == null || option.equals("home")) {
        %>
        <jsp:include page="main-content.jsp"></jsp:include>
        <%                            } else if (option.equals("packageTour")) {
        %>
        <jsp:include page="packageTour.jsp"></jsp:include>
        <%                            } else if (option.equals("carRental")) {
        %>
        <jsp:include page="carRental.jsp"></jsp:include>
        <%                            } else if (option.equals("hotel")) {
        %>
        <jsp:include page="hotel.jsp"></jsp:include>
        <%                            } else if (option.equals("flight")) {
        %>
        <jsp:include page="flight.jsp"></jsp:include>
        <%                            } else if (option.equals("aboutUs")) {
        %>
        <jsp:include page="aboutUs.jsp"></jsp:include>
        <%                            } else if (option.equals("login")) {
        %>
        <jsp:include page="login.jsp"></jsp:include>
        <%                            } else if (option.equals("register")) {
        %>
        <jsp:include page="register.jsp"></jsp:include>
        <%                            } else if (option.equals("error")) {
        %>
        <jsp:include page="error.jsp"></jsp:include>
        <%                            } else if (option.equals("tourDetails")) {
        %>
        <jsp:include page="tourDetails.jsp"></jsp:include>
        <%                            } else if (option.equals("tourBooking")) {
        %>
        <jsp:include page="tourBooking.jsp"></jsp:include>
        <%                            } else if (option.equals("tourBookingBill")) {
        %>
        <jsp:include page="tourBookingBill.jsp"></jsp:include>
        <%                            } else if (option.equals("myCart")) {
        %>
        <jsp:include page="myCart.jsp"></jsp:include>
        <%                            } else if (option.equals("editProfile")) {
        %>
        <jsp:include page="editProfile.jsp"></jsp:include>
        <%                            } else if (option.equals("carBooking")) {
        %>
        <jsp:include page="carBooking.jsp"></jsp:include>
        <%                            } else if (option.equals("carBookingBill")) {
        %>
        <jsp:include page="carBookingBill.jsp"></jsp:include>
        <%                            } else if (option.equals("hotelDetails")) {
        %>
        <jsp:include page="hotelDetails.jsp"></jsp:include>
        <%                            } else if (option.equals("infoDesk")) {
        %>
        <jsp:include page="infoDesk.jsp"></jsp:include>
        <%                            } else if (option.equals("searchResult")) {
        %>
        <jsp:include page="searchResult.jsp"></jsp:include>
        <%                            } else if (option.equals("carDetails")) {
        %>
        <jsp:include page="carDetails.jsp"></jsp:include>
        <%                            } else if (option.equals("searchError")) {
        %>
        <jsp:include page="searchError.jsp"></jsp:include>
        <%                            }
        %>
            
      </div>
        
      <div class="sidebar">
        <jsp:include page="right-content.jsp"/>
      </div>
        
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg" style="background-color: powderblue;">
      <jsp:include page="fbg.jsp"></jsp:include>
  </div>
  <div class="footer"style="background-color: powderblue;">
      <jsp:include page="footer.jsp"></jsp:include>
  </div>
</div>
</html>

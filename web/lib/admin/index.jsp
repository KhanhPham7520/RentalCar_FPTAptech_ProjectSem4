<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administator Page</title>
        <link rel="stylesheet" href="../css/layout-admin.css" type="text/css" media="screen" />
	<script src="../js/jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="../js/hideshow.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery.equalHeight.js"></script>
        <script type="text/javascript" src="../js/datetimepicker_css.js"></script>
        
        <link rel="stylesheet" href="css/layout-admin.css" type="text/css" media="screen" />
	<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="js/hideshow.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
    <script type="text/javascript">
        $(function(){
            $('.column').equalHeight();
        });
    </script>
    
    </head>
    <body>
        <c:if test="${user == null}">
            <jsp:forward page="login-admin.jsp"></jsp:forward>
        </c:if>
        <header id="header">
		<hgroup>
			<h1 class="site_title"><a href="#">Administrator</a></h1>
		</hgroup>
	</header> <!-- end of header bar -->
        <section id="secondary_bar">
            <c:if test="${user != null}">
		<div class="user">
			<p>${user.fullname}</p>
                       
		</div>
            </c:if>
            <div class="breadcrumbs_container">
			<article class="breadcrumbs"><a href="#">Administrator Page</a> <div class="breadcrumb_divider"></div> <a class="current">Manager</a></article>
		</div>
	</section><!-- end of secondary bar -->
        <aside id="sidebar" class="column" style="height: 620px; background-color: #B5E5EF;">
            <jsp:include page="menu-right.jsp"/>
	</aside><!-- end of sidebar -->
        
        <section id="main" class="column" style="background-color: blanchedalmond">

            
                <%
                    String option = request.getParameter("option");
                    if (option == null || option.equals("home")) {
                %>
                <jsp:include page="content-messege.jsp"/>
                <%                                        } else if (option.equals("packageTourBooking")) {
                %>
                <jsp:include page="packageTourBooking-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carBooking")) {
                %>
                <jsp:include page="carBooking-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("packageTourManage")) {
                %>
                <jsp:include page="packageTourManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carManage")) {
                %>
                <jsp:include page="carManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("tourTypeManage")) {
                %>
                <jsp:include page="tourTypeManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("foodManage")) {
                %>
                <jsp:include page="foodManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("locationManage")) {
                %>
                <jsp:include page="locationManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carModelManage")) {
                %>
                <jsp:include page="carModelManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carTypeManage")) {
                %>
                <jsp:include page="carTypeManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("hotelManage")) {
                %>
                <jsp:include page="hotelManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("flightManage")) {
                %>
                <jsp:include page="flightManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("userManage")) {
                %>
                <jsp:include page="userManage-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("editUser")) {
                %>
                <jsp:include page="editProfile-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("flightEdit")) {
                %>
                <jsp:include page="flightEdit-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("hotelEdit")) {
                %>
                <jsp:include page="hotelEdit-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carEdit")) {
                %>
                <jsp:include page="carEdit-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("tourEdit")) {
                %>
                <jsp:include page="packageTourEdit-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("tourBookingDetails")) {
                %>
                <jsp:include page="tourBookingDetails-new.jsp"></jsp:include>
                <%                                        }else if (option.equals("carBookingDetails")) {
                %>
                <jsp:include page="carBookingDetails-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("carAnalysis")) {
                %>
                <jsp:include page="carAnalysis-new.jsp"></jsp:include>
                <%                                        }else if (option.equals("tourAnalysis")) {
                %>
                <jsp:include page="tourAnalysis-new.jsp"></jsp:include>
                <%                                        } else if (option.equals("editRole")) {
                %>
                <jsp:include page="userEdit-new.jsp"></jsp:include>
                <%                                        }
                %> 
            <div class="spacer"></div>
	</section>
        
    </body>
</html>

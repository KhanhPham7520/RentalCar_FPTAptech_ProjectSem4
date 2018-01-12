<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
		<h3>Bookings</h3>
		<ul class="toggle">
			<li class="icn_new_article"><html:link action="/TourBookingAction.do?method=list">Tour Booking</html:link></li>
			<li class="icn_edit_article"><html:link action="/CarBookingAction.do?method=list">Car Rentals</html:link></li>
		</ul>
		<h3>Items</h3>
		<ul class="toggle">
			<li class="icn_add_user"><html:link action="/TourAction.do?method=list">Package Tour</html:link></li>
			<li class="icn_view_users"><html:link action="/CarAction.do?method=list">Cars</html:link></li>
		</ul>
		<h3>Categories</h3>
		<ul class="toggle">
			<li class="icn_folder"><html:link action="/TourTypeAction.do?method=list">Tour Type</html:link></li>
			<li class="icn_audio"><html:link action="/LocationAction.do?method=list">Location</html:link></li>
			<li class="icn_video"><html:link action="/CarModelAction.do?method=list">Car Model</html:link></li>
                        <li class="icn_video"><html:link action="/CarTypeAction.do?method=list">Car Type</html:link></li>
		</ul>
                <h3>Sales Analysis</h3>
		<ul class="toggle">
			<li class="icn_folder"><html:link action="/CarAnalysisAction.do?method=list">Car Service</html:link></li>
			<li class="icn_photo"><html:link action="/TourAnalysisAction.do?method=list">Tour Service</html:link></li>
		</ul>
                <h3>Users</h3>
		<ul class="toggle">
			<li class="icn_settings"><html:link action="/UserAction.do?method=list">Manage User</html:link></li>
			<li class="icn_security"><html:link action="/UserAction.do?method=edit&email=${user.email}">Edit</html:link></li>
			<li class="icn_jump_back"> <html:link styleClass="logout_user" action="/LoginAction.do?method=logout">Logout</html:link></li>
		</ul>


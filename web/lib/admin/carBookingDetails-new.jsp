<%-- 
    Document   : carBookingDetails-new
    Created on : Jun 4, 2013, 1:59:17 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%
    String path = "images/products/cars/";
%>
<!DOCTYPE html>
<h4 class="alert_info">Manage Car Booking</h4>
<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form action="/CarBookingAction.do?method=list" method="POST" >
                    <header><h3>Car Booking Details</h3></header>
                        <div class="module_content"> 
                            <logic:notEmpty name="users">
                                <logic:iterate name="users" id="user">
                                    <c:if test="${user.id == item.userId}">
                                        <fieldset>
                                            <label>Fullname:</label> ${user.fullname}
                                        </fieldset>
                                        <fieldset>
                                            <label>Address:</label> ${user.address} 
                                        </fieldset>
                                        <fieldset>
                                            <label>Phone:</label> ${user.phone}
                                        </fieldset>
                                        <fieldset>
                                            <label>Email:</label> ${user.email}
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <logic:notEmpty name="cars">
                                <logic:iterate name="cars" id="car">
                                    <c:if test="${car.id == item.carId}">
                                        <fieldset>
                                            <label>Car name:</label> ${car.name}
                                        </fieldset>
                                        <fieldset>
                                            <label>Seating capacity:</label> ${car.seatingCapacity}
                                        </fieldset>
                                        <fieldset>
                                            <label>Price</label> ${car.price} $
                                        </fieldset>
                                        <fieldset>
                                            <label>Images</label> <img src="<%=path%>${car.images}" height="120px" width="180px"/>
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <fieldset>
                                <label>Booking Date:</label> ${item.createdOn}
                            </fieldset>
                            <fieldset>
                                <label>Pick Up Date:</label> ${item.pickUpDate}
                            </fieldset>
                            <fieldset>
                                <label>Drop Up Date:</label> ${item.dropUpDate}
                            </fieldset>
                            <fieldset>
                                <label>Total:</label> <strong>${item.price} $</strong> 
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">   
                            <html:cancel value="Back Booking List" styleClass="alt_btn"/>
                        </div>
                    </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article -->

<!--
<article class="module width_full">
    <logic:notEmpty name="item2">
            <html:form action="/CarBookingAction.do?method=list" method="POST" >
                    <header><h3>Car Booking Details</h3></header>
                        <div class="module_content"> 
                            <logic:notEmpty name="users">
                                <logic:iterate name="users" id="user">
                                    <c:if test="${user.id == item2.userId}">
                                        <fieldset>
                                            <label>Fullname:</label> ${user.fullname}
                                        </fieldset>
                                        <fieldset>
                                            <label>Address:</label> ${user.address} 
                                        </fieldset>
                                        <fieldset>
                                            <label>Phone:</label> ${user.phone}
                                        </fieldset>
                                        <fieldset>
                                            <label>Email:</label> ${user.email}
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <logic:notEmpty name="cars">
                                <logic:iterate name="cars" id="car">
                                    <c:if test="${car.id == item2.carId}">
                                        <fieldset>
                                            <label>Car name:</label> ${car.name}
                                        </fieldset>
                                        <fieldset>
                                            <label>Seating capacity:</label> ${car.seatingCapacity}
                                        </fieldset>
                                        <fieldset>
                                            <label>Price</label> ${car.price} $
                                        </fieldset>
                                        <fieldset>
                                            <label>Images</label> <img src="<%=path%>${car.images}" height="120px" width="180px"/>
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <fieldset>
                                <label>Booking Date:</label> ${item.createdOn}
                            </fieldset>
                            <fieldset>
                                <label>Pick Up Date:</label> ${item.pickUpDate}
                            </fieldset>
                            <fieldset>
                                <label>Delete Date:</label> ${item2.modifiedOn}
                            </fieldset>
                            <fieldset>
                                <label>Refund:</label> <strong>${item2.refund} $</strong>
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">   
                            <html:cancel value="Back Booking List" styleClass="alt_btn"/>
                        </div>
                    </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article --> 
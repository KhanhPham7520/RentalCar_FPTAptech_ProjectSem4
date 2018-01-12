<%-- 
    Document   : tourBookingDetails-new
    Created on : Jun 4, 2013, 1:41:59 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<!DOCTYPE html>
<h4 class="alert_info">Manage Package Tours Booking</h4>
<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form action="/TourBookingAction.do?method=list" method="POST" >
                    <header><h3>Package Tour Booking Details</h3></header>
                        <div class="module_content"> 
                            <logic:notEmpty name="users">
                                <logic:iterate name="users" id="user">
                                    <c:if test="${user.id == item.user_id}">
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
                            <logic:notEmpty name="tours">
                                <logic:iterate name="tours" id="tour">
                                    <c:if test="${tour.id == item.package_id}">
                                        <fieldset>
                                            <label>Tour:</label> ${tour.name}
                                        </fieldset>
                                        <fieldset>
                                            <label>Start Date:</label> ${tour.start_date} 
                                        </fieldset>
                                        <fieldset>
                                            <label>Return Date:</label> ${tour.return_date}
                                        </fieldset>
                                        <fieldset>
                                            <label>Tour Price:</label> ${tour.price} $
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <fieldset>
                                <label>Participants:</label> ${item.participants}
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
            <html:form action="/TourBookingAction.do?method=list" method="POST" >
                    <header><h3>Package Tour Booking Details</h3></header>
                        <div class="module_content"> 
                            <logic:notEmpty name="users">
                                <logic:iterate name="users" id="user">
                                    <c:if test="${user.id == item2.user_id}">
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
                            <logic:notEmpty name="tours">
                                <logic:iterate name="tours" id="tour">
                                    <c:if test="${tour.id == item2.package_id}">
                                        <fieldset>
                                            <label>Tour:</label> ${tour.name}
                                        </fieldset>
                                        <fieldset>
                                            <label>Start Date:</label> ${tour.start_date} 
                                        </fieldset>
                                        <fieldset>
                                            <label>Booking Date:</label> ${item2.created_on}
                                        </fieldset>
                                        <fieldset>
                                            <label>Delete Booking Date:</label> ${item2.modified_on}
                                        </fieldset>
                                        <fieldset>
                                            <label>Tour Price:</label> ${tour.price} $
                                        </fieldset>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                            <fieldset>
                                <label>Participants:</label> ${item2.participants}
                            </fieldset>
                            <fieldset>
                                <label>Refund:</label> <strong> ${item2.refund} </strong> 
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
<%-- 
    Document   : tourBookingBill
    Created on : May 27, 2013, 6:17:51 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<%
    String path = "images/products/tours/";
%>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Tour Booking Bill Details</span></h2>
        </div>
            <logic:notEmpty name="item">
                <div style="color: red; font-weight: bold; font-size: 12px; margin-left: 235px;">Your Order Successfully:</div>
                <html:form method="POST" action="/TourBookingAction.do?method=submit">
                    <div class="product_list">
                        <div class="leftPosition">
                            <div class="browse_1">
                                <div class="bottom_separator">
                                    <div class="clear">
                                        <html:hidden name="item" property="id"/>
                                        <div class="browseProductImageContainer"> 
                                            <html:link href=""> 
                                                <img class="browseProductImage" src="<%=path%>${item.image}" height="150" width="200" border="0" />
                                            </html:link> 
                                        </div>
                                        <div class="floatElement">
                                            <h2 class="browseProductTitle"> 
                                                <html:link styleClass="product_name" href="">
                                                    <bean:write name="item" property="name"/>
                                                </html:link>
                                            </h2>
                                            <div class="browsePriceContainer">
                                                <span class="productPrice">Price: <bean:write name="item" property="price"/> $</span> 
                                            </div>
                                            <div class="browsePriceContainer"><strong>Duration: </strong> </div>
                                            <div class="browsePriceContainer"><strong>Start date: <bean:write name="item" property="start_date"/></strong> </div>
                                            <div class="browsePriceContainer"><strong>Return date: <bean:write name="item" property="return_date"/></strong> </div>
                                            <div class="browsePriceContainer">
                                                <strong>Package Type: 
                                                    <c:forEach items="${packageTourTypeList}" var="type">
                                                        <c:if test="${type.id == item.type_id}">
                                                            <c:out value="${type.name}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </strong> 
                                            </div> 

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br class="clr" />
                        <div id="infoDetails2">
                            <logic:notEmpty name="user">
                                <b>Your Personal Information</b><br/>
                                <html:hidden name="user" property="id"/>
                                <b>Full name:</b> <bean:write name="user" property="fullname"/> <br/>
                                <b>Address:</b> <bean:write name="user" property="address"/> <br/>
                                <b>Phone:</b> <bean:write name="user" property="phone"/> <br/>
                                <b>Nationality:</b> <bean:write name="user" property="nationality"/> <br/>
                                <b>Email:</b> <bean:write name="user" property="email"/> <br/>
                                <logic:notEmpty name="tourBooking">
                                    <strong style="color: red"> <b>Total:</b> ${1 * item.price} $</strong> <br/> 
                                    <b>Booking Date:</b> <bean:write name="tourBooking" property="created_on"/><br/>
                                </logic:notEmpty>
                            </logic:notEmpty>
                        </div>
                    </div>
                    <br class="clr" />
                </html:form>
            </logic:notEmpty>
            <br class="clr" />
        </div>
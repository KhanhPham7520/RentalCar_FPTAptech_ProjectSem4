<%-- 
    Document   : tourDetails
    Created on : May 27, 2013, 6:12:18 PM
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
          <h2><span>Package Tours</span></h2>
        </div>
            <logic:notEmpty name="item">
                <html:form method="POST" action="/TourBookingAction.do?method=booking&id=${item.id}">
                    <div class="product_list">
                        <div class="leftPosition">
                            <div class="browse_1">
                                <div class="bottom_separator">
                                    <div class="clear">
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
                                            <div class="browseAddToCartContainer">
                                                <div class="quantity">
                                                    <html:submit styleClass="addtocart_button" value="Book Now"/>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <br class="clr" />
                    </div>
                    <div id="infoDetails">
                        <strong>Locations in Package:</strong> 
                        <logic:notEmpty name="tourLocations">
                            <logic:iterate name="tourLocations" id="it">
                                <bean:write name="it" property="name"/> |
                            </logic:iterate>
                        </logic:notEmpty>
                    </div>
                    <div id="infoDetails">
                        <strong>Hotels in Package:</strong> 
                        <logic:notEmpty name="tourHotels">
                            <logic:iterate name="tourHotels" id="it">
                                <bean:write name="it" property="name"/> |
                            </logic:iterate>
                        </logic:notEmpty>
                    </div>
                    <div id="infoDetails">
                        <strong>Foods in Package:</strong> 
                        <logic:notEmpty name="foodLocations">
                            <logic:iterate name="foodLocations" id="it">
                                <bean:write name="it" property="name"/> |
                            </logic:iterate>
                        </logic:notEmpty>
                    </div>
                    <div id="infoDetails">
                        <strong>Details:</strong>
                        ${item.description}
                    </div>                       
                    <br class="clr" />
                </html:form>
            </logic:notEmpty>
            <br class="clr" />
        </div>

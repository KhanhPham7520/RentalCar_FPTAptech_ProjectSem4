<%-- 
    Document   : searchResult
    Created on : May 27, 2013, 6:36:34 PM
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
            String path2 = "images/products/cars/";
%>
<div id="vmMainPage">
            <logic:notEmpty name="tours">
                <div class="article">
                  <h2><span>Search Result</span></h2>
                </div>
                <logic:iterate name="tours" id="item">
                    <html:form method="POST" action="/TourAction.do?method=details&id=${item.id}">
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
                                                    <html:link styleClass="product_name" action="/TourAction.do?method=details&id=${item.id}">
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
                                                <div class="browsePriceContainer">
                                                    <html:link styleClass="product_name2" action="/TourAction.do?method=details&id=${item.id}">
                                                        View Details...
                                                    </html:link>
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
                        <br class="clr" />
                    </html:form>
                </logic:iterate>
            </logic:notEmpty>

            <logic:notEmpty name="cars">
                <div class="clear">
                    <h3 class="categoryName"> Search Result</h3>
                    <div></div>
                </div>
                <logic:iterate name="cars" id="item">
                    <html:form method="POST" action="/CarBookingAction.do?method=booking&id=${item.id}">
                        <div class="product_list">
                            <div class="leftPosition">
                                <div class="browse_1">
                                    <div class="bottom_separator">
                                        <div class="clear">
                                            <div class="browseProductImageContainer">
                                                <html:link href="">
                                                    <img class="browseProductImage" src="<%=path2%>${item.images}" height="150" width="200" border="0" />
                                                </html:link>
                                            </div>
                                            <div class="floatElement">
                                                <h2 class="browseProductTitle">
                                                    <html:link styleClass="product_name" href="#">
                                                        <bean:write name="item" property="name"/>
                                                    </html:link>
                                                </h2>
                                                <div class="browsePriceContainer">
                                                    <span class="productPrice">Price: <bean:write name="item" property="price"/> $</span>
                                                </div>
                                                <div class="browsePriceContainer">
                                                    <strong>Car Model:
                                                        <c:forEach items="${modelList}" var="model">
                                                            <c:if test="${model.id == item.modelId}">
                                                                <c:out value="${model.name}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </strong>
                                                </div>
                                                <div class="browsePriceContainer">
                                                    <strong>Car Type:
                                                        <c:forEach items="${typeList}" var="type">
                                                            <c:if test="${type.id == item.typeId}">
                                                                <c:out value="${type.name}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </strong>
                                                </div>
                                                <div class="browsePriceContainer"><strong>Seating Capacity: <bean:write name="item" property="seatingCapacity"/></strong> </div>
                                                <div class="browsePriceContainer"><strong>Air Conditioner:
                                                        <c:if test="${item.airConditioner == 1}">
                                                            Yes
                                                        </c:if>
                                                        <c:if test="${item.airConditioner == 0}">
                                                            No
                                                        </c:if>
                                                    </strong> </div>

                                                <div class="browseAddToCartContainer">
                                                    <div class="quantity">
                                                        <html:submit styleClass="addtocart_button" value="Car  Rental"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br class="clr" />
                        </div>
                        <br class="clr" />
                    </html:form>
                </logic:iterate>
            </logic:notEmpty>
            <logic:notEmpty name="hotels">
                <div class="clear">
                    <h3 class="categoryName">Search Result</h3>
                    <div></div>
                </div>
                <logic:iterate name="hotels" id="item">
                    <div class="product_list">
                        <div class="leftPosition">
                            <div class="browse_1">
                                <div class="bottom_separator">
                                    <div class="clear">
                                        <div style="margin-left: 50px;">
                                            <h2>
                                                <html:link styleClass="product_name" action="/HotelAction.do?method=details&id=${item.id}">
                                                    <bean:write name="item" property="name"/>
                                                </html:link>
                                            </h2>
                                            <div class="browsePriceContainer">
                                                <span class="productPrice">Price Range: <bean:write name="item" property="price_range"/> $</span>
                                            </div>
                                            <div class="browsePriceContainer"><strong>Address: <bean:write name="item" property="address"/></strong> </div>
                                            <div class="browsePriceContainer"><strong>Phone<bean:write name="item" property="phone"/></strong> </div>
                                            <div class="browsePriceContainer">
                                                <strong>Location:
                                                    <logic:notEmpty name="locationList">
                                                        <logic:iterate name="locationList" id="lo">
                                                            <c:if test="${lo.id == item.location_id}">
                                                                <c:out value="${lo.name}"/>
                                                            </c:if>
                                                        </logic:iterate>
                                                    </logic:notEmpty>
                                                </strong>
                                            </div>
                                            <div class="browsePriceContainer">
                                                <html:link styleClass="product_name2" action="/HotelAction.do?method=details&id=${item.id}">
                                                    View Description...
                                                </html:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br class="clr" />
                    </div>
                    <br class="clr" />
                </logic:iterate>
            </logic:notEmpty>
            <logic:notEmpty name="flights">
                <div class="clear">
                    <h3 class="categoryName">Search Result</h3>
                    <div></div>
                </div>
                <logic:iterate name="flights" id="item">
                    <div class="product_list">
                        <div class="leftPosition" style="padding: 0px; margin: 0px;">
                            <div class="browse_1">
                                <div class="bottom_separator">
                                    <div class="clear">
                                        <div style="margin-left: 50px;">
                                            <h2>
                                                <html:link styleClass="product_name" href="#">
                                                    <bean:write name="item" property="name"/>
                                                </html:link>
                                            </h2>
                                            <div class="browsePriceContainer">
                                                <span style="font-size: 13px;">Departure City:
                                                    <c:forEach items="${locationList}" var="loca">
                                                        <c:if test="${loca.id == item.departure_city}">
                                                            <span style="font-size: 16px; color: #000;"><c:out value="${loca.name}"/></span>
                                                            <span style="margin-left: 5px;"> Departure Time: <bean:write name="item" property="departure_time"/></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </span>
                                            </div>
                                            <div class="browsePriceContainer" style="margin-bottom: 10px;">
                                                <span style="font-size: 13px;">Arrival City:
                                                    <c:forEach items="${locationList}" var="loca">
                                                        <c:if test="${loca.id == item.arrival_city}">
                                                            <span style="font-size: 16px; color: #000;"><c:out value="${loca.name}"/></span>
                                                            <span style="margin-left: 5px;"> Arrival Time:<bean:write name="item" property="arrival_time"/></span>
                                                        </c:if>
                                                    </c:forEach>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br class="clr" />
                    </div>
                    <br class="clr" />
                </logic:iterate>
            </logic:notEmpty>
        </div>

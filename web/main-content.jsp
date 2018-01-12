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
        <div class="article">
          <h2><span>Package Tours</span></h2>
        </div>
            <logic:notEmpty name="tours">
                <logic:iterate name="tours" id="item">
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
        <div class="article">
          <h2><span>Cars Rentals</span></h2>
        </div>
            <logic:notEmpty name="cars">
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
        </div>

<%-- 
    Document   : carRental
    Created on : May 27, 2013, 6:30:19 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<!DOCTYPE html>
<%
    String path = "images/products/cars/";
%>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Car Rentals</span></h2>
        </div>
            <pg:pager url="CarAction.do" maxIndexPages="3" maxPageItems="4">
                <logic:notEmpty name="list">
                    <logic:iterate name="list" id="item">
                        <pg:item>
                            <html:form method="POST" action="/CarBookingAction.do?method=booking&id=${item.id}">
                                <div class="product_list">
                                    <div class="leftPosition">
                                        <div class="browse_1">
                                            <div class="bottom_separator">
                                                <div class="clear">
                                                    <div class="browseProductImageContainer"> 
                                                        <html:link href=""> 
                                                            <img class="browseProductImage" src="<%=path%>${item.images}" height="150" width="200" border="0" />
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
                        </pg:item>
                    </logic:iterate>
                </logic:notEmpty>

                <div class="nav_next" align="center">
                    <ul class="pagination">
                        <pg:index>
                            <pg:first>
                                <a class="nav_next" href="<%= pageUrl%>&method=listclient"><span class="pagenav">«« Start</span></a>
                            </pg:first>
                            <pg:prev>
                                <a class="nav_next" href="<%= pageUrl%>&method=listclient"><span class="pagenav">« Prev</span></a>
                            </pg:prev>
                            <pg:pages>
                                <a class="nav_next" href="<%= pageUrl%>&method=listclient"> <span class="pagenav"><%= pageNumber%></span></a>
                            </pg:pages>
                            <pg:next>
                                <a class="nav_next" href="<%= pageUrl%>&method=listclient"><span class="pagenav">Next »</span></a>
                            </pg:next>
                            <pg:last>
                                <a class="nav_next" href="<%= pageUrl%>&method=listclient"><span class="pagenav">End »»</span></a>
                            </pg:last>
                        </pg:index>
                    </ul>
                </div>
            </pg:pager>
        </div>

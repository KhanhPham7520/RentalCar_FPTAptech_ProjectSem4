<%-- 
    Document   : carDetails
    Created on : May 27, 2013, 6:03:42 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<%
    String path = "images/products/cars/";
%>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Cars Details</span></h2>
        </div>
            <logic:notEmpty name="item">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br class="clr" />
                </div>
                <br class="clr" />
            </logic:notEmpty>
        </div>

<%-- 
    Document   : hotel
    Created on : May 27, 2013, 6:06:06 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<!DOCTYPE html>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Hotel</span></h2>
        </div>
            <pg:pager url="HotelAction.do" maxIndexPages="3" maxPageItems="5">
                <logic:notEmpty name="list">
                    <logic:iterate name="list" id="item">
                        <pg:item>
                            <div class="product_list">
                                <div class="leftPosition">
                                    <div class="browse_1">
                                        <div class="bottom_separator">
                                            <div class="clear">
                                                <div class="browseProductImageContainer"> 
                                                    <html:link href=""> 
                                                        <img class="browseProductImage" src="images/hotel-icon.gif" border="0" />
                                                    </html:link> 
                                                </div>
                                                <div class="floatElement">
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

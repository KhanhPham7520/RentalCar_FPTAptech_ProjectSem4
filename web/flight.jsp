<%-- 
    Document   : flight
    Created on : May 27, 2013, 6:08:47 PM
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
          <h2><span>Flights</span></h2>
        </div>
            <pg:pager url="FlightAction.do" maxIndexPages="3" maxPageItems="8">
                <logic:notEmpty name="list">
                    <logic:iterate name="list" id="item">
                        <pg:item>
                            <div class="product_list">
                                <div class="leftPosition" style="padding: 0px; margin: 0px;">
                                    <div class="browse_1">
                                        <div class="bottom_separator">
                                            <div class="clear">
                                                <div class="browseProductImageContainer"> 
                                                    <html:link href=""> 
                                                        <img class="browseProductImage" src="images/flight-icon.jpg" border="0" />
                                                    </html:link> 
                                                </div>
                                                <div style="margin-left: 100px;">
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
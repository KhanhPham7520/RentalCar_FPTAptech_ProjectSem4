<%-- 
    Document   : packageTourBooking-new
    Created on : Jun 2, 2013, 9:40:09 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%@taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>

<script type="text/javascript">
    function confirmDelete(){
        return confirm("Are you sure want delete this package tour booking?");
    }
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
        <header><h3 class="tabs_involved">List Package Tours Booking</h3>
        </header>

        <div>
            <logic:notEmpty name="list">
            <pg:pager url="TourBookingAction.do" maxIndexPages="3" maxPageItems="6">
                <table class="tablesorter" cellspacing="0"> 
                <thead> 
                        <tr> 
                        <th>Fullname</th>
                        <th>Tour Name</th>
                        <th>Price</th>
                        <th>Book Date</th>
                        <th>Actions</th> 
                        </tr> 
                </thead> 
                <tbody>
                    <c:forEach items="${list}" var="tourBooking">
                        <pg:item>
                        <tr>
                            
                            <td> 
                                <logic:notEmpty name="users">
                                    <logic:iterate name="users" id="user">
                                        <c:if test="${user.id == tourBooking.user_id}">
                                            <c:out value="${user.fullname}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </td>
                            <td>
                                <logic:notEmpty name="tours">
                                    <logic:iterate name="tours" id="tour">
                                        <c:if test="${tour.id == tourBooking.package_id}">
                                            <c:out value="${tour.name}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </td>
                            <td>${tourBooking.price}</td>
                            <td>${tourBooking.created_on}</td>
                            <td><html:link action="/TourBookingAction.do?method=details&id=${tourBooking.id}">Details</html:link>
                           |
                                <html:link onclick="return confirmDelete();" action="/TourBookingAction.do?method=delete&id=${tourBooking.id}">Delete</html:link>
                            </td>
                        </tr>
                        </pg:item>
                    </c:forEach>
                </tbody> 
                </table>
        </div><!-- end of .tab_container -->
                    <div class="nav_next" align="center">
        <ul class="pagination">
            <pg:index>
                <pg:first>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">«« Start</span></a>
                </pg:first>
                <pg:prev>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">« Prev</span></a>
                </pg:prev>
                <pg:pages>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"> <span class="pagenav"><%= pageNumber%></span></a>
                </pg:pages>
                <pg:next>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">Next »</span></a>
                </pg:next>
                <pg:last>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">End »»</span></a>
                </pg:last>
            </pg:index>
        </ul></pg:pager>
                    </logic:notEmpty>
            
    </div>

</article><!-- end of content manager article -->
        
<article class="module width_3_quarter">
    <header><h3 class="tabs_involved">Package TourBooking Manager</h3>
    </header>

    <div>
        <logic:notEmpty name="listDes">
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Fullname</th>
                    <th>Tour Name</th>
                    <th>Price</th>
                    <th>Delete Date</th>
                    <th>Refund</th>
                    <th>Actions</th> 
                    </tr> 
            </thead> 
            <tbody>
                <c:forEach items="${listDes}" var="tourBooking">
                        <tr>
                        <td> 
                            <logic:notEmpty name="users">
                                <logic:iterate name="users" id="user">
                                    <c:if test="${user.id == tourBooking.user_id}">
                                        <c:out value="${user.fullname}"/>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                        </td>
                        <td>
                            <logic:notEmpty name="tours">
                                <logic:iterate name="tours" id="tour">
                                    <c:if test="${tour.id == tourBooking.package_id}">
                                        <c:out value="${tour.name}"/>
                                    </c:if>
                                </logic:iterate>
                            </logic:notEmpty>
                        </td>
                        <td>${tourBooking.price}</td>
                        <td>${tourBooking.modified_on}</td>
                        <td>${tourBooking.refund}</td> 
                        <td>
                            <html:link action="/TourBookingAction.do?method=details2&id=${tourBooking.id}">Details</html:link> | <html:link onclick="return confirmDelete();" action="/TourBookingAction.do?method=delete&id=${tourBooking.id}">Delete</html:link>
                        </td> 
                        </tr>
                </c:forEach>
            </tbody> 
            </table>
        </logic:notEmpty>

    </div><!-- end of .tab_container -->

</article><!-- end of content manager article -->
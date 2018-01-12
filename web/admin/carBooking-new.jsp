<%-- 
    Document   : carBooking-new
    Created on : Jun 2, 2013, 11:08:30 PM
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
        return confirm("Are you sure want delete this car rentail?");
    }
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">List Cars Rentals</h3>
		</header>

		<div class="tab_container">
                    
                    <div id="tab1" class="tab_content">
                        <pg:pager url="CarBookingAction.do" maxIndexPages="3" maxPageItems="6">                  
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
    				<th>Fullname</th>
                                <th>Car Name</th>
                                <th>Pick up date</th>
                                <th>Drop up date</th>
    				<th>Price</th>
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody>
                             <logic:notEmpty name="list">
                                <logic:iterate name="list" id="item">
                                    <pg:item>
                                    <tr>
                                    <td> 
                                        <logic:notEmpty name="users">
                                            <logic:iterate name="users" id="user">
                                                <c:if test="${user.id == item.userId}">
                                                    <c:out value="${user.fullname}"/>
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </td>
                                    <td>
                                        <logic:notEmpty name="cars">
                                            <logic:iterate name="cars" id="car">
                                                <c:if test="${car.id == item.carId}">
                                                    <c:out value="${car.name}"/>
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </td>
                                    <td>${item.pickUpDate}</td>
                                    <td>${item.dropUpDate}</td>
                                    <td>${item.price} $</td>
                                    <td>
                                        <html:link action="/CarBookingAction.do?method=details&id=${item.id}">Details</html:link> | <html:link onclick="return confirmDelete();" action="/CarBookingAction.do?method=delete&id=${item.id}">Delete</html:link>
                                    </td> 
                                    </tr>
                                    </pg:item>
                                </logic:iterate>
                             </logic:notEmpty>
			</tbody> 
			</table>
                    
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
        </ul>
    </div>
                        </pg:pager>
			</div><!-- end of #tab1 -->

		</div><!-- end of .tab_container -->
		
        </article><!-- end of content manager article -->
        
<article class="module width_3_quarter">
        <header><h3 class="tabs_involved">Car Rentals Manager</h3>
        </header>

        <div class="tab_container">
            <div id="tab1" class="tab_content">
            <logic:notEmpty name="listDes">
                <table class="tablesorter" cellspacing="0"> 
                <thead> 
                        <tr> 
                        <th>Fullname</th>
                        <th>Car Name</th>
                        <th>Pick up date</th>
                        <th>Delete Date</th>
                        <th>Refund</th>
                        <th>Actions</th> 
                        </tr> 
                </thead> 
                <tbody>
                    <logic:iterate name="listDes" id="item">
                            <tr>
                            <td> 
                                <logic:notEmpty name="users">
                                    <logic:iterate name="users" id="user">
                                        <c:if test="${user.id == item.userId}">
                                            <c:out value="${user.fullname}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </td>
                            <td>
                                <logic:notEmpty name="cars">
                                    <logic:iterate name="cars" id="car">
                                        <c:if test="${car.id == item.carId}">
                                            <c:out value="${car.name}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </td>
                            <td>${item.pickUpDate}</td>
                            <td>${item.modifiedOn}</td>
                            <td>${item.refund}</td>
                            <td>
                                <html:link action="/CarBookingAction.do?method=details2&id=${item.id}">Details</html:link> | <html:link onclick="return confirmDelete();" action="/CarBookingAction.do?method=delete&id=${item.id}">Delete</html:link>
                            </tr>
                    </logic:iterate>
                </tbody> 
                </table>
            </logic:notEmpty>
                </div><!-- end of #tab1 -->

        </div><!-- end of .tab_container -->

        </article><!-- end of content manager article -->

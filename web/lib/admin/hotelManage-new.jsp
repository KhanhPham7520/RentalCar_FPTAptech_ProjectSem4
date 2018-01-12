<%-- 
    Document   : hotelManage-new
    Created on : May 31, 2013, 9:35:37 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>

<script>
    function confirmDelete(){
        return confirm("Are you sure want delete this hotel?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">Hotel Manager</h3>
                <html:link action="/HotelAction.do?method=addHotel" styleClass="imgAdd">
                    <img alt="" src="images/icons/add_48.png"/>
                </html:link>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
    				<th>Name</th> 
    				<th>Location</th>
                                <th>Phone</th>
                                <th>Price Range</th> 
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody>
                            <c:if test="${list != null}">
                                <c:forEach items="${list}" var="type">
                                    <tr>
                                    <td><html:link action="/HotelAction.do?method=edit&id=${type.id}">${type.name}</html:link></td>
                                    <td>
                                        <logic:notEmpty name="locationList">
                                            <logic:iterate name="locationList" id="lo">
                                                <c:if test="${lo.id == type.location_id}">
                                                    <c:out value="${lo.name}"/>
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </td>
                                    <td>${type.phone}</td>
                                    <td>${type.price_range} $</td>
                                    <td>
                                        <html:link action="/HotelAction.do?method=edit&id=${type.id}">Edit</html:link> | <html:link onclick="return confirmDelete();" action="/HotelAction.do?method=delete&id=${type.id}">Delete</html:link>
                                    </td> 
                                    </tr>
                                </c:forEach>
                            </c:if>
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->

		</div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->


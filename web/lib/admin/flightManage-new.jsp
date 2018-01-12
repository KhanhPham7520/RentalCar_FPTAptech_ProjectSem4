<%-- 
    Document   : flightManage-new
    Created on : May 31, 2013, 9:46:19 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script>
    function confirmDelete(){
        return confirm("Are you sure want delete this fight?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">Fight Manager</h3>
                <html:link action="/FlightAction.do?method=addFlight" styleClass="imgAdd">
                    <img alt="" src="images/icons/add_48.png"/>
                </html:link>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
    				<th>Name</th> 
    				<th>Departure City</th>
                                <th>Departure Time</th>
                                <th>Arrival City</th> 
                                <th>Arrival Time</th>
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody>
                            <c:if test="${list != null}">
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                    <td>${item.name}</td>
                                        <td> 
                                            <c:forEach items="${locationList}" var="loca">
                                                <c:if test="${loca.id == item.departure_city}">
                                                    <c:out value="${loca.name}"/>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${item.departure_time}</td>
                                        <td>
                                            <c:forEach items="${locationList}" var="loca">
                                                <c:if test="${loca.id == item.arrival_city}">
                                                    <c:out value="${loca.name}"/>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${item.arrival_time}</td>
                                        <td>
                                        <html:link action="/FlightAction.do?method=edit&id=${item.id}">Edit</html:link> | <html:link action="/FlightAction.do?method=delete&id=${item.id}" onclick="return confirmDelete();">Delete</html:link>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->

		</div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->



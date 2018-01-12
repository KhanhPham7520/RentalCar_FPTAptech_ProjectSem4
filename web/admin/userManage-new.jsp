<%-- 
    Document   : userManage-new
    Created on : May 31, 2013, 9:56:50 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script>
    function confirmDelete(){
        return confirm("Are you sure want delete this user?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">User Manager</h3>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
    				<th>FullName</th> 
    				<th>Address</th>
                                <th>Email</th>
    				<th>Actions</th> 
				</tr> 
			</thead> 
			<tbody>
                            <logic:notEmpty name="list">
                                <logic:iterate name="list" id="user">
                                    <tr>
                                    <td>${user.fullname}</td>
                                    <td>${user.address}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <html:link action="/UserAction.do?method=editRole&email=${user.email}">Edit</html:link> | <html:link onclick="return confirmDelete();" action="/UserAction.do?method=delete&id=${user.id}">Delete</html:link>
                                    </td> 
                                    </tr>
                                </logic:iterate>
                            </logic:notEmpty>
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->

		</div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->

<%-- 
    Document   : tourTypeManage-new
    Created on : Jun 1, 2013, 4:19:04 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script>
    function validTourType(){
        var name = document.forms["PackageTourTypes"]["name"].value;
        
        if(name =="" || name == null){
            alert("Please enter name of package tour type!");
            return false;
        }
        return true;
    }
    
    function confirmDelete(){
        return confirm("Are you sure want delete this Tour type?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_full">
    <logic:empty name="tourType">
        <html:form onsubmit="return validTourType();" action="/TourTypeAction.do?method=add" method="POST">
        <header><h3>Add Tour Type new</h3></header>
                <div class="module_content">                                   
                                <fieldset>
                                        <label>Name Tour Type New</label>
                                        <html:text property="name" value=""/> 
                                </fieldset>
                </div>
        <footer>
                <div class="submit_link">
                        <html:submit value="Add" styleClass="alt_btn"/>
                        <html:submit value="Reset"/>
                </div>
        </footer>
    </html:form>
    </logic:empty>
</article><!-- end of post new article -->

<article class="module width_full">
<c:if test="${tourType != null}">
       <html:form onsubmit="return validTourType();" action="/TourTypeAction.do?method=update" method="POST">
            <header><h3>Update Tour Type</h3></header>
                <div class="module_content">
                                <fieldset> 
                                        <label>Name Tour Type</label>
                                        <input hidden="true" value="${tourType.id}" type="hidden" name="id"/>
                                        <input type="text" class="text" name="name" id="name" value="${tourType.name}"/> 
                                </fieldset>

                </div>
        <footer>
                <div class="submit_link">
                    
                        <html:submit value="Update" styleClass="alt_btn"/>
                        <html:submit value="Reset"/>
                </div>
        </footer>
    </html:form>
</c:if>       

</article><!-- end of post new article -->

<article class="module width_3_quarter">
<header><h3 class="tabs_involved">Tour Type List</h3>
</header>

<div class="tab_container">
        <div id="tab1" class="tab_content">
        <table class="tablesorter" cellspacing="0"> 
        <thead> 
                <tr> 
                <th>Name</th> 
                <th>Actions</th> 
                </tr> 
        </thead> 
        <tbody>
            <c:if test="${list != null}">
                <c:forEach items="${list}" var="type">
                    <tr>
                    <td>${type.name}</td>
                    <td>
                        <html:link action="/TourTypeAction.do?method=edit&id=${type.id}">Edit</html:link> | <html:link onclick="return confirmDelete();" action="/TourTypeAction.do?method=delete&id=${type.id}">Delete</html:link>
                    </td> 
                    </tr>
                </c:forEach>
            </c:if>
        </tbody> 
        </table>
        </div><!-- end of #tab1 -->

</div><!-- end of .tab_container -->
		
</article><!-- end of content manager article -->

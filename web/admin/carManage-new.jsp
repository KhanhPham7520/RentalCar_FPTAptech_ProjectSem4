<%-- 
    Document   : carManage-new
    Created on : May 31, 2013, 9:01:25 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<script>
    function confirmDelete(){
        return confirm("Are you sure want delete this car?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
    <header><h3 class="tabs_involved">Car Manager</h3>

        <html:link action="/CarAction.do?method=addCar" styleClass="imgAdd">
            <img alt="" src="images/icons/add_48.png"/>
        </html:link>

    </header>

    <div class="tab_container">
            <div id="tab1" class="tab_content">
            <pg:pager url="CarAction.do" maxIndexPages="3" maxPageItems="9">
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Price</th>
                    <th>Seating</th> 
                    <th>Actions</th> 
                    </tr> 
            </thead> 
            <tbody>
                <logic:notEmpty name="list">
                    <logic:iterate name="list" id="item">
                        <pg:item>
                        <tr>
                        <td><bean:write name="item" property="name"/></td> 
                        <td><bean:write name="item" property="price"/> $</td> 
                        <td> <bean:write name="item" property="seatingCapacity"/> </td>
                        <td>
                            <html:link action="/CarAction.do?method=edit&id=${item.id}">Edit</html:link> | <html:link onclick="return confirmDelete();" action="/CarAction.do?method=delete&id=${item.id}">Delete</html:link>
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


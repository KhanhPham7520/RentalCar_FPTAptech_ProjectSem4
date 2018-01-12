<%-- 
    Document   : userEdit-new
    Created on : Jun 4, 2013, 1:34:26 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form action="/UserAction.do?method=updateRole" method="POST">
                    <header><h3>Edit Role Of User</h3></header>
                        <div class="module_content"> 
                            <html:hidden name="item" property="id"/>
                            <fieldset>
                                <label>Full name</label> 
                                <html:text property="fullname" name="item"/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                <label>Address</label> 
                                <html:text property="address" name="item"/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                        </fieldset>
                            <fieldset>
                                <label>Phone</label> 
                                <html:text property="phone" name="item"/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Nationality</label> 
                                <html:text property="nationality" name="item"/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Email</label> 
                                <html:text property="email" name="item"/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                                <fieldset>
                                    <label>Is Administrator</label>
                                <select name="roleId" style="width: 200px;">
                                    <c:if test="${item.role == 1}">
                                        <option selected="selected" value="1">Administrator</option>
                                    </c:if>
                                    <c:if test="${item.role == 0}">
                                        <option selected="selected" value="1">User</option>
                                    </c:if>
                                    <option value="0">User</option>
                                    <option value="1">Administrator</option>
                                </select>
                                </fieldset>
                                <html:hidden property="role" name="item"/>
                        </div>
                    <footer>
                        <div class="submit_link">
                            <html:submit value="Update" styleClass="alt_btn"/>    
                            <html:cancel value="Cancel"/>
                        </div>
                    </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article -->

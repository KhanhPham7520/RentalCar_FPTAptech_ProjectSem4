<%-- 
    Document   : editProfile
    Created on : May 27, 2013, 6:45:38 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<script>
    function validUser(){
        var name = document.forms["Users"]["fullname"].value;
        
        if(name =="" || name == null){
            alert("Please enter fullname!");
            return false;
        }
        return true;
    }
</script>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Edit Profile</span></h2>
        </div>
            <div class="product_list">
                <div class="leftPosition">
                    <div class="browse_1">
                        <div class="bottom_separator">
                            <div class="clear">
                                <!-- Form -->
                                <logic:notEmpty name="item">
                                    <!-- Form -->
                                    <html:form onsubmit="return validUser();" action="/UserAction.do?method=updateProfile" method="POST">
                                        <div class="fieldset fieldsetBlock active tabs">
                                            <div id="header_form">
                                                <h3>Account Information</h3>
                                            </div>
                                            <div class="tabs">
                                                <fieldset id="fieldset1">
                                                    <legend>Post content</legend>
                                                    <html:hidden name="item" property="id"/>
                                                    <div class="field required">
                                                        <label>Full name</label> 
                                                        <html:text styleClass="text" property="fullname" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <div class="field required">
                                                        <label>Address</label> 
                                                        <html:text styleClass="text" property="address" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <div class="field required">
                                                        <label>Phone</label> 
                                                        <html:text styleClass="text" property="phone" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <div class="field required">
                                                        <label>Nationality</label> 
                                                        <html:text styleClass="text" property="nationality" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <div class="field required">
                                                        <label>Email</label> 
                                                        <html:text styleClass="text" property="email" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <div class="field required">
                                                        <label>Password</label> 
                                                        <html:password styleClass="text" property="password" name="item"/>
                                                        <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                    </div>
                                                    <html:hidden property="role" name="item"/>
                                                    <div id="buttom1">
                                                        <strong>
                                                            <html:submit value="Update" styleClass="buttom_form"/>
                                                        </strong>
                                                        <strong>    
                                                            <html:reset value="Reset" styleClass="buttom_form"/>
                                                        </strong>
                                                    </div>

                                                </fieldset>
                                            </div>
                                            <span class="bBR"></span>
                                        </div>
                                    </html:form>
                                    <!-- /Form -->
                                </logic:notEmpty>
                            </div>
                        </div>
                    </div>
                </div>
                <br class="clr" />
            </div>
        </div>

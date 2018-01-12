<%-- 
    Document   : editUser-new
    Created on : Jun 4, 2013, 1:26:55 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script>
    function validUser(){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var name = document.forms["Users"]["fullname"].value;
        var address = document.forms["Users"]["address"].value;
        var phone = document.forms["Users"]["phone"].value;
        var nationality = document.forms["Users"]["nationality"].value;
        var email = document.forms["Users"]["email"].value;
        var password = document.forms["Users"]["password"].value;
        
        if(name == "" || name == null){
            alert("Please enter fullname!");
            return false;
        }
        if(address == "" || address == null){
            alert("Please enter address!");
            return false;
        }
        if(phone == "" || phone == null){
            alert("Please enter phone!");
            return false;
        }
        if(nationality == "" || nationality == null){
            alert("Please enter nationality!");
            return false;
        }
        if(email == "" || email == null){
            alert("Please enter email!");
            return false;
        }
        if(reg.test(email) == false) {
            alert('Invalid email address!');
            return false;
        }
        if(password == "" || password == null){
            alert("Please enter password!");
            return false;
        }
        return true;
    }
</script>
<!DOCTYPE html>
<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form onsubmit="return validUser();" action="/UserAction.do?method=update" method="POST">
                    <header><h3>Edit Profile</h3></header>
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
                                    <label>Password</label> 
                                <html:password property="password" name="item" value=""/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
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

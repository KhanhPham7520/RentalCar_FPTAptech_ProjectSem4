<%-- 
    Document   : login
    Created on : May 27, 2013, 6:48:53 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript" language="javascript">
    function validLogin(){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var email = document.forms["Users"]["email"].value;
        var password = document.forms["Users"]["password"].value;
       
        if(email == "" || email == null){
            alert("Enter email please!");
            return false;
        }
        if(reg.test(email) == false) {
            alert('Invalid email address!');
            return false;
        }
        if(password == "" || password == null){
            alert("Enter password please!");
            return false;
        }
        return true;
    }
</script>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Login</span></h2>
        </div>
            <div>
                <div>
                    <div class="browse_1">
                        <div class="bottom_separator">
                            <div class="clear">
                                <!-- Form -->
                                <html:form action="/LoginAction.do?method=checkLogin" method="post" onsubmit="return validLogin();">
                                    <div class="fieldset fieldsetBlock active tabs">
                                        <div class="tabs">
                                            <fieldset id="fieldset1">
                                                <div class="field field-error required">
                                                    <label for="email">Email</label> 
                                                    <input type="text" class="text" name="email" id="email"/> 
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank. ">Required</span> 
                                                </div>
                                                <div class="field field-error required">
                                                    <label for="password">Password</label> 
                                                    <input type="password" class="text" name="password" id="password"/> 
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank. ">Required</span> 
                                                </div>
                                                <div id="buttom1">
                                                    <input type="submit" value="Login" class="buttom_form"/>    
                                                    <input type="reset" value="Reset" class="buttom_form"/>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <span class="bBR"></span>
                                    </div>
                                </html:form>
                                <label style="color: red"> <bean:write name="Users" filter="false" property="error"/></label>
                            </div>
                        </div>
                    </div>
                </div>
                <br class="clr" />
            </div>
        </div>
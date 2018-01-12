<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>

<script type="text/javascript" language="javascript">
    function validUser(){
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
          <h2><span>Registration Form</span></h2>
        </div>
            <div>
                <div>
                    <div class="browse_1">
                        <div class="bottom_separator">
                            <div class="clear">
                                <!-- Form -->
                                <html:form action="/UserAction.do?method=register" method="post" onsubmit="return validUser();">
                                    <div class="fieldset fieldsetBlock active tabs">
                                        <div class="tabs">
                                            <fieldset id="fieldset1">
                                                <div class="field required">
                                                    <label>Full name</label> 
                                                    <html:text styleClass="text" property="fullname" />
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <label>Address</label> 
                                                    <html:text styleClass="text" property="address"/>
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <label>Phone</label> 
                                                    <html:text styleClass="text" property="phone"/>
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <label>Nationality</label> 
                                                    <html:text styleClass="text" property="nationality"/>
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <label>Email</label> 
                                                    <html:text styleClass="text" property="email"/>
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <label>Password</label> 
                                                    <html:password styleClass="text" property="password"/>
                                                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                                                </div>
                                                <div class="field required">
                                                    <logic:notEmpty name="message">
                                                        <label>Error</label> 
                                                        <h4 style="color: red;">${message}</h4>
                                                    </logic:notEmpty>
                                                </div>
                                                <div id="buttom1">
                                                    <strong>
                                                        <html:submit value="Create" styleClass="buttom_form"/>
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
                            </div>
                        </div>
                    </div>
                </div>
                <br class="clr" />
            </div>
        </div>
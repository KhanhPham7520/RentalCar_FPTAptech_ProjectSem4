<%-- 
    Document   : register-new
    Created on : Jun 4, 2013, 2:21:39 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="vmMainPage">
         <div class="article">
          <h2><span>Registration Form</span></h2>
        </div>
            <div>
                <div>
                    <div class="browse_1">
                        <div class="bottom_separator">
                            <div class="clear">
    <logic:empty name="item">
    <html:form action="/UserAction.do?method=register" method="post" onsubmit="return validUser();">
        <html:hidden property="" value=""/>
            <div class="module_content">                                   
                <fieldset>
                    <label>Full name</label> 
                    <html:text property="fullname" />
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span>
                </fieldset>
                <fieldset>
                    <label>Address</label> 
                    <html:text property="address"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                </fieldset>
                <fieldset>
                    <label>Phone</label> 
                    <html:text property="phone"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span>
                </fieldset>
                <fieldset>
                    <label>Nationality</label> 
                    <html:text property="nationality"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                </fieldset>
                <fieldset>
                    <label>Email</label> 
                    <html:text property="email"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span> 
                </fieldset>
                <fieldset>
                    <label>Password</label> 
                    <html:password property="password"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">Required</span>
                </fieldset>
                <fieldset>
                    <logic:notEmpty name="message">
                        <label>Error</label> 
                        <h4 style="color: red;">${message}</h4>
                    </logic:notEmpty>
                </fieldset>
            </div>
        <footer>
                <div class="submit_link">
                    <html:submit value="Create" styleClass="alt_btn"/>    
                    <html:reset value="Reset"/>
                </div>
        </footer>
    </html:form>
</logic:empty>
          </div>
                        </div>
                    </div>
                </div>
                <br class="clr" />
            </div>
        </div>
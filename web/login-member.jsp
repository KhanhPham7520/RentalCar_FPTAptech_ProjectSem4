<%-- 
    Document   : login-member
    Created on : Jun 4, 2013, 9:35:44 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Login in to East2West system</span></h2>
        </div>
    <article class="module width_full">
        <html:form action="/LoginAction.do?method=checkLogin" method="post" onsubmit="return validLogin();">
        <div class="module_content"> 
            <fieldset>
                <label for="email">Email</label> 
                <input type="text" class="text" name="email" id="email"/> 
                <span class="tooltip" title=" This field is required, it cannot be blank. ">*</span>
            </fieldset>
            <fieldset>
                <label for="password">Password</label> 
                    <input type="password" class="text" name="password" id="password"/> 
                    <span class="tooltip" title=" This field is required, it cannot be blank. ">*</span> 
            </fieldset> 
        </div>
        <footer>
            <div class="submit_link">
                <html:submit value="Submit" styleClass="alt_btn"/>    
                <html:cancel value="Cancel"/>
            </div>
        </footer>
    </html:form>
    <label style="color: red"> <bean:write name="Users" filter="false" property="error"/></label>
    </article><!-- end of post new article -->
</div>

                    
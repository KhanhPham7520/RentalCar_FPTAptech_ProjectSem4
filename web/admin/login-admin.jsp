<%-- 
    Document   : newjspxxx
    Created on : May 28, 2013, 8:46:18 PM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="../css/style-login.css">
    </head>
    <body>
        <section class="container">
    <div class="login">
      <h1>Login With Admin Permission</h1>
      <html:form action="/LoginAction.do?method=checkLogin" method="post" onsubmit="return validLogin();">
        <p><input type="text" name="email" id="email" value="" placeholder="Username or Email"></p>
        <p><input type="password" name="password" id="password" value="" placeholder="Password"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </html:form>
    </div>
  </section>
    </body>
</html>
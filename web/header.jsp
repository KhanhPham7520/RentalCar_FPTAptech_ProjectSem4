<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="header_resize">
      <div class="menu_nav">
        <ul>
           <c:if test="${user == null}">
                <li><a id="login" href="home.jsp?option=login">Sign In</a></li>
                <li><a href="home.jsp?option=register"><span>Sign Up</span></a></li>
           </c:if>
           <c:if test="${user != null}">
               <li><html:link action="/UserAction.do?method=editProfile&email=${user.email}"> ${user.fullname}</html:link></li>
               <li><html:link action="/CartAction.do?method=myCart">MY CART</html:link></li>
               <li><html:link action="/LoginAction.do?method=logout">Logout</html:link></li>
           </c:if>
        </ul>
          
      </div>
      <div class="logo">
          <h1><b>CarPlus Rental Car System <small>Tours and Car Rental</small></b></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
          <div class="left-menu">
            <div id="menu">
                <ul>
                    <li class="first"><html:link action="/HomeAction.do?method=list">Home</html:link></li>
                    <li><html:link action="/TourAction.do?method=listclient">Package Tour</html:link></li>
                    <li><html:link action="/CarAction.do?method=listclient">Car Rental</html:link></li>
                    <li><html:link href="home.jsp?option=infoDesk">Information Desk</html:link></li>
                    <li><html:link href="home.jsp?option=aboutUs">About Us</html:link></li>
                </ul>
            </div>             
          </div>
                <div class="right-main">
                    <div id="coin-slider"> <a href="#"><img src="images/hoian.jpg" width="740" height="317" alt="" /></a><div class="clr"></div>
                </div>
      </div>     
      <div class="clr"></div>
    </div>
  </div>
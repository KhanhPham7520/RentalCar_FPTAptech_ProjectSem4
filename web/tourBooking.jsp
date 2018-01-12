<%-- 
    Document   : tourBooking
    Created on : May 27, 2013, 6:14:41 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<%
    String path = "images/products/tours/";
%>
<script type="text/javascript" language="javascript">
    function validBooking(){
        var participants = document.forms["TourBookings"]["participants"].value;
       
        if(participants == "" || participants == null){
            alert("Please enter participants!");
            return false;
        }
        if(!participants.match(/[0-9]/)){
            alert("Participants must number");
            return false;
        }
        if(participants < 1 || price == null){
            alert("Participants not valid!");
            return false;
        }
        return true;
    }
</script>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Tour Booking</span></h2>
        </div>
            <logic:notEmpty name="item">
                <div class="product_list">
                    <div class="leftPosition">
                        <div class="browse_1">
                            <div class="bottom_separator">
                                <div class="clear">
                                    <div class="browseProductImageContainer"> 
                                        <html:link href=""> 
                                            <img class="browseProductImage" src="<%=path%>${item.image}" height="150" width="200" border="0" />
                                        </html:link> 
                                    </div>
                                    <div class="floatElement">
                                        <h2 class="browseProductTitle"> 
                                            <html:link styleClass="product_name" href="">
                                                <bean:write name="item" property="name"/>
                                            </html:link>
                                        </h2>
                                        <div class="browsePriceContainer">
                                            <span class="productPrice">Price: <bean:write name="item" property="price"/> $</span> 
                                        </div>
                                        <div class="browsePriceContainer"><strong>Duration: </strong> </div>
                                        <div class="browsePriceContainer"><strong>Start date: <bean:write name="item" property="start_date"/></strong> </div>
                                        <div class="browsePriceContainer"><strong>Return date: <bean:write name="item" property="return_date"/></strong> </div>
                                        <div class="browsePriceContainer">
                                            <strong>Package Type: 
                                                <c:forEach items="${packageTourTypeList}" var="type">
                                                    <c:if test="${type.id == item.type_id}">
                                                        <c:out value="${type.name}"/>
                                                    </c:if>
                                                </c:forEach>
                                            </strong> 
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br class="clr" />
                    <div id="infoDetails2">
                        <logic:notEmpty name="user">
                            <html:form method="POST" style="" action="/TourBookingAction.do?method=submit&id=${item.id}" onsubmit="return validBooking();">
                                Personal Information <br/>
                                <html:hidden name="user" property="id"/>
                                Full name: <bean:write name="user" property="fullname"/> <br/>
                                Address: <bean:write name="user" property="address"/> <br/>
                                Phone: <bean:write name="user" property="phone"/> <br/>
                                Nationality: <bean:write name="user" property="nationality"/> <br/>
                                Email: <bean:write name="user" property="email"/> <br/>
                                <div class="browseAddToCartContainer">
                                    <html:submit styleClass="addtocart_button" value="Submit"/>
                                </div>
                            </html:form>
                        </logic:notEmpty>
                    </div>

                    <logic:empty name="user">
                        <div id="infoDetails2">
                            You must login for booking!
                            <html:link href="home.jsp?option=login">Login</html:link> or
                            <html:link href="home.jsp?option=register">Register</html:link>
                        </div>
                    </logic:empty>
                </div>
                <br class="clr" />
            </logic:notEmpty>
            <br class="clr" />
        </div>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<%
    String path = "images/products/cars/";
%>
<script type="text/javascript" language="javascript">
    function validBooking(){
        var pickUpDate = document.forms["CarBookings"]["pickUpDate"].value;
        var dropUpDate = document.forms["CarBookings"]["dropUpDate"].value;
       
        if(pickUpDate == "" || pickUpDate == null){
            alert("Please enter pick up date!");
            return false;
        }
        if(dropUpDate == "" || dropUpDate == null){
            alert("Please enter drop up date!");
            return false;
        }
        return true;
    }
</script>
<div id="vmMainPage">
        <div class="article">
          <h2><span>Car Booking</span></h2>
        </div>
            <logic:notEmpty name="item">
                <div class="product_list">
                    <div class="leftPosition">
                        <div class="browse_1">
                            <div class="bottom_separator">
                                <div class="clear">
                                    <div class="browseProductImageContainer"> 
                                        <html:link href=""> 
                                            <img class="browseProductImage" src="<%=path%>${item.images}" height="150" width="200" border="0" />
                                        </html:link> 
                                    </div>
                                    <div class="floatElement">
                                        <h2 class="browseProductTitle"> 
                                            <html:link styleClass="product_name" href="#">
                                                <bean:write name="item" property="name"/>
                                            </html:link>
                                        </h2>
                                        <div class="browsePriceContainer">
                                            <span class="productPrice">Price: <bean:write name="item" property="price"/> $</span> 
                                        </div>
                                        <div class="browsePriceContainer">
                                            <strong>Car Model: 
                                                <c:forEach items="${modelList}" var="model">
                                                    <c:if test="${model.id == item.modelId}">
                                                        <c:out value="${model.name}"/>
                                                    </c:if>
                                                </c:forEach>
                                            </strong> 
                                        </div>
                                        <div class="browsePriceContainer">
                                            <strong>Car Type: 
                                                <c:forEach items="${typeList}" var="type">
                                                    <c:if test="${type.id == item.typeId}">
                                                        <c:out value="${type.name}"/>
                                                    </c:if>
                                                </c:forEach>
                                            </strong> 
                                        </div>
                                        <div class="browsePriceContainer"><strong>Seating Capacity: <bean:write name="item" property="seatingCapacity"/></strong> </div>
                                        <div class="browsePriceContainer"><strong>Air Conditioner:
                                                <c:if test="${item.airConditioner == 1}">
                                                    Yes
                                                </c:if>
                                                <c:if test="${item.airConditioner == 0}">
                                                    No
                                                </c:if>
                                            </strong> </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br class="clr" />
                    <div id="infoDetails2">
                        <logic:notEmpty name="user">
                            <html:form method="POST" action="/CarBookingAction.do?method=submit&id=${item.id}" onsubmit="return validBooking();">
                                Personal Information <br/>
                                <html:hidden name="user" property="id"/>
                                Full name: <bean:write name="user" property="fullname"/> <br/>
                                Address: <bean:write name="user" property="address"/> <br/>
                                Phone: <bean:write name="user" property="phone"/> <br/>
                                Nationality: <bean:write name="user" property="nationality"/> <br/>
                                Email: <bean:write name="user" property="email"/> <br/>
                                Pick up date :<input type="text" name="pickUpDate" id="pickUpDate" style="margin-left: 1px;" readonly="true"/>  
                                <img src="images/cal.gif" alt="calendar_icon" onClick="javascript:NewCssCal('pickUpDate')" style="cursor: pointer;"> 
                                (MM/dd/yyyy) <br/>
                                Drop up date:<input type="text" name="dropUpDate" id="dropUpDate" readonly="true"/>
                                <img src="images/cal.gif" alt="calendar_icon" onClick="javascript:NewCssCal('dropUpDate')" style="cursor: pointer;">
                                (MM/dd/yyyy) <br/>
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
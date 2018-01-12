<%-- 
    Document   : packageTourEdit-new
    Created on : Jun 3, 2013, 8:55:36 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<script type="text/javascript">
    function validTour(){
        var name = document.forms["PackageTours"]["name"].value;
        var start_date = document.forms["PackageTours"]["start_date"].value;
        var return_date = document.forms["PackageTours"]["return_date"].value;
        var price = document.forms["PackageTours"]["price"].value;
        var theFile = document.forms["PackageTours"]["theFile"].value;
        
        if(name == "" || name == null){
            alert("Please enter name of Package Tour!");
            return false;
        }
        if(start_date == "" || start_date == null){
            alert("Please enter start date of Package Tour!");
            return false;
        }
        if(return_date == "" || return_date == null){
            alert("Please enter return date of Package Tour!");
            return false;
        }
        if(price == "" || price == null){
            alert("Please enter price of Package Tour!");
            return false;
        }
        if(!price.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(price < 1 || price == null){
            alert("Price not valid!");
            return false;
        }
        if(theFile == "" || theFile == null){
            alert("Please enter image of Package Tour!");
            return false;
        }
        return true;
    }
</script>

<script type="text/javascript">
    function selectCheckBox()
    {
        var locations = document.getElementsByName("location");
        var hotels = document.getElementsByName("hotel");
        var foods = document.getElementsByName("food");
        var locationChoosenItems = "";
        var hotelChoosenItems = "";
        var foodChoosenItems = "";
        for(i = 0; i < locations.length; i++){
            if(locations.item(i).checked)
                locationChoosenItems += locations.item(i).value + ",";
        }
        for(i = 0; i < hotels.length; i++){
            if(hotels.item(i).checked)
                hotelChoosenItems += hotels.item(i).value + ",";
        }
        for(i = 0; i < foods.length; i++){
            if(foods.item(i).checked)
                foodChoosenItems += foods.item(i).value + ",";
        }
        if(locationChoosenItems == ""){
            alert("Please choose location for Package Tour!");
            return false;
        }
        if(hotelChoosenItems == ""){
            alert("Please choose hotel for Package Tour!");
            return false;
        }
        if(foodChoosenItems == ""){
            alert("Please choose food for Package Tour!");
            return false;
        }
        document.getElementById("choosenLocations").value = locationChoosenItems;
        document.getElementById("choosenHotels").value = hotelChoosenItems;
        document.getElementById("choosenFoods").value = foodChoosenItems;
        
        //----------------------------------------------------------------
        //Validate Input Data
        var name = document.forms["PackageTours"]["name"].value;
        var start_date = document.forms["PackageTours"]["start_date"].value;
        var return_date = document.forms["PackageTours"]["return_date"].value;
        var price = document.forms["PackageTours"]["price"].value;
        var theFile = document.forms["PackageTours"]["theFile"].value;
        
        if(name == "" || name == null){
            alert("Please enter name of Package Tour!");
            return false;
        }
        if(start_date == "" || start_date == null){
            alert("Please enter start date of Package Tour!");
            return false;
        }
        if(return_date == "" || return_date == null){
            alert("Please enter return date of Package Tour!");
            return false;
        }
        if(price == "" || price == null){
            alert("Please enter price of Package Tour!");
            return false;
        }
        if(!price.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(price < 1 || price == null){
            alert("Price not valid!");
            return false;
        }
        if(theFile == "" || theFile == null){
            alert("Please enter image of Package Tour!");
            return false;
        }
        
        return true;
    }
</script>
<%
    String path = "images/products/tours/";
%>
<!DOCTYPE html>
<article class="module width_full">
    <logic:empty name="item">
    <html:form action="/TourAction.do?method=add" enctype="multipart/form-data" onsubmit="return selectCheckBox();" method="POST" >
        <html:hidden property="" value=""/>
        <header><h3>Add New Package Tour</h3></header>
            <div class="module_content">                                   
                <fieldset class="required">
                    <label>Name</label>
                    <html:text name="item" property="name" value=""/>
                    <span class="tooltip" title=" This field is required, it cannot be blank."> * </span> 
                </fieldset>
                    <fieldset>
                    <label>Start Day</label>
                    <input type="text" name="start_date" id="start_date" width="200px" readonly="true"/>
                    <img src="images/cal.gif" alt="calendar_icon" onClick="javascript:NewCssCal('start_date')" style="cursor: pointer;"/>
                </fieldset>
                <fieldset>
                    <label>End Day</label> 
                    <input type="text" name="return_date" id="return_date" width="200px" readonly="true"/>
                    <img src="images/cal.gif" alt="calendar_icon" onClick="javascript:NewCssCal('return_date')" style="cursor: pointer;"/>
                </fieldset>
                    <fieldset class="required">
                    <label>Price</label> 
                    <html:text name="item" property="price" value=""/>
                    <span class="tooltip" title=" This field is required, it cannot be blank."> * </span> 
                </fieldset>
                <fieldset>
                    <label>Image</label> 
                    <html:file property="theFile"/>
                </fieldset>
                <fieldset>
                    <label>Package Tour Type</label> 
                    <select name="type_id">
                        <c:forEach items="${packageTourTypeList}" var="type">
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Locations in Package</label> 
                    <c:if test="${locationList != null}">
                        <div style="overflow:auto;width:320px;height:100px;border:1px solid #336699;padding-left:5px">
                            <c:forEach items="${locationList}" var="loc">
                                <input type="checkbox" name="location" value="${loc.id}"/><strong id="listcheckbox">${loc.name}</strong><br/>
                            </c:forEach>
                        </div>
                    </c:if>
                </fieldset>
                <fieldset>
                    <label>Hotels in Package</label> 
                    <c:if test="${hotelList != null}">
                        <div style="overflow:auto;width:320px;height:100px;border:1px solid #336699;padding-left:5px">
                            <c:forEach items="${hotelList}" var="hotel">
                                <input type="checkbox" name="hotel" value="${hotel.id}"/><strong id="listcheckbox">${hotel.name}</strong><br/>
                            </c:forEach>
                        </div>
                    </c:if>
                </fieldset>
                <fieldset>
                    <label>Foods in Package</label> 
                    <c:if test="${foodList != null}">
                    <div style="overflow:auto;width:320px;height:100px;border:1px solid #336699;padding-left:5px">
                        <c:forEach items="${foodList}" var="food">
                            <input type="checkbox" name="food" value="${food.id}"/><strong id="listcheckbox">${food.name}</strong><br/>
                        </c:forEach>
                    </c:if>
                </fieldset>
                <fieldset>
                    <label>Description</label>
                    <fck:editor height="300px" width="670px" instanceName="description"></fck:editor>
                </fieldset>
            </div>
        <footer>
                <div class="submit_link">
                    <html:submit value="Add Tour" styleClass="alt_btn"/>    
                    <html:submit value="Reset"/>
                    <input type="hidden" name="choosenLocations" id="choosenLocations"/>
                    <input type="hidden" name="choosenHotels" id="choosenHotels"/>
                    <input type="hidden" name="choosenFoods" id="choosenFoods"/>
                </div>
        </footer>
    </html:form>
</logic:empty>
</article><!-- end of post new article -->
<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form action="/TourAction.do?method=update" method="POST" onsubmit="return validTour();">
                <html:hidden property="" value=""/>
        <header><h3>Update Package Tour</h3></header>
            <div class="module_content">                                   
                <fieldset>
                    <label>Name</label> 
                    <html:text name="item" property="name" value="${item.name}"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                    <label>Start Day</label>
                    <input type="text" class="text" name="start_date" id="start_date" value="${item.start_date}"/> 
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                </fieldset>
                <fieldset>
                    <label>End Day</label> 
                    <input type="text" name="return_date" id="return_date" value="${item.return_date}"/> 
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                </fieldset>
                <fieldset>
                    <label>Price</label> 
                    <input type="text" name="price" id="price" value="${item.price}"/> 
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                </fieldset>
                <fieldset>
                    <label>Image</label> 
                    <img src="<%=path%>${item.image}" height="100px" class="imageTour" width="180px"/>
                    <html:hidden name="item" property="image"/>
                </fieldset>
                <fieldset>
                    <label>Package Tour Type</label> 
                    <select name="type_id">
                                    <c:forEach items="${packageTourTypeList}" var="type">
                                        <c:if test="${item.type_id == type.id}">
                                            <option selected="selected" value="${type.id}">${type.name}</option>    
                                        </c:if>
                                        <option value="${type.id}">${type.name}</option>
                                    </c:forEach>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Locations in Package</label> 
                    <logic:notEmpty name="tourLocations">
                                    <logic:iterate name="tourLocations" id="it">
                                        * <bean:write name="it" property="name"/>
                                    </logic:iterate>
                    </logic:notEmpty>
                </fieldset>
                <fieldset>
                    <label>Hotels in Package</label> 
                    <logic:notEmpty name="tourHotels">
                                    <logic:iterate name="tourHotels" id="it">
                                        * <bean:write name="it" property="name"/>
                                    </logic:iterate>
                    </logic:notEmpty>
                </fieldset>
                <fieldset>
                    <label>Foods in Package</label> 
                    <logic:notEmpty name="foodLocations">
                                    <logic:iterate name="foodLocations" id="it">
                                        * <bean:write name="it" property="name"/>
                                    </logic:iterate>
                    </logic:notEmpty>
                </fieldset>
                <fieldset>
                    <label>Description</label>
                    <fck:editor height="300px" width="670px" instanceName="description" value="${item.description}"></fck:editor>
                </fieldset>
            </div>
        <footer>
                <div class="submit_link">
                    <html:submit value="Update Tour" styleClass="alt_btn"/>    
                    <html:cancel value="Cancel"/>
                </div>
        </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article -->
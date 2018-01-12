<%-- 
    Document   : carEdit-new
    Created on : Jun 1, 2013, 4:30:03 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script>
    function validCar(){
        var name = document.forms["Cars"]["name"].value;
        var seatingCapacity = document.forms["Cars"]["seatingCapacity"].value;
        var price = document.forms["Cars"]["price"].value;
        var theFile = document.forms["Cars"]["theFile"].value;
        
        if(name == "" || name == null){
            alert("Please enter name of Car!");
            return false;
        }
        if(seatingCapacity == "" || seatingCapacity == null){
            alert("Please enter seating capacity of Car!");
            return false;
        }
        if(!seatingCapacity.match(/[0-9]/)){
            alert("Seating capacity must number");
            return false;
        }
        if(seatingCapacity < 1 || price ==null){
            alert("Seating capacity not valid!");
            return false;
        }
        if(price == "" || name == price){
            alert("Please enter price of Car!");
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
            alert("Please enter Image of Car!");
            return false;
        }
        return true;
    } 
</script>

<%
    String path = "images/products/cars/";
%>
<!DOCTYPE html>
<article class="module width_full">
    <logic:empty name="item">
            <html:form onsubmit="return validCar();" action="/CarAction.do?method=add" enctype="multipart/form-data" method="POST">
        <header><h3>Add New Car</h3></header>
            <div class="module_content">                                   
                <fieldset>
                    <label>Name</label> 
                    <html:text property="name" value=""/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                    <label>Seating Capacity</label> 
                    <html:text property="seatingCapacity" value=""/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                     <label>Driver</label> 
                     <html:checkbox property="driver"/>
                </fieldset>
                <fieldset>
                    <label>Air Conditioner</label> 
                    <html:checkbox property="airConditioner"/>
                </fieldset>
                <fieldset>
                    <label>Price</label> 
                    <html:text property="price" value=""/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                    <label>Image</label> 
                    <html:file property="theFile"/>
                </fieldset>
                <fieldset>
                   <label>Model</label> 
                    <select name="model_id" style="width: 200px;">
                        <c:forEach items="${modelList}" var="mode">
                            <option value="${mode.id}">${mode.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Type</label> 
                    <select name="type_id" style="width: 200px;">
                        <c:forEach items="${typeList}" var="type">
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
            </div>
        <footer>
                <div class="submit_link">
                    <html:submit value="Add Car" styleClass="alt_btn"/>    
                    <html:submit value="Reset"/>
                </div>
        </footer>
    </html:form>
        </logic:empty>
</article><!-- end of post new article -->

<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form onsubmit="return validCar();" action="/CarAction.do?method=update" method="POST">
        <header><h3>Edit Car</h3></header>
            <div class="module_content">                                   
                <fieldset>
                    <label>Name</label> 
                    <html:text property="name" name="item"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                    <label>Seating Capacity</label> 
                    <html:text styleClass="text" property="seatingCapacity" name="item"/>
                    <span class="required-icon tooltip" title=" This field is required, it cannot be blank.">*</span> 
            </fieldset>
                <fieldset>
                    <label>Driver</label> 
                    <html:checkbox property="driver" name="item"/> 
                </fieldset>
                <fieldset>
                    <label>Air Conditioner</label> 
                    <html:checkbox property="airConditioner" name="item"/> 
                </fieldset>
                <fieldset>
                    <label>Price</label> 
                    <html:text property="price" name="item"/>
                    <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                </fieldset>
                <fieldset>
                    <label>Image</label>
                    <html:hidden name="item" property="images"/>
                    <img src="<%=path%>${item.images}" height="100px" width="150px"/>
                </fieldset>
                <fieldset>
                    <label>Model</label> 
                    <select name="model_id" style="width: 200px;">
                        <c:forEach items="${modelList}" var="mode">
                            <c:if test="${mode.id == item.modelId}">
                                <option selected="selected" value="${mode.id}">${mode.name}</option>
                            </c:if>
                            <option value="${mode.id}">${mode.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Type</label> 
                    <select name="type_id" style="width: 200px;">
                        <c:forEach items="${typeList}" var="type">
                            <c:if test="${type.id == item.typeId}">
                                <option selected="selected" value="${type.id}">${type.name}</option>
                            </c:if>
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>  
                
            </div>
        <footer>
                <div class="submit_link">
                    <html:submit value="Update Car" styleClass="alt_btn"/>    
                    <html:cancel value="Cancel"/>
                </div>
        </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article -->

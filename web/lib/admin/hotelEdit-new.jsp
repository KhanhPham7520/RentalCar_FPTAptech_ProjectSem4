<%-- 
    Document   : hotelEdit-new
    Created on : Jun 4, 2013, 1:15:26 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>

<script>
    function validHotel(){
        var name = document.forms["Hotels"]["name"].value;
        var address = document.forms["Hotels"]["address"].value;
        var phone = document.forms["Hotels"]["phone"].value;
        var price_range = document.forms["Hotels"]["price_range"].value;
        
        if(name =="" || name == null){
            alert("Please enter name of Hotel!");
            return false;
        }
        if(address =="" || address == null){
            alert("Please enter address of Hotel!");
            return false;
        }
        if(phone =="" || phone == null){
            alert("Please enter phone of Hotel!");
            return false;
        }
        if(price_range =="" || price_range == null){
            alert("Please enter price range of Hotel!");
            return false;
        }
        if(!price_range.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(price_range < 0 || price_range == null){
            alert("Price not valid!");
            return false;
        }
        return true;
    }  
</script>
<!DOCTYPE html>
<article class="module width_full">
    <c:if test="${item == null}">
            <html:form onsubmit="return validHotel();" action="/HotelAction.do?method=add" method="POST">
                    <header><h3>Add New Hotel</h3></header>
                        <div class="module_content">                                   
                            <fieldset>
                                <label>Name</label> 
                                <input type="text" name="name" id="name"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                <label>Address</label> 
                                <input type="text" name="address" id="address"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                 <label>Phone</label> 
                                <input type="text" name="phone" id="phone"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                <label>Description</label>
                                <fck:editor height="300px" width="670px" instanceName="description"></fck:editor>
                            </fieldset>
                            <fieldset>
                                <label>Price Range</label> 
                                <input type="text" name="price_range" id="price_range"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Location</label> 
                                    <select name="location_id">
                                    <c:forEach items="${locationList}" var="loca">
                                        <option value="${loca.id}">${loca.name}</option>
                                    </c:forEach>
                                </select>
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">
                            <html:submit value="Add Hotel" styleClass="alt_btn"/>    
                            <html:submit value="Reset"/>
                        </div>
                    </footer>
            </html:form>
        </c:if>
</article><!-- end of post new article -->

<article class="module width_full">
     <c:if test="${item != null}">
            <html:form onsubmit="return validHotel();" action="/HotelAction.do?method=update" method="POST">
                    <header><h3>Edit Hotel</h3></header>
                        <div class="module_content"> 
                            <input hidden="true" value="${item.id}" type="hidden" name="id"/>
                            <fieldset>
                                <label>Name</label> 
                                <input type="text" name="name" id="name" value="${item.name}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Address</label> 
                                <input type="text" name="address" id="address" value="${item.address}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                        </fieldset>
                            <fieldset>
                                <label>Phone</label> 
                                <input type="text" name="phone" id="phone" value="${item.phone}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Description</label> 
                                <fck:editor height="300px" width="670px" value="${item.description}" instanceName="description"></fck:editor>
                            </fieldset>
                            <fieldset>
                                <label>Price Range</label> 
                                <input type="text" name="price_range" id="price_range" value="${item.price_range}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Location</label> 
                                <select name="location_id">
                                    <c:forEach items="${locationList}" var="loca">
                                        <c:if test="${loca.id == item.location_id}">
                                            <option selected="selected" value="${loca.id}">${loca.name}</option>
                                        </c:if>
                                        <option value="${loca.id}">${loca.name}</option>
                                    </c:forEach>
                                </select>
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">
                            <html:submit value="Update Hotel" styleClass="alt_btn"/>    
                            <html:cancel value="Cancel"/>
                        </div>
                    </footer>
            </html:form>
        </c:if>
</article><!-- end of post new article -->
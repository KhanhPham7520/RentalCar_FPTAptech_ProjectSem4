<%-- 
    Document   : flightEdit-new
    Created on : Jun 4, 2013, 1:01:46 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<!DOCTYPE html>
<script>
    function validFlight(){
        var name = document.forms["Flights"]["name"].value;
        var departure_time = document.forms["Flights"]["departure_time"].value;
        var arrival_time = document.forms["Flights"]["arrival_time"].value;
        
        if(name == "" || name == null){
            alert("Please enter name of flight!");
            return false;
        }
        if(departure_time == "" || departure_time == null){
            alert("Please enter departure time of flight!");
            return false;
        }
        if(arrival_time == "" || arrival_time == null){
            alert("Please enter arrival time of flight!");
            return false;
        }
        return true;
    } 
</script>

<article class="module width_full">
    <logic:empty name="item">
            <html:form action="/FlightAction.do?method=add" method="POST" onsubmit="return validFlight();">
                <html:hidden property="" value=""/>
                    <header><h3>Add New Fight</h3></header>
                        <div class="module_content">                                   
                            <fieldset>
                                <label>Name</label> 
                                <html:text name="item" property="name" value=""/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                <label>Departure City</label> 
                                <select name="departure_city">
                                    <c:forEach items="${locationList}" var="loc">
                                        <option value="${loc.id}">${loc.name}</option>
                                    </c:forEach>
                                </select>
                            </fieldset>
                            <fieldset>
                                 <label>Departure Time</label> 
                                <html:text name="item" property="departure_time" value=""/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                            <fieldset>
                                <label>Arrival City</label> 
                                <select name="arrival_city">
                                    <c:forEach items="${locationList}" var="loc">
                                        <option value="${loc.id}">${loc.name}</option>
                                    </c:forEach>
                                </select>
                            </fieldset>
                            <fieldset>
                                <label>Arrival Time</label> 
                                <html:text name="item" property="arrival_time" value=""/>
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">
                            <html:submit value="Add Fight" styleClass="alt_btn"/>    
                            <html:submit value="Reset"/>
                        </div>
                    </footer>
    </html:form>
        </logic:empty>
</article><!-- end of post new article -->


<article class="module width_full">
    <logic:notEmpty name="item">
            <html:form action="/FlightAction.do?method=update" method="POST" onsubmit="return validFlight();">
                <html:hidden property="" value=""/>
                    <header><h3>Edit Fight</h3></header>
                        <div class="module_content"> 
                            <html:hidden name="item" property="id"/>
                            <fieldset>
                                <label>Name</label> 
                                <input type="text" name="name" id="name" value="${item.name}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Departure City</label> 
                                <select name="departure_city">
                                    <c:forEach items="${locationList}" var="loc">
                                        <c:if test="${loc.id == item.departure_city}">
                                            <option selected="selected" value="${loc.id}">${loc.name}</option>
                                        </c:if>
                                        <option value="${loc.id}">${loc.name}</option>
                                    </c:forEach>
                                </select> 
                        </fieldset>
                            <fieldset>
                                <label>Departure Time</label> 
                                <input type="text" name="departure_time" id="departure_time" value="${item.departure_time}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span>
                            </fieldset>
                            <fieldset>
                                <label>Arrival City</label> 
                                <select name="arrival_city">
                                    <c:forEach items="${locationList}" var="loc">
                                        <c:if test="${loc.id == item.arrival_city}">
                                            <option selected="selected" value="${loc.id}">${loc.name}</option>
                                        </c:if>
                                        <option value="${loc.id}">${loc.name}</option>
                                    </c:forEach>
                                </select>
                            </fieldset>
                            <fieldset>
                                <label>Arrival Time</label> 
                                <input type="text" name="arrival_time" id="arrival_time" value="${item.arrival_time}"/> 
                                <span class="tooltip" title=" This field is required, it cannot be blank.">*</span> 
                            </fieldset>
                        </div>
                    <footer>
                        <div class="submit_link">
                            <html:submit value="Update Fight" styleClass="alt_btn"/>    
                            <html:cancel value="Cancel"/>
                        </div>
                    </footer>
            </html:form>
        </logic:notEmpty>
</article><!-- end of post new article -->
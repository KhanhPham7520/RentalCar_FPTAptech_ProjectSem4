<%-- 
    Document   : infoDesk
    Created on : May 27, 2013, 6:34:30 PM
    Author     : Razer™
--%>

<%@page import="com.aptech.dao.CarTypesDao"%>
<%@page import="com.aptech.dto.CarTypes"%>
<%@page import="com.aptech.dao.LocationsDao"%>
<%@page import="com.aptech.dto.Locations"%>
<%@page import="com.aptech.dao.PackageTourTypesDao"%>
<%@page import="com.aptech.dto.PackageTourTypes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<script>
    function validTour(){
        var priceFrom = document.getElementById("priceFrom").value;
        var priceTo = document.getElementById("priceTo").value;
        if(priceFrom =="" || priceFrom == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceFrom.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceFrom < 1 || priceFrom == null){
            alert("Price not valid!");
            return false;
        }
        if(priceTo =="" || priceTo == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceTo.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceTo < 1 || priceFrom == null){
            alert("Price not valid!");
            return false;
        }
        return true;
    }
    function validCar(){
        var priceFrom1 = document.getElementById("priceFrom1").value;
        var priceTo1 = document.getElementById("priceTo1").value;
        var seatingCapacity1 = document.getElementById("seatingCapacity1").value;
        
        if(priceFrom1 =="" || priceFrom1 == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceFrom1.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceFrom1 < 1 || priceFrom1 == null){
            alert("Price not valid!");
            return false;
        }
        if(priceTo1 =="" || priceTo1 == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceTo1.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceTo1 < 1 || priceFrom1 == null){
            alert("Price not valid!");
            return false;
        }
        if(seatingCapacity1 =="" || seatingCapacity1 == null){
            alert("Seating capacity enter price for search!");
            return false;
        }
        if(!seatingCapacity1.match(/[0-9]/)){
            alert("Seating capacity must number");
            return false;
        }
        if(seatingCapacity1 < 1 || seatingCapacity1 == null){
            alert("Seating capacity not valid!");
            return false;
        }
        return true;
    }
    function validHotel(){
        var priceFrom2 = document.getElementById("priceFrom2").value;
        var priceTo2 = document.getElementById("priceTo2").value;
        if(priceFrom2 =="" || priceFrom2 == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceFrom2.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceFrom2 < 1 || priceFrom2 == null){
            alert("Price not valid!");
            return false;
        }
        if(priceTo2 =="" || priceTo2 == null){
            alert("Please enter price for search!");
            return false;
        }
        if(!priceTo2.match(/[0-9]/)){
            alert("Price must number");
            return false;
        }
        if(priceTo2 < 1 || priceFrom2 == null){
            alert("Price not valid!");
            return false;
        }
        return true;
    }
</script>

<!DOCTYPE html>
<%
    ArrayList<PackageTourTypes> types = new PackageTourTypesDao().getAllPackageTourTypes();
    ArrayList<CarTypes> carTypes = new CarTypesDao().getAllCarTypes();
    ArrayList<Locations> locations = new LocationsDao().getAllLocations();
%>
<div id="vmMainPage">
            <html:form method="POST" action="/SearchAction.do?method=searchTours" onsubmit="return validTour();">
                <div class="article">
                  <h2><span>Search Package Tours</span></h2>
                </div>
                <div class="product_list">
                    <div class="leftPosition" style="padding: 0px; margin: 0px;">
                        <div class="browse_1" style="margin-left: 20px;">
                            <div class="bottom_separator">
                                <div class="clear">
                                    <div class="floatElement">
                                        <table style="font-size: 13px;">
                                            <tr>
                                                <td style="width: 100px; padding: 5px;">Price From</td>
                                                <td style="padding: 5px"><input type="text" name="priceFrom" id="priceFrom"/>
                                                    to <input type="text" name="priceTo" id="priceTo"/></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px">Package Type</td>
                                                <td style="padding: 5px">
                                                    <select name="type_id" style="font-size: 13px;">
                                                        <c:forEach items="<%=types%>" var="type">
                                                            <option value="${type.id}">${type.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="browseAddToCartContainer">
                                            <div style="margin-left: 120px">
                                                <html:submit styleClass="addtocart_button" value="Search Tours"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br class="clr" />
                </div>
                <br class="clr" />
            </html:form>
            <html:form method="POST" action="/SearchAction.do?method=searchCars" onsubmit="return validCar();">
                <div class="article">
                  <h2><span>Search Cars</span></h2>
                </div>
                <div class="product_list">
                    <div class="leftPosition" style="padding: 0px; margin: 0px;">
                        <div class="browse_1" style="margin-left: 20px;">
                            <div class="bottom_separator">
                                <div class="clear">
                                    <div class="floatElement">
                                        <table style="font-size: 13px;">
                                            <tr>
                                                <td style="width: 100px; padding: 5px;">Price From</td>
                                                <td style="padding: 5px"><input type="text" name="priceFrom" id="priceFrom1"/>
                                                    to <input type="text" name="priceTo" id="priceTo1"/></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px; padding: 5px;">Seating Capacity</td>
                                                <td style="padding: 5px"><input type="text" name="seatingCapacity" id="seatingCapacity1"/></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px">Car Type</td>
                                                <td style="padding: 5px">
                                                    <select name="type_id" style="font-size: 13px; width: 200px">
                                                        <c:forEach items="<%=carTypes%>" var="type">
                                                            <option value="${type.id}">${type.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="browseAddToCartContainer">
                                            <div style="margin-left: 120px">
                                                <html:submit styleClass="addtocart_button" value="Search Cars"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br class="clr" />
                </div>
                <br class="clr" />
            </html:form>
        </div>

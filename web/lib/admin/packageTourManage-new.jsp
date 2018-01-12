<%-- 
    Document   : packageTourManage-new
    Created on : May 31, 2013, 7:56:29 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%@taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
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
<script type="text/javascript">
    function confirmDelete(){
        return confirm("Are you sure want delete this package tour?");
    }    
</script>
<!DOCTYPE html>
<article class="module width_3_quarter">
    <header><h3 class="tabs_involved">Package Tour Manager</h3>
        <html:link action="/TourAction.do?method=addTour" styleClass="imgAdd">
            <img alt="" src="images/icons/add_48.png"/>
        </html:link>
    </header>

    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <pg:pager url="TourAction.do" maxIndexPages="3" maxPageItems="9">
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Price</th> 
                    <th>Actions</th> 
                    </tr> 
            </thead> 
            <tbody>

                <logic:notEmpty name="list">
                    <logic:iterate name="list" id="item">
                        <pg:item>
                        <tr>
                        <td><bean:write name="item" property="name"/></td> 
                        <td><bean:write name="item" property="price"/> $</td> 
                        <td>
                            <html:link action="/TourAction.do?method=edit&id=${item.id}">Edit</html:link> | <html:link onclick="return confirmDelete();" action="/TourAction.do?method=delete&id=${item.id}">Delete</html:link>
                        </td> 
                        </tr>
                        </pg:item>
                    </logic:iterate>
                </logic:notEmpty>
            </tbody> 
            </table>
            <div class="nav_next" align="center">
        <ul class="pagination">
            <pg:index>
                <pg:first>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">«« Start</span></a>
                </pg:first>
                <pg:prev>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">« Prev</span></a>
                </pg:prev>
                <pg:pages>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"> <span class="pagenav"><%= pageNumber%></span></a>
                </pg:pages>
                <pg:next>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">Next »</span></a>
                </pg:next>
                <pg:last>
                    <a class="nav_next" href="<%= pageUrl%>&method=list"><span class="pagenav">End »»</span></a>
                </pg:last>
            </pg:index>
        </ul>
    </div>
                </pg:pager>
            </div><!-- end of #tab1 -->

    </div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->

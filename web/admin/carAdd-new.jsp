<%-- 
    Document   : carAdd-new
    Created on : Jun 1, 2013, 4:37:45 PM
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
			<header><h3>Add New Manager</h3></header>
				<div class="module_content">                                   
                                    <fieldset>
                                            <label>Name</label>
                                            <html:text property="name" value=""/>                                                         
                                    </fieldset>
                                    <fieldset>
                                            <label>Name</label>
                                            <html:text property="name" value=""/>                                                         
                                    </fieldset>  
				</div>
			<footer>
				<div class="submit_link">
					<html:submit value="Add" styleClass="alt_btn"/>
					<html:submit value="Reset"/>
				</div>
			</footer>
            </html:form>
        </logic:empty>                          
		</article><!-- end of post new article -->

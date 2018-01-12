<%-- 
    Document   : right-content
    Created on : May 27, 2013, 4:55:04 PM
    Author     : Razer™
--%>
<%@page import="com.aptech.dao.PackageToursDao"%>
<%@page import="com.aptech.dto.PackageTours"%>
<%@page import="com.aptech.dto.PackageTourTypes"%>
<%@page import="com.aptech.dao.PackageTourTypesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<%
    ArrayList<PackageTourTypes> categories = new PackageTourTypesDao().getAllPackageTourTypes();
    request.setAttribute("categories", categories);
    ArrayList<PackageTours> newTours = new PackageToursDao().getNewPackageTours();
    request.setAttribute("newTours", newTours);
    
    String path = "images/products/tours/";
%>
    <div class="gadget">
      <h2 class="star"><span>Categories</span> Menu</h2>
      <div class="clr"></div>
      <ul class="sb_menu">
          <c:forEach items="${categories}" var="cate">
        <li><html:link action="/TourAction.do?method=getTourByCateID&id=${cate.id}"><span>${cate.name}</span></html:link></li>
        </c:forEach>
      </ul>
    </div>
    <div class="gadget">
      <h2 class="star"><span>Categories</span> Menu</h2>
      <div class="clr"></div>
          <c:forEach items="${newTours}" var="tour">
                <div class="boxIndent">
                    <div class="featuredIndent">
                        <div class="product_name"> 
                            <html:link styleClass="category_name" action="/TourAction.do?method=details&id=${tour.id}">${tour.name}</html:link><br />
                            Price:<span style="color:#f38401; font-size: 16px;"> ${tour.price} $</span> 
                        </div>
                        <div class="product_image_container">
                            <html:link action="/TourAction.do?method=details&id=${tour.id}">
                                <img src="<%=path%>${tour.image}" height="150px" width="200px"/>
                            </html:link>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
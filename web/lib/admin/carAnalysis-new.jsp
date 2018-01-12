<%-- 
    Document   : carAnalysis-new
    Created on : Jun 3, 2013, 8:06:46 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<h4 class="alert_info">Car Rental Analysis</h4>
<article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Car Model</h3></header>
    <div>
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Rental Total</th>
                    </tr> 
            </thead> 
            <tbody>
                <logic:notEmpty name="carModels">
                    <logic:iterate name="carModels" id="item">
                        <tr>
                        <td> <bean:write name="item" property="name"/> </td>
                        <td>
                            <c:set var="total" value="0"/>
                            <logic:notEmpty name="carBookings">
                                <logic:iterate name="carBookings" id="book">
                                    <logic:notEmpty name="cars">
                                        <logic:iterate name="cars" id="car">
                                            <c:if test="${book.carId == car.id}">
                                                <c:if test="${car.id == item.id}">
                                                    <c:set var="total" value="${total + book.price}"/>
                                                </c:if>
                                            </c:if>
                                        </logic:iterate>
                                    </logic:notEmpty>
                                </logic:iterate>
                            </logic:notEmpty>
                            ${total} $
                        </td>
                        </tr>
                    </logic:iterate>
                </logic:notEmpty>
            </tbody> 
            </table>
    </div><!-- end of .tab_container -->
    </article><!-- end of content manager article -->
    
    <article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Car Type</h3></header>
    <div>
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Rental Total</th>
                    </tr> 
            </thead> 
            <tbody>
                <logic:notEmpty name="carTypes">
                    <logic:iterate name="carTypes" id="item">
                        <tr>
                        <td><bean:write name="item" property="name"/> </td>
                            <td>
                                <c:set var="total" value="0"/>
                                <logic:notEmpty name="carBookings">
                                    <logic:iterate name="carBookings" id="book">
                                        <logic:notEmpty name="cars">
                                            <logic:iterate name="cars" id="car">
                                                <c:if test="${book.carId == car.id}">
                                                    <c:if test="${car.id == item.id}">
                                                        <c:set var="total" value="${total + book.price}"/>
                                                    </c:if>
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </logic:iterate>
                                </logic:notEmpty>
                                ${total} $
                            </td>
                        </tr>
                    </logic:iterate>
                </logic:notEmpty>
            </tbody> 
            </table>
    </div><!-- end of .tab_container -->
    </article><!-- end of content manager article -->
    
    <article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Car Rental Cost</h3></header>
    <div>
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Total ($)</th>
                    </tr> 
            </thead> 
            <tbody>
                <tr>
                    <td>Less than 50$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="carBookings">
                            <logic:iterate name="carBookings" id="book">
                                <logic:notEmpty name="carLess50">
                                    <logic:iterate name="carLess50" id="car">
                                        <c:if test="${book.carId == car.id}">
                                            <c:set var="total" value="${total + book.price}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </logic:iterate>
                        </logic:notEmpty>
                        ${total}
                    </td>
                </tr>
                <tr>
                    <td>From 50$ to 100$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="carBookings">
                            <logic:iterate name="carBookings" id="book">
                                <logic:notEmpty name="car50To100">
                                    <logic:iterate name="car50To100" id="car">
                                        <c:if test="${book.carId == car.id}">
                                            <c:set var="total" value="${total + book.price}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </logic:iterate>
                        </logic:notEmpty>
                        ${total}
                    </td>
                </tr>
                <tr>
                    <td>From 100$ to 200$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="carBookings">
                            <logic:iterate name="carBookings" id="book">
                                <logic:notEmpty name="car100To200">
                                    <logic:iterate name="car100To200" id="car">
                                        <c:if test="${book.carId == car.id}">
                                            <c:set var="total" value="${total + book.price}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </logic:iterate>
                        </logic:notEmpty>
                        ${total}
                    </td>
                </tr>
                <tr>
                    <td>Greater than 200$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="carBookings">
                            <logic:iterate name="carBookings" id="book">
                                <logic:notEmpty name="carGreater200">
                                    <logic:iterate name="carGreater200" id="car">
                                        <c:if test="${book.carId == car.id}">
                                            <c:set var="total" value="${total + book.price}"/>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                            </logic:iterate>
                        </logic:notEmpty>
                        ${total}
                    </td>
                </tr>
            </tbody> 
            </table>
    </div><!-- end of .tab_container -->
    </article><!-- end of content manager article -->
    
    <article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Income range of customers</h3></header>
    <div>
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Total($)</th>
                    </tr> 
            </thead> 
            <tbody>
                <tr>
                    <td colspan="3" style="text-align: right; background-color: gainsboro;">Greater than 1000$</td></tr>
                <logic:empty name="userGreater1000">
                    <tr><td colspan="3" style="font-style: italic; font-size: 11px;">There are no customer</td></tr>
                </logic:empty>
                <logic:notEmpty name="userGreater1000">
                    <logic:iterate name="userGreater1000" id="u">
                        <tr><td colspan="3"> <bean:write name="u" property="fullname"/> </td></tr>
                    </logic:iterate>
                </logic:notEmpty>

                <tr><td colspan="3" style="text-align: right; background-color: gainsboro;">From 500 to 1000$</td></tr>
                <logic:empty name="user500To1000">
                    <tr><td colspan="3" style="font-style: italic; font-size: 11px;">There are no customer</td></tr>
                </logic:empty>
                <logic:notEmpty name="user500To1000">
                    <logic:iterate name="user500To1000" id="u">
                        <tr><td colspan="3"> <bean:write name="u" property="fullname"/> </td></tr>
                    </logic:iterate>
                </logic:notEmpty>

                <tr><td colspan="3" style="text-align: right; background-color: gainsboro;">From 200 to 500$</td></tr>
                <logic:empty name="user200To500">
                    <tr><td colspan="3" style="font-style: italic; font-size: 11px;">There are no customer</td></tr>
                </logic:empty>
                <logic:notEmpty name="user200To500">
                    <logic:iterate name="user200To500" id="u">
                        <tr><td colspan="3"><bean:write name="u" property="fullname"/></td></tr>
                    </logic:iterate>
                </logic:notEmpty>
            </tbody> 
            </table>
    </div><!-- end of .tab_container -->
    </article><!-- end of content manager article -->
    
<%-- 
    Document   : tourAnalysis-new
    Created on : Jun 3, 2013, 9:05:31 AM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<h4 class="alert_info">Package Tours Analysis</h4>
<article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Package Tour Type</h3></header>
    <div>
            <table class="tablesorter" cellspacing="0"> 
            <thead> 
                    <tr> 
                    <th>Name</th> 
                    <th>Total ($)</th>
                    </tr> 
            </thead> 
            <tbody>
                <logic:notEmpty name="tourTypes">
                    <logic:iterate name="tourTypes" id="item">
                        <tr>
                            <td> <bean:write name="item" property="name"/> </td>
                            <td>
                                <c:set var="total" value="0"/>
                                <logic:notEmpty name="bookings">
                                    <logic:iterate name="bookings" id="book">
                                        <logic:notEmpty name="tours">
                                            <logic:iterate name="tours" id="tour">
                                                <c:if test="${book.package_id == tour.id}">
                                                    <c:if test="${tour.type_id == item.id}">
                                                        <c:set var="total" value="${total + book.price}"/>
                                                    </c:if>
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </logic:iterate>
                                </logic:notEmpty>
                                ${total}
                            </td>
                        </tr>
                    </logic:iterate>
                </logic:notEmpty>
            </tbody>
            </table>
    </div><!-- end of .tab_container -->
    </article><!-- end of content manager article -->
    
    <article class="module width_left_quarter">
    <header><h3 class="tabs_involved">Package Tour Duration</h3></header>
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
                    <td>Less than 2 days</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="toursLess2Days">
                                    <logic:iterate name="toursLess2Days" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>From 3 to 7 days</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tours3To7Days">
                                    <logic:iterate name="tours3To7Days" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>From 8 to 14 days</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tours8To14Days">
                                    <logic:iterate name="tours8To14Days" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>Greater than 14 days</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="toursGreater14Days">
                                    <logic:iterate name="toursGreater14Days" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
    <header><h3 class="tabs_involved">Package Tour Cost</h3></header>
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
                    <td>Less than 200$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tourLess200">
                                    <logic:iterate name="tourLess200" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>From 200$ to 300$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tour200To300">
                                    <logic:iterate name="tour200To300" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>From 300$ to 400$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tour300To400">
                                    <logic:iterate name="tour300To400" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                    <td>Greater than 400$</td>
                    <td>
                        <c:set var="total" value="0"/>
                        <logic:notEmpty name="bookings">
                            <logic:iterate name="bookings" id="book">
                                <logic:notEmpty name="tourGreater400">
                                    <logic:iterate name="tourGreater400" id="tour">
                                        <c:if test="${book.package_id == tour.id}">
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
                <tr><td colspan="3" style="text-align: right; background-color: gainsboro;">Greater than 1000$</td></tr>
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

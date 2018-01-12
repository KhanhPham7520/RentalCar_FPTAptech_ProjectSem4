<%-- 
    Document   : myCart
    Created on : May 27, 2013, 6:43:08 PM
    Author     : Razer™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<script>
    function confirmDelete(){
        return confirm("Are you sure want delete this car?");
    }    
</script>
<div>
        <div class="shop_info">
                <b> Your Cart<br />
            </div>
        </div>
        <div class="vmMainPage">
            <logic:notEmpty name="tourBookings">
                <h2 class="title">Package Tour Booking</h2>
                <div class="cells_cart">
                    <table cellpadding="4" cellspacing="2" border="0" width="100%">
                        <tr class="sectiontableheader"  align="left">
                            <th>Name</th>
                            <th style="text-align: center;">Participants</th>
                            <th style="text-align: center;">Booking Date</th>
                            <th style="text-align: center;">Total</th>
                            <th style="text-align:right;">Action</th>
                        </tr>
                        <logic:iterate name="tourBookings" id="tb">
                            <tr class="sectiontableentry1" valign="top">
                                <td>
                                    <html:link action="/TourAction.do?method=details&id=${tb.package_id}">
                                        <logic:notEmpty name="tours">
                                            <logic:iterate name="tours" id="tour">
                                                <c:if test="${tour.id == tb.package_id}">
                                                    <strong> ${tour.name} </strong>        
                                                </c:if>
                                            </logic:iterate>
                                        </logic:notEmpty>
                                    </html:link>
                                </td>
                                <td style="text-align: center;">${tb.participants}</td>
                                <td style="text-align: center;">${tb.created_on}</td>
                                <td style="text-align: center;">${tb.price}</td>
                                <td style="text-align:right;">
                                    <html:link action="/CartAction.do?method=deleteTourBooking&id=${tb.id}" onclick="return confirmDelete();"><img src="images/remove_from_cart.png" title="Delete"/></html:link>
                                </td>
                            </tr>
                        </logic:iterate>
                        <tr><td colspan="7">&nbsp;</td></tr>
                    </table>
                </div>
            </logic:notEmpty>

            <logic:notEmpty name="toursDestroy">
                <logic:iterate name="toursDestroy" id="tourDes">
                    <h2 class="title">Package Tour Booking Is Destroy</h2>
                    <div class="cells_cart">
                        <table cellpadding="4" cellspacing="2" border="0" width="100%">
                            <tr class="sectiontableheader"  align="left">
                                <th>Name</th>
                                <th style="text-align: center;">Tour Start Date</th>
                                <th style="text-align: center;">Delete Date</th>
                                <th style="text-align: center;">Refund</th>
                            </tr>
                            <tr>
                                <logic:notEmpty name="tours">
                                    <logic:iterate name="tours" id="tour">
                                        <c:if test="${tour.id == tourDes.package_id}">
                                            <td>
                                                <html:link action="/TourAction.do?method=details&id=${tour.id}">
                                                    <strong> ${tour.name} </strong>    
                                                </html:link>
                                            </td>
                                            <td style="text-align: center;"><strong> ${tour.start_date} </strong></td>
                                        </c:if>
                                    </logic:iterate>
                                </logic:notEmpty>
                                <td style="text-align: center;"><bean:write name="tourDes" property="modified_on"/> </td>
                                <td style="text-align: center;"><bean:write name="tourDes" property="refund"/> </td>
                            </tr>
                            <tr><td colspan="5">&nbsp;</td></tr>
                        </table>
                    </div>
                </logic:iterate>
            </logic:notEmpty>

            <logic:notEmpty name="carBookings">
                <h2 class="title">Car Rentals</h2>
                <div class="cells_cart">
                    <table cellpadding="4" cellspacing="2" border="0" width="100%">
                        <tr class="sectiontableheader"  align="left">
                            <th>Name</th>
                            <th style="text-align: center;">Pick Up Date</th>
                            <th style="text-align: center;">Drop Up Date</th>
                            <th style="text-align: center;">Total</th>
                            <th style="text-align:right;">Action</th>
                        </tr>
                        <logic:iterate name="carBookings" id="cb">
                            <tr class="sectiontableentry1" valign="top">
                                <td>
                                    <logic:notEmpty name="cars">
                                        <logic:iterate name="cars" id="car">
                                            <c:if test="${car.id == cb.carId}">
                                                <html:link action="/CarAction.do?method=details&id=${car.id}">
                                                    <strong> ${car.name} </strong>
                                                </html:link>
                                            </c:if>
                                        </logic:iterate>
                                    </logic:notEmpty>
                                </td>
                                <td style="text-align: center;">${cb.pickUpDate}</td>
                                <td style="text-align: center;">${cb.dropUpDate}</td>
                                <td style="text-align: center;">${cb.price}</td>
                                <td style="text-align:right;">
                                    <html:link action="/CartAction.do?method=deleteCarBooking&id=${cb.id}" onclick="return confirmDelete();"><img src="images/remove_from_cart.png" title="Delete"/></html:link>
                                </td>
                            </tr>
                        </logic:iterate>
                        <tr><td colspan="7">&nbsp;</td></tr>
                    </table>
                </div>
            </logic:notEmpty>

            <logic:notEmpty name="carsDestroy">
                <logic:iterate name="carsDestroy" id="carDes">
                    <h2 class="title">Car Rental Is Destroy</h2>
                    <div class="cells_cart">
                        <table cellpadding="4" cellspacing="2" border="0" width="100%">
                            <tr class="sectiontableheader"  align="left">
                                <th>Name</th>
                                <th style="text-align: center;">Booking Date</th>
                                <th style="text-align: center;">Delete Date</th>
                                <th style="text-align: center;">Refund</th>
                            </tr>
                            <tr>
                                <td>
                                    <logic:notEmpty name="cars">
                                        <logic:iterate name="cars" id="car">
                                            <c:if test="${car.id == carDes.carId}">
                                                <html:link action="/CarAction.do?method=details&id=${car.id}">
                                                    <strong> ${car.name} </strong>
                                                </html:link>
                                            </c:if>
                                        </logic:iterate>
                                    </logic:notEmpty>
                                </td>
                                <td style="text-align: center;"><bean:write name="carDes" property="createdOn"/> </td>
                                <td style="text-align: center;"><bean:write name="carDes" property="modifiedOn"/> </td>
                                <td style="text-align: center;"><bean:write name="carDes" property="refund"/> </td>
                            </tr>
                            <tr><td colspan="5">&nbsp;</td></tr>
                        </table>
                    </div>
                </logic:iterate>
            </logic:notEmpty>
        </div>
<div>
    The refund rules are given as below:<br/>

Before 1 day – 75%<br/>
2 days – 80%<br/>
3 days – 85%<br/>
4 days – 90%<br/>
5 days or more – 95%<br/>

</div>

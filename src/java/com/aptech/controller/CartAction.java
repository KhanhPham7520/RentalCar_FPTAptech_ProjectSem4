/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarBookingsDao;
import com.aptech.dao.CarsDao;
import com.aptech.dao.PackageToursDao;
import com.aptech.dao.TourBookingsDao;
import com.aptech.dto.CarBookings;
import com.aptech.dto.Cars;
import com.aptech.dto.PackageTours;
import com.aptech.dto.TourBookings;
import com.aptech.dto.Users;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author ADMIN
 */
public class CartAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String MYCART = "myCart";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward myCart(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(MYCART);
    }

    public ActionForward deleteTourBooking(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");

            int id = Integer.parseInt(request.getParameter("id"));
            TourBookings tb = new TourBookingsDao().getTourBookingById(id);
            PackageTours p = new PackageToursDao().getTourById(tb.getPackage_id());
            //Update Status and Refund
            tb.setStatus(2); //Delete Tour Booking
            //date = (create_on - tour.start_date)
            Calendar currentDate = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            String date1 = formatter.format(currentDate.getTime());
            String date2 = p.getStart_date();
            Date day1;
            Date day2;
            formatter = new SimpleDateFormat("MM/dd/yyyy");
            day1 = (Date) formatter.parse(date1);
            day2 = (Date) formatter.parse(date2);
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(day1);
            cal2.setTime(day2);
            int d = cal2.compareTo(cal1);
            if (d == 1) {
                float temp = (p.getPrice() * 25) / 100;
                tb.setRefund(temp);
            } else if (d == 2) {
                float temp = (p.getPrice() * 20) / 100;
                tb.setRefund(temp);
            } else if (d == 3) {
                float temp = (p.getPrice() * 15) / 100;
                tb.setRefund(temp);
            } else if (d == 4) {
                float temp = (p.getPrice() * 10) / 100;
                tb.setRefund(temp);
            } else if (d > 4) {
                float temp = (p.getPrice() * 5) / 100;
                tb.setRefund(temp);
            }
            tb.setModified_on(date1);
            new TourBookingsDao().updateTourBooking(tb);
            getData(request, response);
        }
        return mapping.findForward(MYCART);
    }
    
    public ActionForward deleteCarBooking(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("user") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            CarBookings cb = new CarBookingsDao().getCarBookingById(id);
            //Update Status and Refund
            cb.setStatus(2); //Delete Tour Booking
            //date = (create_on - tour.start_date)
            Calendar currentDate = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            String date1 = formatter.format(currentDate.getTime());
            String date2 = cb.getPickUpDate();
            Date day1;
            Date day2;
            day1 = (Date) formatter.parse(date1);
            day2 = (Date) formatter.parse(date2);
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(day1);
            cal2.setTime(day2);
            int d = cal2.compareTo(cal1);
            if (d == 1) {
                float temp = (cb.getPrice() * 25) / 100;
                cb.setRefund(temp);
            } else if (d == 2) {
                float temp = (cb.getPrice() * 20) / 100;
                cb.setRefund(temp);
            } else if (d == 3) {
                float temp = (cb.getPrice() * 15) / 100;
                cb.setRefund(temp);
            } else if (d == 4) {
                float temp = (cb.getPrice() * 10) / 100;
                cb.setRefund(temp);
            } else if (d > 4) {
                float temp = (cb.getPrice() * 5) / 100;
                cb.setRefund(temp);
            }
            cb.setModifiedOn(date1);
            new CarBookingsDao().updateCarBooking(cb);
            getData(request, response);
        }
        return mapping.findForward(MYCART);
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            //Get All Booking of User
            session.setAttribute("user", user);
            ArrayList<TourBookings> tourBookings = new TourBookingsDao().getTourBookingsByUserId(user.getId());
            request.setAttribute("tourBookings", tourBookings);
            ArrayList<PackageTours> tours = new PackageToursDao().getAllPackageTours();
            request.setAttribute("tours", tours);
            ArrayList<CarBookings> carBookings = new CarBookingsDao().getCarBookingsByUserId(user.getId());
            request.setAttribute("carBookings", carBookings);
            ArrayList<TourBookings> toursDestroy = new TourBookingsDao().getTourBookingsDestroyByUserId(user.getId());
            request.setAttribute("toursDestroy", toursDestroy);
            ArrayList<Cars> cars = new CarsDao().getAllCars();
            request.setAttribute("cars", cars);
            ArrayList<CarBookings> carsDestroy = new CarBookingsDao().getCarBookingsDestroyByUserId(user.getId());
            request.setAttribute("carsDestroy", carsDestroy);
        }
    }
}
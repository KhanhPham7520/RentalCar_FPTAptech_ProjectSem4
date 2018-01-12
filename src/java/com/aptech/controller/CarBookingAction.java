/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarBookingsDao;
import com.aptech.dao.CarModelsDao;
import com.aptech.dao.CarTypesDao;
import com.aptech.dao.CarsDao;
import com.aptech.dao.MailDao;
import com.aptech.dao.UsersDao;
import com.aptech.dto.CarBookings;
import com.aptech.dto.CarModels;
import com.aptech.dto.CarTypes;
import com.aptech.dto.Cars;
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
public class CarBookingAction extends DispatchAction {

    private static final String VIEW = "view";
    private static final String BOOK = "book";
    private static final String BOOKING_BILL = "bookingBill";
    private static final String DETAILS = "details";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward details(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        CarBookings item = new CarBookingsDao().getCarBookingById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }
    
    public ActionForward details2(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        CarBookings item2 = new CarBookingsDao().getCarBookingById(id);
        request.setAttribute("item2", item2);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }
    
    public ActionForward booking(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Cars item = new CarsDao().getCarById(id);
        request.setAttribute("item", item);
        getData(request, response);
        //Check is logged, If is not logged then display form for create account
        HttpSession session = request.getSession(true);
        //If is logged
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            request.setAttribute("user", user);
        }
        return mapping.findForward(BOOK);
    }

    public ActionForward submit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //Insert data into car_bookings table
        int id = Integer.parseInt(request.getParameter("id"));
        Cars item = new CarsDao().getCarById(id);
        String pickUpDate = request.getParameter("pickUpDate");
        String dropUpDate = request.getParameter("dropUpDate");
        HttpSession session = request.getSession(true);
        //If is logged
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            CarBookings cb = new CarBookings();
            cb.setPickUpDate(pickUpDate);
            cb.setDropUpDate(dropUpDate);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            Date day1 = (Date) formatter.parse(pickUpDate);
            Date day2 = (Date) formatter.parse(dropUpDate);
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(day1);
            cal2.setTime(day2);
            int d1 = cal1.get(Calendar.DATE);
            int d2 = cal2.get(Calendar.DATE);
            int d = d2 - d1;
            float total = 0;
            if (d > 0) {
                total = d * item.getPrice();
                cb.setPrice(total);
            } else {
                cb.setPrice(item.getPrice());
            }
            //Get curent date
            Calendar currentDate = Calendar.getInstance();
            String dateNow = formatter.format(currentDate.getTime());
            cb.setCreatedOn(dateNow);
            cb.setStatus(0);
            cb.setCarId(item.getId());
            cb.setUserId(user.getId());
            new CarBookingsDao().createCarBooking(cb);
            request.setAttribute("carBooking", cb);
            request.setAttribute("item", item);
            request.setAttribute("user", user);
            request.setAttribute("total", total);
            getData(request, response);
            //Send mail
            String body = "You have car rental at Car Plus Rental Car " + "||||"
                    + "Detail: Fullname: " + user.getFullname()+"||||"+ "Car: "+item.getName()+"||||"+
                    "Pick Up Date: "+cb.getPickUpDate()+"||||"+"Drop Up Date: "+cb.getDropUpDate()+"||||"+
                    "Price: " + item.getPrice()+"||||";
            new MailDao().send(user.getEmail(), "CarPlus Rental Car System Inc.", body);
            return mapping.findForward(BOOKING_BILL);
        }
        return mapping.findForward(BOOK);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new CarBookingsDao().deleteCarBooking(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }
    
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<CarBookings> list = new CarBookingsDao().getAllCarBookings();
        request.setAttribute("list", list);
        ArrayList<CarBookings> listDes = new CarBookingsDao().getCarBookingsDestroy();
        request.setAttribute("listDes", listDes);
        ArrayList<Users> users = new UsersDao().getAllUsers();
        request.setAttribute("users", users);
        ArrayList<Cars> cars = new CarsDao().getAllCars();
        request.setAttribute("cars", cars);
        ArrayList<CarModels> modelList = new CarModelsDao().getAllCarModels();
        request.setAttribute("modelList", modelList);
        ArrayList<CarTypes> typeList = new CarTypesDao().getAllCarTypes();
        request.setAttribute("typeList", typeList);
    }
}

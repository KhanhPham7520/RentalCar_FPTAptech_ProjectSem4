/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.MailDao;
import com.aptech.dao.PackageTourTypesDao;
import com.aptech.dao.PackageToursDao;
import com.aptech.dao.TourBookingsDao;
import com.aptech.dao.UsersDao;
import com.aptech.dto.PackageTourTypes;
import com.aptech.dto.PackageTours;
import com.aptech.dto.TourBookings;
import com.aptech.dto.Users;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class TourBookingAction extends DispatchAction {

    private static final String BOOK = "book";
    private static final String BOOKING_BILL = "bookingBill";
    private static final String VIEW = "view";
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
        TourBookings item = new TourBookingsDao().getTourBookingById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }
    
    public ActionForward details2(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        TourBookings item2 = new TourBookingsDao().getTourBookingById(id);
        request.setAttribute("item2", item2);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }

    public ActionForward booking(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        PackageTours item = new PackageToursDao().getTourById(id);
        request.setAttribute("item", item);
        ArrayList<PackageTourTypes> packageTourTypeList = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("packageTourTypeList", packageTourTypeList);
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
        //Insert data into tour_bookings table
        int id = Integer.parseInt(request.getParameter("id"));
        PackageTours item = new PackageToursDao().getTourById(id);
//        int participants = Integer.parseInt(request.getParameter("participants"));
        HttpSession session = request.getSession(true);
        //If is logged
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            TourBookings tb = new TourBookings();
//            tb.setParticipants(participants);
            tb.setPrice(1 * item.getPrice());
            //Get curent date
            Calendar currentDate = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            String dateNow = formatter.format(currentDate.getTime());
            tb.setCreated_on(dateNow);
            tb.setStatus(0);
            tb.setPackage_id(item.getId());
            tb.setUser_id(user.getId());
            new TourBookingsDao().createTourBooking(tb);
            request.setAttribute("tourBooking", tb);
            request.setAttribute("item", item);
            request.setAttribute("user", user);
            String body = "You Ordering Tour at CarPlus Rental Car System. "
                    + "Detail: Fullname: " + user.getFullname()+"||||"+ "Tour: "+item.getName()+"||||"+
                    "Start Date: "+item.getStart_date()+"||||"+"End Date: "+item.getReturn_date()+"||||"+
                    "Price: " + item.getPrice()+"||||";
            new MailDao().send(user.getEmail(), "CarPlus Rental Car System : Rental Car and Tour", body);
            return mapping.findForward(BOOKING_BILL);
        }
        return mapping.findForward(BOOK);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new TourBookingsDao().deleteTourBooking(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }
    
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<TourBookings> list = new TourBookingsDao().getAllTourBookings();
        request.setAttribute("list", list);
        ArrayList<TourBookings> listDes = new TourBookingsDao().getTourBookingsDestroy();
        request.setAttribute("listDes", listDes);
        ArrayList<PackageTours> tours = new PackageToursDao().getAllPackageTours();
        request.setAttribute("tours", tours);
        ArrayList<Users> users = new UsersDao().getAllUsers();
        request.setAttribute("users", users);
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.*;
import com.aptech.dto.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author ADMIN
 */
public class TourAnalysisAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";

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

    private void getData(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        ArrayList<PackageTours> tours = new PackageToursDao().getAllPackageTours();
        request.setAttribute("tours", tours);
        ArrayList<PackageTourTypes> tourTypes = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("tourTypes", tourTypes);
        ArrayList<TourBookings> bookings = new TourBookingsDao().getAllTourBookings();
        request.setAttribute("bookings", bookings);
        ArrayList<Users> users = new UsersDao().getAllUsers();
        request.setAttribute("users", users);

        //Analysis Package Duration
        ArrayList<PackageTours> toursLess2Days = new ArrayList<PackageTours>();
        ArrayList<PackageTours> tours3To7Days = new ArrayList<PackageTours>();
        ArrayList<PackageTours> tours8To14Days = new ArrayList<PackageTours>();
        ArrayList<PackageTours> toursGreater14Days = new ArrayList<PackageTours>();
        for (int i = 0; i < tours.size(); i++) {
            String startDate = tours.get(i).getStart_date();
            String endDate = tours.get(i).getReturn_date();
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            Date day1 = (Date) formatter.parse(startDate);
            Date day2 = (Date) formatter.parse(endDate);
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(day1);
            cal2.setTime(day2);
            int d1 = cal1.get(Calendar.DATE);
            int d2 = cal2.get(Calendar.DATE);
            int d = d2 - d1;
            if (d > 14) {
                toursGreater14Days.add(tours.get(i));
            } else if (d > 8) {
                tours8To14Days.add(tours.get(i));
            } else if (d > 3) {
                tours3To7Days.add(tours.get(i));
            } else {
                toursLess2Days.add(tours.get(i));
            }
        }
        request.setAttribute("toursLess2Days", toursLess2Days);
        request.setAttribute("tours3To7Days", tours3To7Days);
        request.setAttribute("tours8To14Days", tours8To14Days);
        request.setAttribute("toursGreater14Days", toursGreater14Days);

        //Analysis Package by Cost
        ArrayList<PackageTours> tourLess200 = new ArrayList<PackageTours>();
        ArrayList<PackageTours> tour200To300 = new ArrayList<PackageTours>();
        ArrayList<PackageTours> tour300To400 = new ArrayList<PackageTours>();
        ArrayList<PackageTours> tourGreater400 = new ArrayList<PackageTours>();
        for (int i = 0; i < tours.size(); i++) {
            float t = tours.get(i).getPrice();
            if (t > 400) {
                tourGreater400.add(tours.get(i));
            } else if (t >= 300) {
                tour300To400.add(tours.get(i));
            } else if (t >= 200) {
                tour200To300.add(tours.get(i));
            } else {
                tourLess200.add(tours.get(i));
            }
        }
        request.setAttribute("tourLess200", tourLess200);
        request.setAttribute("tour200To300", tour200To300);
        request.setAttribute("tour300To400", tour300To400);
        request.setAttribute("tourGreater400", tourGreater400);

        //Analysis Package by Income range of customers
        ArrayList<Users> userGreater1000 = new ArrayList<Users>();
        ArrayList<Users> user500To1000 = new ArrayList<Users>();
        ArrayList<Users> user200To500 = new ArrayList<Users>();
        for (int i = 0; i < users.size(); i++) {
            float t = 0;
            ArrayList<TourBookings> temp = new TourBookingsDao().getTourBookingsByUserId(users.get(i).getId());
            for (int j = 0; j < temp.size(); j++) {
                t = t + temp.get(j).getPrice();
            }
            if (t > 1000) {
                userGreater1000.add(users.get(i));
            } else if (t > 500) {
                user500To1000.add(users.get(i));
            } else if (t > 200) {
                user200To500.add(users.get(i));
            }
        }
        request.setAttribute("userGreater1000", userGreater1000);
        request.setAttribute("user500To1000", user500To1000);
        request.setAttribute("user200To500", user200To500);
    }
}
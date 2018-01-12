/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.*;
import com.aptech.dto.*;
import java.util.ArrayList;
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
public class CarAnalysisAction extends DispatchAction {

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

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Cars> cars = new CarsDao().getAllCars();
        request.setAttribute("cars", cars);
        ArrayList<CarTypes> carTypes = new CarTypesDao().getAllCarTypes();
        request.setAttribute("carTypes", carTypes);
        ArrayList<CarModels> carModels = new CarModelsDao().getAllCarModels();
        request.setAttribute("carModels", carModels);
        ArrayList<CarBookings> carBookings = new CarBookingsDao().getAllCarBookings();
        request.setAttribute("carBookings", carBookings);
        ArrayList<Users> users = new UsersDao().getAllUsers();
        request.setAttribute("users", users);
        
        //Analysis Car by Cost
        ArrayList<Cars> carLess50 = new ArrayList<Cars>();
        ArrayList<Cars> car50To100 = new ArrayList<Cars>();
        ArrayList<Cars> car100To200 = new ArrayList<Cars>();
        ArrayList<Cars> carGreater200 = new ArrayList<Cars>();
        for(int i = 0; i < cars.size(); i++){
            float t = cars.get(i).getPrice();
            if(t > 200){
                carGreater200.add(cars.get(i));
            } else if (t > 100){
                car100To200.add(cars.get(i));
            } else if (t > 50){
                car50To100.add(cars.get(i));
            } else {
                carLess50.add(cars.get(i));
            }
        }
        request.setAttribute("carLess50", carLess50);
        request.setAttribute("car50To100", car50To100);
        request.setAttribute("car100To200", car100To200);
        request.setAttribute("carGreater200", carGreater200);
        
        //Analysis Package by Income range of customers
        ArrayList<Users> userGreater1000 = new ArrayList<Users>();
        ArrayList<Users> user500To1000 = new ArrayList<Users>();
        ArrayList<Users> user200To500 = new ArrayList<Users>();
        for (int i = 0; i < users.size(); i++) {
            float t = 0;
            ArrayList<CarBookings> temp = new CarBookingsDao().getCarBookingsByUserId(users.get(i).getId());
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
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
public class SearchAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";
    private static final String ERROR = "error";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ActionForward searchTours(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Float priceFrom = request.getParameter("priceFrom") == null ? 0 : Float.parseFloat(request.getParameter("priceFrom"));
        Float priceTo = request.getParameter("priceTo") == null ? 0 : Float.parseFloat(request.getParameter("priceTo"));
        int typeId = Integer.parseInt(request.getParameter("type_id"));
        ArrayList<PackageTours> tours = new PackageToursDao().search(priceFrom, priceTo, typeId);
        ArrayList<PackageTourTypes> packageTourTypeList = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("packageTourTypeList", packageTourTypeList);
        if (tours.size() > 0) {
            request.setAttribute("tours", tours);
            return mapping.findForward(VIEW);
        }
        return mapping.findForward(ERROR);
    }

    public ActionForward searchCars(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Float priceFrom = request.getParameter("priceFrom") == null ? 0 : Float.parseFloat(request.getParameter("priceFrom"));
        Float priceTo = request.getParameter("priceTo") == null ? 0 : Float.parseFloat(request.getParameter("priceTo"));
        int typeId = request.getParameter("type_id") == null ? 0 : Integer.parseInt(request.getParameter("type_id"));
        int seatingCapacity = request.getParameter("seatingCapacity") == null ? 0 : Integer.parseInt(request.getParameter("seatingCapacity"));
        ArrayList<Cars> cars = new CarsDao().search(priceFrom, priceTo, seatingCapacity, typeId);
        if (cars.size() > 0) {
            request.setAttribute("cars", cars);
            return mapping.findForward(VIEW);
        }
        return mapping.findForward(ERROR);
    }

    public ActionForward searchHotels(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Float priceFrom = request.getParameter("priceFrom") == null ? 0 : Float.parseFloat(request.getParameter("priceFrom"));
        Float priceTo = request.getParameter("priceTo") == null ? 0 : Float.parseFloat(request.getParameter("priceTo"));
        int location_id = request.getParameter("location_id") == null ? 0 : Integer.parseInt(request.getParameter("location_id"));
        ArrayList<Hotels> hotels = new HotelsDao().search(priceFrom, priceTo, location_id);
        if (hotels.size() > 0) {
            request.setAttribute("hotels", hotels);
            return mapping.findForward(VIEW);
        }
        return mapping.findForward(ERROR);
    }

    public ActionForward searchFlights(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int arr_id = request.getParameter("arrival_id") == null ? 0 : Integer.parseInt(request.getParameter("arrival_id"));
        int de_id = request.getParameter("departure_id") == null ? 0 : Integer.parseInt(request.getParameter("departure_id"));
        ArrayList<Flights> flights = new FlightsDao().search(arr_id, de_id);
        request.setAttribute("flights", flights);
        ArrayList<Locations> locationList = new LocationsDao().getAllLocations();
        if (flights.size() > 0) {
            request.setAttribute("locationList", locationList);
            return mapping.findForward(VIEW);
        }
        return mapping.findForward(ERROR);
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.FoodsDao;
import com.aptech.dao.HotelsDao;
import com.aptech.dao.LocationsDao;
import com.aptech.dao.PackageTourFoodsDao;
import com.aptech.dao.PackageTourHotelsDao;
import com.aptech.dao.PackageTourLocationsDao;
import com.aptech.dao.PackageTourTypesDao;
import com.aptech.dao.PackageToursDao;
import com.aptech.dao.TourBookingsDao;
import com.aptech.dto.Foods;
import com.aptech.dto.Hotels;
import com.aptech.dto.Locations;
import com.aptech.dto.PackageTourFoods;
import com.aptech.dto.PackageTourHotels;
import com.aptech.dto.PackageTourLocations;
import com.aptech.dto.PackageTourTypes;
import com.aptech.dto.PackageTours;
import java.io.FileOutputStream;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author ADMIN
 */
public class TourAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";
    private static final String CLIENT = "client";
    private static final String DETAILS = "details";
    private static final String EDITTOUR = "editTour";
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    PackageToursDao itemDao = new PackageToursDao();
    PackageTourLocationsDao ptlDao = new PackageTourLocationsDao();
    PackageTourHotelsDao pthDao = new PackageTourHotelsDao();
    PackageTourFoodsDao ptfDao = new PackageTourFoodsDao();

    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward listclient(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(CLIENT);
    }

    public ActionForward getTourByCateID(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        ArrayList<PackageTours> list = itemDao.getPackageToursByCateId(id);
        request.setAttribute("list", list);
        ArrayList<PackageTourTypes> packageTourTypeList = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("packageTourTypeList", packageTourTypeList);
        return mapping.findForward(CLIENT);
    }

    public ActionForward details(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        PackageTours item = itemDao.getTourById(id);
        request.setAttribute("item", item);

        ArrayList<Locations> tourLocations = new LocationsDao().getLocationsByTourId(id);
        request.setAttribute("tourLocations", tourLocations);
        ArrayList<Hotels> tourHotels = new HotelsDao().getHotelsByTourId(id);
        request.setAttribute("tourHotels", tourHotels);
        ArrayList<Foods> foodLocations = new FoodsDao().getFoodsByTourId(id);
        request.setAttribute("foodLocations", foodLocations);

        getData(request, response);
        return mapping.findForward(DETAILS);
    }

    public ActionForward addTour(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(EDITTOUR);
    }

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        PackageTours item = (PackageTours) form;
        //Set TypeId for PackageTours
        String temp = request.getParameter("type_id");
        int type_id = Integer.parseInt(temp);
        item.setType_id(type_id);

        //Images
        FormFile myFile = item.getTheFile();
        String fileName = myFile.getFileName();
        byte[] fileData = myFile.getFileData();
        String filePath = servlet.getServletContext().getRealPath("\\") + "/images/products/tours/" + fileName;
        FileOutputStream output = new FileOutputStream(filePath);
        output.write(fileData);
        item.setImage(fileName);

        itemDao.createPackageTour(item);

        //Get Array of Locations, Hotels, Foods for Insert into: 
        //package_tour_locations, package_tour_hotels, package_tour_foods tables
        String choosenLocations = request.getParameter("choosenLocations");
        String choosenHotels = request.getParameter("choosenHotels");
        String choosenFoods = request.getParameter("choosenFoods");
        //Get ID of package_tours Insert last
        int idTour = itemDao.getLastPackageTours().getId();
        int idtemp;
        PackageTourLocations it;
        if (!choosenLocations.equals("")) {
            String[] strLocationSplit = choosenLocations.split(",");
            for (int i = 0; i < strLocationSplit.length; i++) {
                //Get id of location for Insert into package_tour_locations tablse.
                idtemp = Integer.parseInt(strLocationSplit[i]);
                it = new PackageTourLocations();
                it.setLocationId(idtemp);
                it.setPackageTourId(idTour);
                ptlDao.createPackageTourLocation(it);
            }
        }
        PackageTourHotels hi;
        if (!choosenHotels.equals("")) {
            String[] strHotelSplit = choosenHotels.split(",");
            for (int i = 0; i < strHotelSplit.length; i++) {
                //Get id of hotel for Insert into package_tour_hotels tablse.
                idtemp = Integer.parseInt(strHotelSplit[i]);
                hi = new PackageTourHotels();
                hi.setHotelId(idtemp);
                hi.setPackageTourId(idTour);
                pthDao.createPackageTourHotel(hi);
            }
        }
        PackageTourFoods fo;
        if (!choosenFoods.equals("")) {
            String[] strFoodSplit = choosenFoods.split(",");
            for (int i = 0; i < strFoodSplit.length; i++) {
                //Get id of hotel for Insert into package_tour_hotels tablse.
                idtemp = Integer.parseInt(strFoodSplit[i]);
                fo = new PackageTourFoods();
                fo.setFood_id(idtemp);
                fo.setPackage_tour_id(idTour);
                ptfDao.createPackageTourFood(fo);
            }
        }

        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        PackageTours item = itemDao.getTourById(id);
        request.setAttribute("item", item);

        ArrayList<Locations> tourLocations = new LocationsDao().getLocationsByTourId(id);
        request.setAttribute("tourLocations", tourLocations);
        ArrayList<Hotels> tourHotels = new HotelsDao().getHotelsByTourId(id);
        request.setAttribute("tourHotels", tourHotels);
        ArrayList<Foods> foodLocations = new FoodsDao().getFoodsByTourId(id);
        request.setAttribute("foodLocations", foodLocations);
        getData(request, response);
        return mapping.findForward(EDITTOUR);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        PackageTours item = (PackageTours) form;
        String type_temp = request.getParameter("type_id");
        int type_id = Integer.parseInt(type_temp);
        item.setType_id(type_id);

        itemDao.updatePackageTour(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new PackageTourFoodsDao().deleteTourFood(id);
        new PackageTourHotelsDao().deleteTourHotel(id);
        new PackageTourLocationsDao().deleteTourLocation(id);
        new TourBookingsDao().deleteTourBookingByTour(id);
        new PackageToursDao().deletePackageTour(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }
    
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<PackageTours> list = itemDao.getAllPackageTours();
        request.setAttribute("list", list);
        ArrayList<PackageTourTypes> packageTourTypeList = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("packageTourTypeList", packageTourTypeList);
        ArrayList<Locations> locationList = new LocationsDao().getAllLocations();
        request.setAttribute("locationList", locationList);
        ArrayList<Foods> foodList = new FoodsDao().getAllFoods();
        request.setAttribute("foodList", foodList);
        ArrayList<Hotels> hotelList = new HotelsDao().getAllHotels();
        request.setAttribute("hotelList", hotelList);
    }
}

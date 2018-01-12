/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.HotelsDao;
import com.aptech.dao.LocationsDao;
import com.aptech.dao.PackageTourHotelsDao;
import com.aptech.dto.Hotels;
import com.aptech.dto.Locations;
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
public class HotelAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";
    private static final String EDITHOTEL = "editHotel";
    private static final String CLIENT = "client";
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
    HotelsDao itemDao = new HotelsDao();
    LocationsDao locaDao = new LocationsDao();

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

    public ActionForward details(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Hotels item = itemDao.getHotelById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }
    
    public ActionForward addHotel(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(EDITHOTEL);
    }
    
    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String temp = request.getParameter("location_id");
        int location_id = Integer.parseInt(temp);
        Hotels item = (Hotels) form;
        item.setLocation_id(location_id);
        itemDao.createHotel(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Hotels item = itemDao.getHotelById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(EDITHOTEL);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String temp = request.getParameter("location_id");
        String cut = temp.substring(0, 1);
        int location_id = Integer.parseInt(cut);
        Hotels item = (Hotels) form;
        item.setLocation_id(location_id);
        itemDao.updateHotel(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new PackageTourHotelsDao().deleteTourHotelByHotelId(id);
        itemDao.deleteHotel(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Hotels> list = itemDao.getAllHotels();
        request.setAttribute("list", list);
        ArrayList<Locations> locationList = locaDao.getAllLocations();
        request.setAttribute("locationList", locationList);
    }
}

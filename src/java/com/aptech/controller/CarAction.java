/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarBookingsDao;
import com.aptech.dao.CarModelsDao;
import com.aptech.dao.CarTypesDao;
import com.aptech.dao.CarsDao;
import com.aptech.dto.CarModels;
import com.aptech.dto.CarTypes;
import com.aptech.dto.Cars;
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
public class CarAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";
    private static final String EDITCAR = "editCar";
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
    CarsDao itemDao = new CarsDao();

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
        Cars item = itemDao.getCarById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(DETAILS);
    }
    
    public ActionForward addCar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(EDITCAR);
    }

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Cars item = (Cars) form;
        // Process the FormFile
        FormFile myFile = item.getTheFile();
        String fileName = myFile.getFileName();
        byte[] fileData = myFile.getFileData();
        String filePath = servlet.getServletContext().getRealPath("\\") + "/images/products/cars/" + fileName;
        FileOutputStream output = new FileOutputStream(filePath);
        output.write(fileData);
        item.setImages(fileName);

        String driver = request.getParameter("driver") == null ? "" : request.getParameter("driver");
        String air = request.getParameter("airConditioner") == null ? "" : request.getParameter("airConditioner");
        String model_temp = request.getParameter("model_id");
        int model_id = Integer.parseInt(model_temp);
        String type_temp = request.getParameter("type_id");
        int type_id = Integer.parseInt(type_temp);
        if (driver.equals("on")) {
            item.setDriver(1);
        } else {
            item.setDriver(0);
        }
        if (air.equals("on")) {
            item.setAirConditioner(1);
        } else {
            item.setAirConditioner(0);
        }
        item.setModelId(model_id);
        item.setTypeId(type_id);
        itemDao.createCar(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Cars item = itemDao.getCarById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(EDITCAR);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Cars item = (Cars) form;
        String driver = request.getParameter("driver") == null ? "" : request.getParameter("driver");
        String air = request.getParameter("airConditioner") == null ? "" : request.getParameter("airConditioner");
        String model_temp = request.getParameter("model_id");
        int model_id = Integer.parseInt(model_temp);
        String type_temp = request.getParameter("type_id");
        int type_id = Integer.parseInt(type_temp);
        if (driver.equals("on")) {
            item.setDriver(1);
        } else {
            item.setDriver(0);
        }
        if (air.equals("on")) {
            item.setAirConditioner(1);
        } else {
            item.setAirConditioner(0);
        }
        item.setModelId(model_id);
        item.setTypeId(type_id);

        itemDao.updateCar(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new CarBookingsDao().deleteCarBookingByCar(id);
        itemDao.deleteCar(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Cars> list = itemDao.getAllCars();
        request.setAttribute("list", list);
        ArrayList<CarModels> modelList = new CarModelsDao().getAllCarModels();
        request.setAttribute("modelList", modelList);
        ArrayList<CarTypes> typeList = new CarTypesDao().getAllCarTypes();
        request.setAttribute("typeList", typeList);
    }
}

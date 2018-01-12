/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarModelsDao;
import com.aptech.dao.CarTypesDao;
import com.aptech.dao.CarsDao;
import com.aptech.dao.PackageTourTypesDao;
import com.aptech.dao.PackageToursDao;
import com.aptech.dto.CarModels;
import com.aptech.dto.CarTypes;
import com.aptech.dto.Cars;
import com.aptech.dto.PackageTourTypes;
import com.aptech.dto.PackageTours;
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
public class HomeAction extends DispatchAction {

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
        ArrayList<PackageTours> tours = new PackageToursDao().getPackageToursForHome();
        request.setAttribute("tours", tours);
        ArrayList<PackageTourTypes> packageTourTypeList = new PackageTourTypesDao().getAllPackageTourTypes();
        request.setAttribute("packageTourTypeList", packageTourTypeList);
        ArrayList<Cars> cars = new CarsDao().getAllCarsHome();
        request.setAttribute("cars", cars);
        ArrayList<CarModels> modelList = new CarModelsDao().getAllCarModels();
        request.setAttribute("modelList", modelList);
        ArrayList<CarTypes> typeList = new CarTypesDao().getAllCarTypes();
        request.setAttribute("typeList", typeList);
    }
}

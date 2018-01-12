/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.PackageTourTypesDao;
import com.aptech.dto.PackageTourTypes;
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
public class TourTypeAction extends DispatchAction {

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
    PackageTourTypesDao tourTypeDao = new PackageTourTypesDao();

    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String name = request.getParameter("name");
        PackageTourTypes item = (PackageTourTypes) form;
        item.setName(name);
        tourTypeDao.createPackageTourType(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        PackageTourTypes item = tourTypeDao.getPackageTourTypeById(id);
        request.setAttribute("tourType", item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        PackageTourTypes item = (PackageTourTypes) form;
        tourTypeDao.updatePackageTourType(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        tourTypeDao.deletePackageTourType(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }
    
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<PackageTourTypes> list = tourTypeDao.getAllPackageTourTypes();
        request.setAttribute("list", list);
    }
}

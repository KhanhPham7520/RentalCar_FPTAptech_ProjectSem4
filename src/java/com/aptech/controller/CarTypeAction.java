/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarTypesDao;
import com.aptech.dto.CarTypes;
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
public class CarTypeAction extends DispatchAction {

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
    CarTypesDao itemDao = new CarTypesDao();

    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward add(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CarTypes item = (CarTypes) form;
        itemDao.createCarType(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        CarTypes item = itemDao.getCarTypeById(id);
        request.setAttribute("item", item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CarTypes item = (CarTypes) form;
        itemDao.updateCarType(item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        itemDao.deleteCarType(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<CarTypes> list = itemDao.getAllCarTypes();
        request.setAttribute("list", list);
    }
}
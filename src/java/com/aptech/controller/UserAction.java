/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.CarBookingsDao;
import com.aptech.dao.TourBookingsDao;
import com.aptech.dao.UsersDao;
import com.aptech.dto.Users;
import com.aptech.util.HashMD5;
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
public class UserAction extends DispatchAction {

    /* forward name="success" path="" */
    private static final String VIEW = "view";
    private static final String EDIT = "edit";
    private static final String EDITROLE = "editRole";
    private static final String EDIT_PROFILE = "editProfile";
    private static final String SUCCESS = "success";
    private static final String DONE = "done";
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
    UsersDao itemDao = new UsersDao();

    public ActionForward register(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Users item = (Users) form;
        item.setRole(0);
        //Hash Md5 Password
        String pass = item.getPassword();
        item.setPassword(HashMD5.getMd5Digest(pass));
        item.setRole(0);
        //Check is exist of Email
        boolean t = itemDao.checkExistEmail(item.getEmail());
        if (!t) {
            itemDao.createUser(item);
            request.setAttribute("user", item);
        } else {
            String message = "This email is exist in this System!";
            request.setAttribute("message", message);
            return mapping.findForward(ERROR);
        }
        return mapping.findForward(DONE);
    }

    public ActionForward list(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    public ActionForward edit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String email = request.getParameter("email");
        Users item = itemDao.getUserByEmail(email);
        request.setAttribute("item", item);
        return mapping.findForward(EDIT);
    }

    public ActionForward editProfile(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String email = request.getParameter("email");
        Users item = itemDao.getUserByEmail(email);
        request.setAttribute("item", item);
        return mapping.findForward(EDIT_PROFILE);
    }

    public ActionForward editRole(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String email = request.getParameter("email");
        Users item = itemDao.getUserByEmail(email);
        request.setAttribute("item", item);
        return mapping.findForward(EDITROLE);
    }
    
    public ActionForward updateRole(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String email = request.getParameter("email");
        Users item = itemDao.getUserByEmail(email);
        int role = request.getParameter("roleId") == null ? 0 : Integer.parseInt(request.getParameter("roleId"));
        item.setRole(role);
        itemDao.updateRole(item);
        request.setAttribute("user", item);
        getData(request, response);
        return mapping.findForward(VIEW);
    }
    public ActionForward update(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Users item = (Users) form;
        //Hash Md5 Password
        String pass = item.getPassword();
        item.setPassword(HashMD5.getMd5Digest(pass));
        itemDao.updateUser(item);
        request.setAttribute("user", item);
        return mapping.findForward(SUCCESS);
    }

    public ActionForward updateProfile(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Users item = (Users) form;
        //Hash Md5 Password
        String pass = item.getPassword();
        item.setPassword(HashMD5.getMd5Digest(pass));
        itemDao.updateUser(item);
        request.setAttribute("user", item);
        return mapping.findForward(DONE);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        new CarBookingsDao().deleteCarBookingByUser(id);
        new TourBookingsDao().deleteTourBookingByUser(id);
        itemDao.deleteUser(id);
        getData(request, response);
        return mapping.findForward(VIEW);
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Users> list = itemDao.getAllUsers();
        request.setAttribute("list", list);
    }
}

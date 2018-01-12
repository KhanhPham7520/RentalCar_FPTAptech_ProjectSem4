/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.controller;

import com.aptech.dao.UsersDao;
import com.aptech.dto.Users;
import com.aptech.util.HashMD5;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author ADMIN
 */
public class LoginAction extends DispatchAction {

    private UsersDao usDao = new UsersDao();
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ADMIN = "admin";
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
    public ActionForward checkLogin(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }
        Users user = null;
        String email = request.getParameter("email");
        //Hash Md5 Password
        String pass = request.getParameter("password");
        String password = HashMD5.getMd5Digest(pass);

        if (usDao.checkLogin(email, password)) {
            user = usDao.getUserByEmail(email);
            if (user.getRole() == 1) {
                session.setAttribute("user", user);
                return mapping.findForward(ADMIN);
            } else {
                session.setAttribute("user", user);
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(ERROR);
    }

    public ActionForward logout(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);
        Users user = (Users) session.getAttribute("user");
        session.removeAttribute("user");
        return mapping.findForward(SUCCESS);
    }
}

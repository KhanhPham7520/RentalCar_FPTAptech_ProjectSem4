/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Users;
import com.aptech.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**a
 *
 * @author ADMIN
 */
public class UsersDao {

    private final String SQL_CHECK_LOGIN = "SELECT * from users WHERE email=? and password =?";
    private final String SQL_CHECK_EXIST_EMAIL = "SELECT * from users WHERE email = ?";
    private final String SQL_CREATE = "INSERT INTO users(fullname, address, phone, nationality, email, password, role) VALUES(?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM users ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE users SET fullname = ?, address = ?, phone = ?, nationality = ?, email = ?, password = ?, role = ? WHERE id = ?";
    private final String SQL_UPDATE_ROLE = "UPDATE users SET role = ? WHERE email = ?";
    private final String SQL_DELETE = "DELETE FROM users WHERE id = ?";
    private final String SQL_GET_USER_BY_EMAIL = "SELECT * from users where email=?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public UsersDao() {
        conn = null;
    }

    public boolean checkLogin(String email, String password) throws SQLException {
        boolean result = false;
        conn = DBUtil.getConn();
        try {
            pst = conn.prepareStatement(SQL_CHECK_LOGIN);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return result;
    }

    public boolean checkExistEmail(String email) throws SQLException {
        boolean result = false;
        conn = DBUtil.getConn();
        try {
            pst = conn.prepareStatement(SQL_CHECK_EXIST_EMAIL);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return result;
    }

    public int createUser(Users users) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, users.getFullname());
            pst.setString(2, users.getAddress());
            pst.setString(3, users.getPhone());
            pst.setString(4, users.getNationality());
            pst.setString(5, users.getEmail());
            pst.setString(6, users.getPassword());
            pst.setInt(7, users.getRole());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<Users> getAllUsers() {
        ArrayList<Users> lstUsers = new ArrayList<Users>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Users users = new Users();
                users.setId(rs.getInt(1));
                users.setFullname(rs.getString(2));
                users.setAddress(rs.getString(3));
                users.setPhone(rs.getString(4));
                users.setNationality(rs.getString(5));
                users.setEmail(rs.getString(6));
                users.setPassword(rs.getString(7));
                users.setRole(rs.getInt(8));
                lstUsers.add(users);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstUsers;
    }

    public int updateUser(Users user) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, user.getFullname());
            pst.setString(2, user.getAddress());
            pst.setString(3, user.getPhone());
            pst.setString(4, user.getNationality());
            pst.setString(5, user.getEmail());
            pst.setString(6, user.getPassword());
            pst.setInt(7, user.getRole());
            pst.setInt(8, user.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int updateRole(Users user) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE_ROLE);
            pst.setInt(1, user.getRole());
            pst.setString(2, user.getEmail());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteUser(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public Users getUserByEmail(String email) {
        Users users = null;
        conn = DBUtil.getConn();
        try {
            pst = conn.prepareStatement(SQL_GET_USER_BY_EMAIL);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                users = new Users();
                users.setId(rs.getInt(1));
                users.setFullname(rs.getString(2));
                users.setAddress(rs.getString(3));
                users.setPhone(rs.getString(4));
                users.setNationality(rs.getString(5));
                users.setEmail(rs.getString(6));
                users.setPassword(rs.getString(7));
                users.setRole(rs.getInt(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return users;
    }
}

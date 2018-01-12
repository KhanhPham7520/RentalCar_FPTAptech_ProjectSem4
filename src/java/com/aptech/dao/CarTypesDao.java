/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.CarTypes;
import com.aptech.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class CarTypesDao {

    private final String SQL_CREATE = "INSERT INTO car_types(name) VALUES(?)";
    private final  String SQL_READ = "SELECT * FROM car_types ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM car_types WHERE id = ?";
    private final  String SQL_UPDATE = "UPDATE car_types SET name = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM car_types WHERE id = ?";

    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public CarTypesDao() {
        conn = null;
    }

    public int createCarType(CarTypes carTypes) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, carTypes.getName());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<CarTypes> getAllCarTypes() {
        ArrayList<CarTypes> lstCarTypes = new ArrayList<CarTypes>();
        try {
           
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarTypes carTypes = new CarTypes();
                carTypes.setId(rs.getInt(1));
                carTypes.setName(rs.getString(2));
                lstCarTypes.add(carTypes);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCarTypes;
    }

    public CarTypes getCarTypeById(int id) {
        CarTypes item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new CarTypes();
                item.setId(rs.getInt(1));
                item.setName(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return item;
    }
    
    public int updateCarType(CarTypes carType) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, carType.getName());
            pst.setInt(2, carType.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteCarType(int id) throws SQLException {
        try {
            
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: create()
//        CarTypes c1 = new CarTypes();
//        c1.setName("B");
//        int i = new CarTypesDao().createCarType(c1);
//        System.out.println(i);
//
//        //Check method: getAllCarTypes()
//        ArrayList<CarTypes> list = new CarTypesDao().getAllCarTypes();
//        for (CarTypes c2 : list) {
//            System.out.println(c2.getName());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

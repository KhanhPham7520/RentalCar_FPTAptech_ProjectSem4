/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.CarModels;
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
public class CarModelsDao {

    private final String SQL_CREATE = "INSERT INTO car_models(name) VALUES(?)";
    private final String SQL_READ_ALL = "SELECT * FROM car_models ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM car_models WHERE id = ?";
    private final String SQL_UPDATE = "UPDATE car_models SET name = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM car_models WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public CarModelsDao() {
        conn = null;
    }

    public int createCarModel(CarModels carModels) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, carModels.getName());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarModelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<CarModels> getAllCarModels() {
        ArrayList<CarModels> lstCarModels = new ArrayList<CarModels>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_ALL);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarModels carModels = new CarModels();
                carModels.setId(rs.getInt(1));
                carModels.setName(rs.getString(2));
                lstCarModels.add(carModels);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarModelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCarModels;
    }

    public CarModels getCarModelById(int id) {
        CarModels item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new CarModels();
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
    
    public int updateCarModel(CarModels carModel) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, carModel.getName());
            pst.setInt(2, carModel.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarModelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteCarModel(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarModelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createCarModel()
//        CarModels c1 = new CarModels();
//        c1.setName("B");
//        int i = new CarModelsDao().createCarModel(c1);
//        if (i > 0) {
//            System.out.println("ADD SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- ADD ERROR!");
//        }
//        
//        //Check method: getAllCarModels()
//        ArrayList<CarModels> list = new CarModelsDao().getAllCarModels();
//        System.out.println("READ ALL SUCCESSFUL!");
//
//        //Check method: update
//        CarModels cc = new CarModels();
//        cc.setId(18);  // Tim ID trong bang [car_models]
//        cc.setName("Test");
//        int i2 = new CarModelsDao().updateCarModel(cc);
//        if (i2 > 0) {
//            System.out.println("UPDATE SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- UPDATE ERROR!");
//        }
//
//        //Check method: delete
//        int i3 = new CarModelsDao().deleteCarModel(18); // Tim ID trong bang [car_models]
//        if (i3 > 0) {
//            System.out.println("DELETE SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- DELETE ERROR!");
//        }
//    }
}

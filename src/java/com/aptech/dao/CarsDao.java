/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Cars;
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
public class CarsDao {
    
    private final String SQL_CREATE = "INSERT INTO cars(name, seating_capacity, driver, air_conditioner, price, images, model_id, type_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM cars ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM cars WHERE id = ?";
    private final String SQL_READ_BY_MODEL_ID = "SELECT * FROM cars WHERE model_id = ?";
    private final String SQL_READ_BY_TYPE_ID = "SELECT * FROM cars WHERE type_id = ?";
    private final String SQL_READ_HOME = "SELECT TOP 2 * FROM cars ORDER BY id DESC";
    private final String SQL_SEARCH = "SELECT * FROM cars WHERE price >= ? AND price <= ? AND seating_capacity = ? AND type_id = ? ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE cars SET name = ?, seating_capacity = ?, driver = ?, air_conditioner = ?, price = ?, images = ?, model_id = ?, type_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM cars WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    public CarsDao() {
        conn = null;
    }
    
    public int createCar(Cars cars) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, cars.getName());
            pst.setInt(2, cars.getSeatingCapacity());
            pst.setInt(3, cars.getDriver());
            pst.setInt(4, cars.getAirConditioner());
            pst.setFloat(5, cars.getPrice());
            pst.setString(6, cars.getImages());
            pst.setInt(7, cars.getModelId());
            pst.setInt(8, cars.getTypeId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public ArrayList<Cars> getAllCars() {
        ArrayList<Cars> lstCars = new ArrayList<Cars>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Cars cars = new Cars();
                cars.setId(rs.getInt(1));
                cars.setName(rs.getString(2));
                cars.setSeatingCapacity(rs.getInt(3));
                cars.setDriver(rs.getInt(4));
                cars.setAirConditioner(rs.getInt(5));
                cars.setPrice(rs.getFloat(6));
                cars.setImages(rs.getString(7));
                cars.setModelId(rs.getInt(8));
                cars.setTypeId(rs.getInt(9));
                lstCars.add(cars);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCars;
    }
    
    public ArrayList<Cars> getAllCarsHome() {
        ArrayList<Cars> lstCars = new ArrayList<Cars>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_HOME);
            rs = pst.executeQuery();
            while (rs.next()) {
                Cars cars = new Cars();
                cars.setId(rs.getInt(1));
                cars.setName(rs.getString(2));
                cars.setSeatingCapacity(rs.getInt(3));
                cars.setDriver(rs.getInt(4));
                cars.setAirConditioner(rs.getInt(5));
                cars.setPrice(rs.getFloat(6));
                cars.setImages(rs.getString(7));
                cars.setModelId(rs.getInt(8));
                cars.setTypeId(rs.getInt(9));
                lstCars.add(cars);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCars;
    }
    
    public Cars getCarById(int id) {
        Cars item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new Cars();
                item.setId(rs.getInt(1));
                item.setName(rs.getString(2));
                item.setSeatingCapacity(rs.getInt(3));
                item.setDriver(rs.getInt(4));
                item.setAirConditioner(rs.getInt(5));
                item.setPrice(rs.getFloat(6));
                item.setImages(rs.getString(7));
                item.setModelId(rs.getInt(8));
                item.setTypeId(rs.getInt(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return item;
    }
    
    public ArrayList<Cars> getAllCarsByModelId(int modelID) {
        ArrayList<Cars> lstCars = new ArrayList<Cars>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_MODEL_ID);
            pst.setInt(1, modelID);
            rs = pst.executeQuery();
            while (rs.next()) {
                Cars cars = new Cars();
                cars.setId(rs.getInt(1));
                cars.setName(rs.getString(2));
                cars.setSeatingCapacity(rs.getInt(3));
                cars.setDriver(rs.getInt(4));
                cars.setAirConditioner(rs.getInt(5));
                cars.setPrice(rs.getFloat(6));
                cars.setImages(rs.getString(7));
                cars.setModelId(rs.getInt(8));
                cars.setTypeId(rs.getInt(9));
                lstCars.add(cars);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCars;
    }
    
    public ArrayList<Cars> getAllCarsByTypeId(int typeID) {
        ArrayList<Cars> lstCars = new ArrayList<Cars>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_TYPE_ID);
            pst.setInt(1, typeID);
            rs = pst.executeQuery();
            while (rs.next()) {
                Cars cars = new Cars();
                cars.setId(rs.getInt(1));
                cars.setName(rs.getString(2));
                cars.setSeatingCapacity(rs.getInt(3));
                cars.setDriver(rs.getInt(4));
                cars.setAirConditioner(rs.getInt(5));
                cars.setPrice(rs.getFloat(6));
                cars.setImages(rs.getString(7));
                cars.setModelId(rs.getInt(8));
                cars.setTypeId(rs.getInt(9));
                lstCars.add(cars);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCars;
    }
    
    public ArrayList<Cars> search(float priceFrom, float priceTo, int seating, int typeId) {
        ArrayList<Cars> lstCars = new ArrayList<Cars>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_SEARCH);
            pst.setFloat(1, priceFrom);
            pst.setFloat(2, priceTo);
            pst.setInt(3, seating);
            pst.setInt(4, typeId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Cars cars = new Cars();
                cars.setId(rs.getInt(1));
                cars.setName(rs.getString(2));
                cars.setSeatingCapacity(rs.getInt(3));
                cars.setDriver(rs.getInt(4));
                cars.setAirConditioner(rs.getInt(5));
                cars.setPrice(rs.getFloat(6));
                cars.setImages(rs.getString(7));
                cars.setModelId(rs.getInt(8));
                cars.setTypeId(rs.getInt(9));
                lstCars.add(cars);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCars;
    }
    
    public int updateCar(Cars car) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, car.getName());
            pst.setInt(2, car.getSeatingCapacity());
            pst.setInt(3, car.getDriver());
            pst.setInt(4, car.getAirConditioner());
            pst.setFloat(5, car.getPrice());
            pst.setString(6, car.getImages());
            pst.setInt(7, car.getModelId());
            pst.setInt(8, car.getTypeId());
            pst.setInt(9, car.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteCar(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
//    public static void main(String[] args) throws SQLException {
//        //Check method: createCar()
//        Cars c1 = new Cars();
//        c1.setName("B");
//        c1.setSeatingCapacity(1);
//        c1.setDriver(1);
//        c1.setAirConditioner(1);
//        c1.setPrice(1);
//        c1.setImages("B");
//        c1.setModelId(19);
//        c1.setTypeId(11);
//        int i = new CarsDao().createCar(c1);
//        if (i > 0) {
//            System.out.println("ADD SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- ADD ERROR!");
//        }
//
//        //Check method: getAllCars()
//        ArrayList<Cars> list = new CarsDao().getAllCars();
//        System.out.println("READ ALL SUCCESSFUL!");
//
//        //Check method: getAllCars()
//        ArrayList<Cars> list2 = new CarsDao().getAllCarsByModelId(19); // Tim gia tri ID trong bang [car_models]
//        System.out.println("READ BY MODEL_ID SUCCESSFUL!");
//
//        //Check method: getAllCars()
//        ArrayList<Cars> list3 = new CarsDao().getAllCarsByModelId(11); // Tim gia tri ID trong bang [car_type]
//        System.out.println("READ BY TYPE_ID SUCCESSFUL!");
//
//        //Check method: update
//        Cars cc = new Cars();
//        cc.setId(15);  // Tim gia tri ID trong bang [cars]
//        cc.setName("B");
//        cc.setSeatingCapacity(1);
//        cc.setDriver(1);
//        cc.setAirConditioner(1);
//        cc.setPrice(1);
//        cc.setImages("B");
//        cc.setModelId(19);
//        cc.setTypeId(11);
//        int i2 = new CarsDao().updateCar(cc);
//        if (i2 > 0) {
//            System.out.println("UPDATE SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- UPDATE ERROR!");
//        }
//
//        //Check method: delete
//        int i3 = new CarsDao().deleteCar(15);  // Tim gia tri ID trong bang [cars]
//        if (i3 > 0) {
//            System.out.println("DELETE SUCCESSFUL!");
//        } else {
//            System.out.println("-------------- DELETE ERROR!");
//        }
//    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.CarBookings;
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
public class CarBookingsDao {

    private final String SQL_CREATE = "INSERT INTO car_bookings(pick_up_date, drop_up_date, price, created_on, status, car_id, user_id) VALUES(?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM car_bookings WHERE status = 0 ORDER BY id DESC";
    private final String SQL_READ_DES = "SELECT * FROM car_bookings WHERE status = 2 ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM car_bookings WHERE id = ?";
    private final String SQL_READ_BY_USER = "SELECT * FROM car_bookings WHERE user_id = ? AND status = 0 ORDER BY id DESC";
    private final String SQL_READ_DESTROY_BY_USER = "SELECT * FROM car_bookings WHERE user_id = ? AND status = 2 ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE car_bookings SET refund = ?, modified_on = ?, status = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM car_bookings WHERE id = ?";
    private final String SQL_DELETE_BY_CAR = "DELETE FROM car_bookings WHERE car_id = ?";
    private final String SQL_DELETE_BY_USER = "DELETE FROM car_bookings WHERE user_id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public CarBookingsDao() {
        conn = null;
    }

    public int createCarBooking(CarBookings carBookings) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, carBookings.getPickUpDate());
            pst.setString(2, carBookings.getDropUpDate());
            pst.setFloat(3, carBookings.getPrice());
            pst.setString(4, carBookings.getCreatedOn());
            pst.setInt(5, carBookings.getStatus());
            pst.setInt(6, carBookings.getCarId());
            pst.setInt(7, carBookings.getUserId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<CarBookings> getAllCarBookings() {
        ArrayList<CarBookings> lstCarBookings = new ArrayList<CarBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarBookings carBookings = new CarBookings();
                carBookings.setId(rs.getInt(1));
                carBookings.setPickUpDate(rs.getString(2));
                carBookings.setDropUpDate(rs.getString(3));
                carBookings.setPrice(rs.getFloat(4));
                carBookings.setRefund(rs.getFloat(5));
                carBookings.setCreatedOn(rs.getString(6));
                carBookings.setModifiedOn(rs.getString(7));
                carBookings.setStatus(rs.getInt(8));
                carBookings.setCarId(rs.getInt(9));
                carBookings.setUserId(rs.getInt(10));
                lstCarBookings.add(carBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCarBookings;
    }

    public ArrayList<CarBookings> getCarBookingsDestroy() {
        ArrayList<CarBookings> lstCarBookings = new ArrayList<CarBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_DES);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarBookings carBookings = new CarBookings();
                carBookings.setId(rs.getInt(1));
                carBookings.setPickUpDate(rs.getString(2));
                carBookings.setDropUpDate(rs.getString(3));
                carBookings.setPrice(rs.getFloat(4));
                carBookings.setRefund(rs.getFloat(5));
                carBookings.setCreatedOn(rs.getString(6));
                carBookings.setModifiedOn(rs.getString(7));
                carBookings.setStatus(rs.getInt(8));
                carBookings.setCarId(rs.getInt(9));
                carBookings.setUserId(rs.getInt(10));
                lstCarBookings.add(carBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCarBookings;
    }
    
    
    public CarBookings getCarBookingById(int id) {
        CarBookings carBookings = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                carBookings = new CarBookings();
                carBookings.setId(rs.getInt(1));
                carBookings.setPickUpDate(rs.getString(2));
                carBookings.setDropUpDate(rs.getString(3));
                carBookings.setPrice(rs.getFloat(4));
                carBookings.setRefund(rs.getFloat(5));
                carBookings.setCreatedOn(rs.getString(6));
                carBookings.setModifiedOn(rs.getString(7));
                carBookings.setStatus(rs.getInt(8));
                carBookings.setCarId(rs.getInt(9));
                carBookings.setUserId(rs.getInt(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return carBookings;
    }
    
    public ArrayList<CarBookings> getCarBookingsByUserId(int id) {
        ArrayList<CarBookings> lstCarBookings = new ArrayList<CarBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_USER);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarBookings carBookings = new CarBookings();
                carBookings.setId(rs.getInt(1));
                carBookings.setPickUpDate(rs.getString(2));
                carBookings.setDropUpDate(rs.getString(3));
                carBookings.setPrice(rs.getFloat(4));
                carBookings.setRefund(rs.getFloat(5));
                carBookings.setCreatedOn(rs.getString(6));
                carBookings.setModifiedOn(rs.getString(7));
                carBookings.setStatus(rs.getInt(8));
                carBookings.setCarId(rs.getInt(9));
                carBookings.setUserId(rs.getInt(10));
                lstCarBookings.add(carBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstCarBookings;
    }

    public ArrayList<CarBookings> getCarBookingsDestroyByUserId(int id) {
        ArrayList<CarBookings> lstItem = new ArrayList<CarBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_DESTROY_BY_USER);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                CarBookings tourBookings = new CarBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setPickUpDate(rs.getString(2));
                tourBookings.setDropUpDate(rs.getString(3));
                tourBookings.setPrice(rs.getFloat(4));
                tourBookings.setRefund(rs.getFloat(5));
                tourBookings.setCreatedOn(rs.getString(6));
                tourBookings.setModifiedOn(rs.getString(7));
                tourBookings.setStatus(rs.getInt(8));
                tourBookings.setCarId(rs.getInt(9));
                tourBookings.setUserId(rs.getInt(10));
                lstItem.add(tourBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstItem;
    }
    
    public int updateCarBooking(CarBookings carBookings) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setFloat(1, carBookings.getRefund());
            pst.setString(2, carBookings.getModifiedOn());
            pst.setInt(3, carBookings.getStatus());
            pst.setInt(4, carBookings.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteCarBooking(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteCarBookingByCar(int tourId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_CAR);
            pst.setInt(1, tourId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteCarBookingByUser(int userId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_USER);
            pst.setInt(1, userId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CarBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createCarBooking()
//        CarBookings carBookings = new CarBookings();
//        carBookings.setPickUpDate("Test");
//        carBookings.setDropUpDate("Test");
//        carBookings.setPrice(2);
//        carBookings.setRefund(2);
//        carBookings.setCreatedOn("Test");
//        carBookings.setModifiedOn("Test");
//        carBookings.setStatus(1);
//        carBookings.setCarId(1);
//        carBookings.setUserId(1);
//        int i = new CarBookingsDao().createCarBooking(carBookings);
//        System.out.println(i);
//
//        //Check method: getAllCarBookings()
//        ArrayList<CarBookings> list = new CarBookingsDao().getAllCarBookings();
//        for (CarBookings c2 : list) {
//            System.out.println(c2.getId());
//        }
//
//        //Check method: update, delete ...
//
//    }

}

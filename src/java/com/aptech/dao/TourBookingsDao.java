/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.TourBookings;
import com.aptech.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**a
 *
 * @author ADMIN
 */
public class TourBookingsDao {

    private final String SQL_CREATE = "INSERT INTO tour_bookings(participants, price, created_on, status, package_id,  user_id) VALUES(?, ?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM tour_bookings WHERE status = 0 ORDER BY id DESC";
    private final String SQL_READ_DES = "SELECT * FROM tour_bookings WHERE status = 2 ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM tour_bookings WHERE id = ?";
    private final String SQL_READ_BY_USER = "SELECT * FROM tour_bookings WHERE user_id = ? AND status = 0 ORDER BY id DESC";
    private final String SQL_READ_DESTROY_BY_USER = "SELECT * FROM tour_bookings WHERE user_id = ? AND status = 2 ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE tour_bookings SET participants = ?, price = ?, created_on = ?, modified_on = ?, status = ?, package_id = ?, refund = ?, user_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM tour_bookings WHERE id = ?";
    private final String SQL_DELETE_BY_TOUR = "DELETE FROM tour_bookings WHERE package_id = ?";
    private final String SQL_DELETE_BY_USER = "DELETE FROM tour_bookings WHERE user_id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public TourBookingsDao() {
        conn = null;
    }

    public int createTourBooking(TourBookings tourBookings) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setInt(1, tourBookings.getParticipants());
            pst.setFloat(2, tourBookings.getPrice());
            pst.setString(3, tourBookings.getCreated_on());
            pst.setInt(4, tourBookings.getStatus());
            pst.setInt(5, tourBookings.getPackage_id());
            pst.setInt(6, tourBookings.getUser_id());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<TourBookings> getAllTourBookings() {
        ArrayList<TourBookings> lstTourBookings = new ArrayList<TourBookings>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                TourBookings tourBookings = new TourBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setParticipants(rs.getInt(2));
                tourBookings.setPrice(rs.getFloat(3));
                tourBookings.setCreated_on(rs.getString(4));
                tourBookings.setModified_on(rs.getString(5));
                tourBookings.setStatus(rs.getInt(6));
                tourBookings.setPackage_id(rs.getInt(7));
                tourBookings.setRefund(rs.getFloat(8));
                tourBookings.setUser_id(rs.getInt(9));
                lstTourBookings.add(tourBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstTourBookings;
    }
    
    public ArrayList<TourBookings> getTourBookingsDestroy() {
        ArrayList<TourBookings> lstTourBookings = new ArrayList<TourBookings>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_DES);
            rs = pst.executeQuery();
            while (rs.next()) {
                TourBookings tourBookings = new TourBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setParticipants(rs.getInt(2));
                tourBookings.setPrice(rs.getFloat(3));
                tourBookings.setCreated_on(rs.getString(4));
                tourBookings.setModified_on(rs.getString(5));
                tourBookings.setStatus(rs.getInt(6));
                tourBookings.setPackage_id(rs.getInt(7));
                tourBookings.setRefund(rs.getFloat(8));
                tourBookings.setUser_id(rs.getInt(9));
                lstTourBookings.add(tourBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstTourBookings;
    }
    
    public TourBookings getTourBookingById(int id) {
        TourBookings tourBookings = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                tourBookings = new TourBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setParticipants(rs.getInt(2));
                tourBookings.setPrice(rs.getFloat(3));
                tourBookings.setCreated_on(rs.getString(4));
                tourBookings.setModified_on(rs.getString(5));
                tourBookings.setStatus(rs.getInt(6));
                tourBookings.setPackage_id(rs.getInt(7));
                tourBookings.setRefund(rs.getFloat(8));
                tourBookings.setUser_id(rs.getInt(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return tourBookings;
    }
    
    public ArrayList<TourBookings> getTourBookingsByUserId(int id) {
        ArrayList<TourBookings> lstTourBookings = new ArrayList<TourBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_USER);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                TourBookings tourBookings = new TourBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setParticipants(rs.getInt(2));
                tourBookings.setPrice(rs.getFloat(3));
                tourBookings.setCreated_on(rs.getString(4));
                tourBookings.setModified_on(rs.getString(5));
                tourBookings.setStatus(rs.getInt(6));
                tourBookings.setPackage_id(rs.getInt(7));
                tourBookings.setRefund(rs.getFloat(8));
                tourBookings.setUser_id(rs.getInt(9));
                lstTourBookings.add(tourBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstTourBookings;
    }

    
    public ArrayList<TourBookings> getTourBookingsDestroyByUserId(int id) {
        ArrayList<TourBookings> lstTourBookings = new ArrayList<TourBookings>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_DESTROY_BY_USER);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                TourBookings tourBookings = new TourBookings();
                tourBookings.setId(rs.getInt(1));
                tourBookings.setParticipants(rs.getInt(2));
                tourBookings.setPrice(rs.getFloat(3));
                tourBookings.setCreated_on(rs.getString(4));
                tourBookings.setModified_on(rs.getString(5));
                tourBookings.setStatus(rs.getInt(6));
                tourBookings.setPackage_id(rs.getInt(7));
                tourBookings.setRefund(rs.getFloat(8));
                tourBookings.setUser_id(rs.getInt(9));
                lstTourBookings.add(tourBookings);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstTourBookings;
    }
    
    public int updateTourBooking(TourBookings tourBooking) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setInt(1, tourBooking.getParticipants());
            pst.setFloat(2, tourBooking.getPrice());
            pst.setString(3, tourBooking.getCreated_on());
            pst.setString(4, tourBooking.getModified_on());
            pst.setInt(5, tourBooking.getStatus());
            pst.setInt(6, tourBooking.getPackage_id());
            pst.setFloat(7, tourBooking.getRefund());
            pst.setInt(8, tourBooking.getUser_id());
            pst.setInt(9, tourBooking.getId());

            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteTourBooking(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteTourBookingByTour(int tourId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_TOUR);
            pst.setInt(1, tourId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteTourBookingByUser(int userId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_USER);
            pst.setInt(1, userId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TourBookingsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createTourBooking()
//        TourBookings c1 = new TourBookings();
//        c1.setParticipants(1);
//        c1.setPrice(1);
//        c1.setCreated_on("b");
//        c1.setModified_on("b");
//        c1.setStatus(1);
//        c1.setPackage_id(1);
//        c1.setRefund(1);
//        c1.setUser_id(1);
//        c1.setId(1);
//
//        int i = new TourBookingsDao().createTourBooking(c1);
//        System.out.println(i);
//
//        //Check method: getAllTourBookings()
//        ArrayList<TourBookings> list = new TourBookingsDao().getAllTourBookings();
//        for (TourBookings c2 : list) {
//            System.out.println(c2.getId());
//        }
//
//        //Check method: update, delete ...
//
//    }

}

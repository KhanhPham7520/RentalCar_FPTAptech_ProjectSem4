/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.PackageTourHotels;
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
public class PackageTourHotelsDao {

    private final String SQL_CREATE = "INSERT INTO package_tour_hotels(package_tour_id, hotel_id) VALUES(?, ?)";
    private final String SQL_READ = "SELECT * FROM package_tour_hotels ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE package_tour_hotels SET package_tour_id = ?, hotel_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM package_tour_hotels WHERE id = ?";
    private final String SQL_DELETE_BY_TOUR = "DELETE FROM package_tour_hotels WHERE package_tour_id = ?";
    private final String SQL_DELETE_BY_HOTEL = "DELETE FROM package_tour_hotels WHERE hotel_id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public PackageTourHotelsDao() {
        conn = null;
    }

    public int createPackageTourHotel(PackageTourHotels packageTourHotels) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setInt(1, packageTourHotels.getPackageTourId());
            pst.setInt(2, packageTourHotels.getHotelId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<PackageTourHotels> getAllPackageTourHotels() {
        ArrayList<PackageTourHotels> lstPackageTourHotels = new ArrayList<PackageTourHotels>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTourHotels packageTourHotels = new PackageTourHotels();
                packageTourHotels.setId(rs.getInt(1));
                packageTourHotels.setPackageTourId(rs.getInt(2));
                packageTourHotels.setHotelId(rs.getInt(3));
                lstPackageTourHotels.add(packageTourHotels);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTourHotels;
    }
   
    public int updatePackageTourHotel(PackageTourHotels packageTourHotel) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setInt(1, packageTourHotel.getPackageTourId());
            pst.setInt(2, packageTourHotel.getHotelId());
            pst.setInt(3, packageTourHotel.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deletePackageTourHotel(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteTourHotel(int tourId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_TOUR);
            pst.setInt(1, tourId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteTourHotelByHotelId(int hotelId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_HOTEL);
            pst.setInt(1, hotelId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourHotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createPackageTourHotel()
//        PackageTourHotels c1 = new PackageTourHotels();
//        c1.setPackageTourId(1);
//        c1.setHotelId(1);
//        int i = new PackageTourHotelsDao().createPackageTourHotel(c1);
//        System.out.println(i);
//
//        //Check method: getAllPackageTourHotels()
//        ArrayList<PackageTourHotels> list = new PackageTourHotelsDao().getAllPackageTourHotels();
//        for (PackageTourHotels c2 : list) {
//            System.out.println(c2.getId());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

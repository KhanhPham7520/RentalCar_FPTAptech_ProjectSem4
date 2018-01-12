/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Hotels;
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
public class HotelsDao {

    private final String SQL_CREATE = "INSERT INTO hotels(name, address, phone, description, price_range, location_id) VALUES(?, ?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM hotels ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM hotels WHERE id = ?";
    private final String SQL_READ_BY_TOUR_ID = "SELECT hotels.id, hotels.name FROM hotels, package_tours, "
            + "package_tour_hotels WHERE package_tours.id = ? AND hotels.id = package_tour_hotels.hotel_id "
            + "AND package_tours.id = package_tour_hotels.package_tour_id";
    private final String SQL_SEACH = "SELECT * FROM hotels WHERE price_range >= ? AND price_range <= ? AND location_id = ? ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE hotels SET name = ?, address = ?, phone = ?, description = ?, price_range = ?, location_id = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM hotels WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public HotelsDao() {
        conn = null;
    }

    public int createHotel(Hotels hotels) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, hotels.getName());
            pst.setString(2, hotels.getAddress());
            pst.setString(3, hotels.getPhone());
            pst.setString(4, hotels.getDescription());
            pst.setFloat(5, hotels.getPrice_range());
            pst.setInt(6, hotels.getLocation_id());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<Hotels> getAllHotels() {
        ArrayList<Hotels> lstHotels = new ArrayList<Hotels>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Hotels hotels = new Hotels();
                hotels.setId(rs.getInt(1));
                hotels.setName(rs.getString(2));
                hotels.setAddress(rs.getString(3));
                hotels.setPhone(rs.getString(4));
                hotels.setDescription(rs.getString(5));
                hotels.setPrice_range(rs.getFloat(6));
                hotels.setLocation_id(rs.getInt(7));
                lstHotels.add(hotels);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstHotels;
    }

    public Hotels getHotelById(int id) {
        Hotels item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new Hotels();
                item.setId(rs.getInt(1));
                item.setName(rs.getString(2));
                item.setAddress(rs.getString(3));
                item.setPhone(rs.getString(4));
                item.setDescription(rs.getString(5));
                item.setPrice_range(rs.getFloat(6));
                item.setLocation_id(rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return item;
    }
    
    public ArrayList<Hotels> getHotelsByTourId(int id) {
        ArrayList<Hotels> lstHotels = new ArrayList<Hotels>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_TOUR_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Hotels hotels = new Hotels();
                hotels.setId(rs.getInt(1));
                hotels.setName(rs.getString(2));
                
                lstHotels.add(hotels);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstHotels;
    }
    
    public ArrayList<Hotels> search(float priceFrom, float priceTo, int locaionId) {
        ArrayList<Hotels> lstHotels = new ArrayList<Hotels>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_SEACH);
            pst.setFloat(1, priceFrom);
            pst.setFloat(2, priceTo);
            pst.setInt(3, locaionId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Hotels hotels = new Hotels();
                hotels.setId(rs.getInt(1));
                hotels.setName(rs.getString(2));
                hotels.setAddress(rs.getString(3));
                hotels.setPhone(rs.getString(4));
                hotels.setDescription(rs.getString(5));
                hotels.setPrice_range(rs.getFloat(6));
                hotels.setLocation_id(rs.getInt(7));
                lstHotels.add(hotels);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstHotels;
    }
    
    public int updateHotel(Hotels hotel) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, hotel.getName());
            pst.setString(2, hotel.getAddress());
            pst.setString(3, hotel.getPhone());
            pst.setString(4, hotel.getDescription());
            pst.setFloat(5, hotel.getPrice_range());
            pst.setInt(6, hotel.getLocation_id());
            pst.setInt(7, hotel.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteHotel(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HotelsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        ArrayList<Hotels> a = new HotelsDao().getHotelsByTourId(1);
//        System.out.println(a.size());
//
//    }
}

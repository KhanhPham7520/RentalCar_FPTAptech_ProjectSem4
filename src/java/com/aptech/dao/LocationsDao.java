/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Locations;
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
public class LocationsDao {
private final  String SQL_CREATE = "INSERT INTO locations(name) VALUES(?)";
private final  String SQL_READ = "SELECT * FROM locations ORDER BY id DESC";
private final String SQL_READ_BY_ID = "SELECT * FROM locations WHERE id = ?";
private final String SQL_READ_BY_TOUR_ID = "SELECT locations.id, locations.name FROM locations, "
        + "package_tours, package_tour_locations WHERE package_tours.id = ? "
        + "AND locations.id = package_tour_locations.location_id AND package_tours.id = package_tour_locations.package_tour_id";
private final  String SQL_UPDATE = "UPDATE locations SET name = ? WHERE id = ?";
private final String SQl_DELETE = "DELETE FROM locations WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public LocationsDao() {
        conn = null;
    }

    public int createLocation(Locations Locations) throws SQLException {
        try {
           
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, Locations.getName());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<Locations> getAllLocations() {
        ArrayList<Locations> lstLocations = new ArrayList<Locations>();
        try {
           
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Locations locations = new Locations();
                locations.setId(rs.getInt(1));
                locations.setName(rs.getString(2));
                lstLocations.add(locations);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstLocations;
    }
    
    public ArrayList<Locations> getLocationsByTourId(int id) {
        ArrayList<Locations> lstLocations = new ArrayList<Locations>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_TOUR_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Locations locations = new Locations();
                locations.setId(rs.getInt(1));
                locations.setName(rs.getString(2));
                lstLocations.add(locations);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstLocations;
    }

    public Locations getLocationById(int id) {
        Locations item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new Locations();
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
    
    public int updateLocation(Locations location) throws SQLException {
        try {
           
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, location.getName());
            pst.setInt(2, location.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteLocation(int id) throws SQLException {
        try {
            
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createLocation()
//        Locations c1 = new Locations();
//        c1.setName("B");
//        int i = new LocationsDao().createLocation(c1);
//        System.out.println(i);
//
//        //Check method: getAllLocations()
//        ArrayList<Locations> list = new LocationsDao().getAllLocations();
//        for (Locations c2 : list) {
//            System.out.println(c2.getName());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

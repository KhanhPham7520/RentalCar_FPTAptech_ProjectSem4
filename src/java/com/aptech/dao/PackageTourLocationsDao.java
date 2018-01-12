/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.PackageTourLocations;
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
public class PackageTourLocationsDao {

    private final String SQL_CREATE = "INSERT INTO package_tour_locations(package_tour_id, location_id) VALUES(?, ?)";
    private final String SQL_READ = "SELECT * FROM package_tour_locations ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE package_tour_locations SET package_tour_id = ?, location_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM package_tour_locations WHERE id = ?";
    private final String SQL_DELETE_BY_TOUR = "DELETE FROM package_tour_locations WHERE package_tour_id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public PackageTourLocationsDao() {
        conn = null;
    }

    public int createPackageTourLocation(PackageTourLocations packageTourLocations) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setInt(1, packageTourLocations.getPackageTourId());
            pst.setInt(2, packageTourLocations.getLocationId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourLocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<PackageTourLocations> getAllPackageTourLocations() {
        ArrayList<PackageTourLocations> lstPackageTourLocations = new ArrayList<PackageTourLocations>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTourLocations packageTourLocations = new PackageTourLocations();
                packageTourLocations.setId(rs.getInt(1));
                packageTourLocations.setPackageTourId(rs.getInt(2));
                packageTourLocations.setLocationId(rs.getInt(3));
                lstPackageTourLocations.add(packageTourLocations);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourLocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTourLocations;
    }
    
    public int updatePackageTourLocation(PackageTourLocations packageTourLocation) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setInt(1, packageTourLocation.getPackageTourId());
            pst.setInt(2, packageTourLocation.getLocationId());
            pst.setInt(3, packageTourLocation.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourLocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deletePackageTourLocation(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourLocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteTourLocation(int tourId) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_TOUR);
            pst.setInt(1, tourId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourLocationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
//    public static void main(String[] args) throws SQLException {
//        //Check method: createPackageTourLocation()
//        PackageTourLocations c1 = new PackageTourLocations();
//        c1.setPackageTourId(1);
//        c1.setLocationId(1);
//        int i = new PackageTourLocationsDao().createPackageTourLocation(c1);
//        System.out.println(i);
//
//        //Check method: getAllPackageTourLocations()
//        ArrayList<PackageTourLocations> list = new PackageTourLocationsDao().getAllPackageTourLocations();
//        for (PackageTourLocations c2 : list) {
//            System.out.println(c2.getId());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

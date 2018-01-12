/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.PackageTourTypes;
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
public class PackageTourTypesDao {

    private final String SQL_CREATE = "INSERT INTO package_tour_types(name) VALUES(?)";
    private final String SQL_READ = "SELECT * FROM package_tour_types";
    private final String SQL_READ_BY_ID = "SELECT * FROM package_tour_types WHERE id = ?";
    private final String SQL_UPDATE = "UPDATE package_tour_types SET name = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM package_tour_types WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public PackageTourTypesDao() {
        conn = null;
    }

    public int createPackageTourType(PackageTourTypes packageTourTypes) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, packageTourTypes.getName());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<PackageTourTypes> getAllPackageTourTypes() {
        ArrayList<PackageTourTypes> lstPackageTourTypes = new ArrayList<PackageTourTypes>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTourTypes packageTourTypes = new PackageTourTypes();
                packageTourTypes.setId(rs.getInt(1));
                packageTourTypes.setName(rs.getString(2));
                lstPackageTourTypes.add(packageTourTypes);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTourTypes;
    }

    public PackageTourTypes getPackageTourTypeById(int id) {
        PackageTourTypes item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new PackageTourTypes();
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
    
    public int updatePackageTourType(PackageTourTypes packageTourType) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, packageTourType.getName());
            pst.setInt(2, packageTourType.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deletePackageTourType(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createPackageTourType()
////        PackageTourTypes c1 = new PackageTourTypes();
////        c1.setName("B");
////        int i = new PackageTourTypesDao().createPackageTourType(c1);
////        System.out.println(i);
////
//        //Check method: getAllPackageTourTypes()
////        ArrayList<PackageTourTypes> list = new PackageTourTypesDao().getAllPackageTourTypes();
////        for (PackageTourTypes c2 : list) {
////            System.out.println(c2.getName());
////        }
//
//        //Check method: update, delete ...
//
////        PackageTourTypes i = new PackageTourTypesDao().getPackageTourTypeById(1);
////        System.out.println(i.getName());
//        
//    }
}

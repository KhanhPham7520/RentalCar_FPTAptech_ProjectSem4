/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.PackageTourFoods;
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
public class PackageTourFoodsDao {

    private final String SQL_CREATE = "INSERT INTO package_tour_foods(package_tour_id, food_id) VALUES(?, ?)";
    private final String SQL_READ = "SELECT * FROM package_tour_foods ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE package_tour_foods SET package_tour_id = ?, food_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM package_tour_foods WHERE id = ?";
    private final String SQL_DELETE_BY_TOUR = "DELETE FROM package_tour_foods WHERE package_tour_id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public PackageTourFoodsDao() {
        conn = null;
    }

    public int createPackageTourFood(PackageTourFoods packageTourFoods) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setInt(1, packageTourFoods.getPackage_tour_id());
            pst.setInt(2, packageTourFoods.getFood_id());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourFoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<PackageTourFoods> getAllPackageTourFoods() {
        ArrayList<PackageTourFoods> lstPackageTourFoods = new ArrayList<PackageTourFoods>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTourFoods packageTourFoods = new PackageTourFoods();
                packageTourFoods.setId(rs.getInt(1));
                packageTourFoods.setPackage_tour_id(rs.getInt(2));
                packageTourFoods.setFood_id(rs.getInt(3));
                lstPackageTourFoods.add(packageTourFoods);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourFoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTourFoods;
    }
    
    public int updatePackageTourFood(PackageTourFoods packageTourFood) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setInt(1, packageTourFood.getPackage_tour_id());
            pst.setInt(2, packageTourFood.getFood_id());
            pst.setInt(3, packageTourFood.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourFoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deletePackageTourFood(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourFoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }
    
    public int deleteTourFood(int tourId) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE_BY_TOUR);
            pst.setInt(1, tourId);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourFoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createPackageTourFood()
//        PackageTourFoods c1 = new PackageTourFoods();
//        c1.setPackage_tour_id(1);
//        c1.setFood_id(1);
//        int i = new PackageTourFoodsDao().createPackageTourFood(c1);
//        System.out.println(i);
//
//        //Check method: getAllPackageTourFoods()
//        ArrayList<PackageTourFoods> list = new PackageTourFoodsDao().getAllPackageTourFoods();
//        for (PackageTourFoods c2 : list) {
//            System.out.println(c2.getId());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Foods;
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
public class FoodsDao {

    private final String SQL_CREATE = "INSERT INTO foods(name) VALUES(?)";
    private final String SQL_READ = "SELECT * FROM foods ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM foods WHERE id = ?";
    private final String SQL_READ_BY_TOUR_ID = "SELECT foods.id, foods.name FROM foods, package_tours, "
            + "package_tour_foods WHERE package_tours.id = ? AND foods.id = package_tour_foods.food_id "
            + "AND package_tours.id = package_tour_foods.package_tour_id";
    private final String SQL_UPDATE = "UPDATE foods SET name = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM foods WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public FoodsDao() {
        conn = null;
    }

    public int createFood(Foods foods) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, foods.getName());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<Foods> getAllFoods() {
        ArrayList<Foods> lstFoods = new ArrayList<Foods>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Foods foods = new Foods();
                foods.setId(rs.getInt(1));
                foods.setName(rs.getString(2));
                lstFoods.add(foods);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstFoods;
    }

    public Foods getFoodById(int id) {
        Foods item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new Foods();
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

    public ArrayList<Foods> getFoodsByTourId(int id) {
        ArrayList<Foods> lstFoods = new ArrayList<Foods>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_TOUR_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Foods foods = new Foods();
                foods.setId(rs.getInt(1));
                foods.setName(rs.getString(2));
                lstFoods.add(foods);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstFoods;
    }
    
    public int updateFood(Foods food) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, food.getName());
            pst.setInt(2, food.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteFood(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        ArrayList<Foods> a = new FoodsDao().getFoodsByTourId(1);
//        System.out.println(a.size());
//
//    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.PackageTours;
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
public class PackageToursDao {

    private final String SQL_CREATE = "INSERT INTO package_tours(name, description, start_date, return_date, price, image, type_id) VALUES(?,?,?,?,?,?,?)";
    private final String SQL_READ = "SELECT * FROM package_tours ORDER BY id DESC";
    private final String SQL_READ_BY_CATE_ID = "SELECT * FROM package_tours WHERE type_id = ? ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM package_tours WHERE id = ?";
    private final String SQL_READ_LAST = "SELECT TOP 1 * FROM package_tours ORDER BY id DESC";
    private final String SQL_READ_NEW = "SELECT TOP 2 * FROM package_tours ORDER BY id DESC";
    private final String SQL_READ_HOME = "SELECT TOP 3 * FROM package_tours ORDER BY id DESC";
    private final String SQL_SEARCH = "SELECT * FROM package_tours WHERE price >= ? AND price <= ? AND type_id = ? ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE package_tours SET name = ?, description = ?, start_date = ?, "
            + "return_date = ?, price = ?, image = ?, type_id = ? WHERE id = ?";
    private final String SQL_DELETE = "DELETE FROM package_tours WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public PackageToursDao() {
        conn = null;
    }

    public int createPackageTour(PackageTours packageTours) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, packageTours.getName());
            pst.setString(2, packageTours.getDescription());
            pst.setString(3, packageTours.getStart_date());
            pst.setString(4, packageTours.getReturn_date());
            pst.setFloat(5, packageTours.getPrice());
            pst.setString(6, packageTours.getImage());
            pst.setInt(7, packageTours.getType_id());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<PackageTours> getAllPackageTours() {
        ArrayList<PackageTours> lstPackageTours = new ArrayList<PackageTours>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTours packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
                lstPackageTours.add(packageTours);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTours;
    }
    
    public ArrayList<PackageTours> getPackageToursByCateId(int id) {
        ArrayList<PackageTours> lstPackageTours = new ArrayList<PackageTours>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_CATE_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTours packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
                lstPackageTours.add(packageTours);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTours;
    }
    
    public PackageTours getTourById(int id) {
        PackageTours item = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                item = new PackageTours();
                item.setId(rs.getInt(1));
                item.setName(rs.getString(2));
                item.setDescription(rs.getString(3));
                item.setStart_date(rs.getString(4));
                item.setReturn_date(rs.getString(5));
                item.setPrice(rs.getFloat(6));
                item.setImage(rs.getString(7));
                item.setType_id(rs.getInt(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return item;
    }
    
    public PackageTours getLastPackageTours() {
        PackageTours packageTours = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_LAST);
            rs = pst.executeQuery();
            while (rs.next()) {
                packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return packageTours;
    }
    
    public ArrayList<PackageTours> getNewPackageTours() {
        ArrayList<PackageTours> lstPackageTours = new ArrayList<PackageTours>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_NEW);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTours packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
                lstPackageTours.add(packageTours);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTours;
    }
    
    public ArrayList<PackageTours> getPackageToursForHome() {
        ArrayList<PackageTours> lstPackageTours = new ArrayList<PackageTours>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_HOME);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTours packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
                lstPackageTours.add(packageTours);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTours;
    }

    public ArrayList<PackageTours> search(float priceFrom, float priceTo, int typeId) {
        ArrayList<PackageTours> lstPackageTours = new ArrayList<PackageTours>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_SEARCH);
            pst.setFloat(1, priceFrom);
            pst.setFloat(2, priceTo);
            pst.setInt(3, typeId);
            rs = pst.executeQuery();
            while (rs.next()) {
                PackageTours packageTours = new PackageTours();
                packageTours.setId(rs.getInt(1));
                packageTours.setName(rs.getString(2));
                packageTours.setDescription(rs.getString(3));
                packageTours.setStart_date(rs.getString(4));
                packageTours.setReturn_date(rs.getString(5));
                packageTours.setPrice(rs.getFloat(6));
                packageTours.setImage(rs.getString(7));
                packageTours.setType_id(rs.getInt(8));
                lstPackageTours.add(packageTours);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstPackageTours;
    }
    
    public int updatePackageTour(PackageTours packageTour) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, packageTour.getName());
            pst.setString(2, packageTour.getDescription());
            pst.setString(3, packageTour.getStart_date());
            pst.setString(4, packageTour.getReturn_date());
            pst.setFloat(5, packageTour.getPrice());
            pst.setString(6, packageTour.getImage());
            pst.setInt(7, packageTour.getType_id());
            pst.setInt(8, packageTour.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deletePackageTour(int id) throws SQLException {
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PackageToursDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createPackageTour()
//        PackageTours c1 = new PackageTours();
//        c1.setName("B");
//        int i = new PackageToursDao().createPackageTour(c1);
//        System.out.println(i);
//
//        //Check method: getAllPackageTours()
//        ArrayList<PackageTours> list = new PackageToursDao().getAllPackageTours();
//        for (PackageTours c2 : list) {
//            System.out.println(c2.getName());
//        }
//
//        //Check method: update, delete ...
//
//    }
}

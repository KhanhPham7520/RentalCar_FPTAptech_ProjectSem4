/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dao;

import com.aptech.dto.Flights;
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
public class FlightsDao {

    private final String SQL_CREATE = "INSERT INTO flights(name, departure_time, arrival_time, departure_city, arrival_city) VALUES(?, ?, ?, ?, ?)";
    private final String SQL_READ = "SELECT * FROM flights ORDER BY id DESC";
    private final String SQL_READ_BY_ID = "SELECT * FROM flights WHERE id= ?";
    private final String SQL_SEARCH = "SELECT * FROM flights WHERE arrival_city = ? AND departure_city = ? ORDER BY id DESC";
    private final String SQL_UPDATE = "UPDATE flights SET name = ?, departure_time = ?, arrival_time = ?, departure_city = ?, arrival_city = ? WHERE id = ?";
    private final String SQl_DELETE = "DELETE FROM flights WHERE id = ?";
    Connection conn;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public FlightsDao() {
        conn = null;
    }

    public int createFlight(Flights flights) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_CREATE);
            pst.setString(1, flights.getName());
            pst.setString(2, flights.getDeparture_time());
            pst.setString(3, flights.getArrival_time());
            pst.setInt(4, flights.getDeparture_city());
            pst.setInt(5, flights.getArrival_city());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public ArrayList<Flights> getAllFlights() {
        ArrayList<Flights> lstFlights = new ArrayList<Flights>();
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ);
            rs = pst.executeQuery();
            while (rs.next()) {
                Flights flights = new Flights();
                flights.setId(rs.getInt(1));
                flights.setName(rs.getString(2));
                flights.setDeparture_time(rs.getString(3));
                flights.setArrival_time(rs.getString(4));
                flights.setDeparture_city(rs.getInt(5));
                flights.setArrival_city(rs.getInt(6));
                lstFlights.add(flights);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstFlights;
    }
    
    public ArrayList<Flights> search(int arrID, int deId) {
        ArrayList<Flights> lstFlights = new ArrayList<Flights>();
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_SEARCH);
            pst.setInt(1, arrID);
            pst.setInt(2, deId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Flights flights = new Flights();
                flights.setId(rs.getInt(1));
                flights.setName(rs.getString(2));
                flights.setDeparture_time(rs.getString(3));
                flights.setArrival_time(rs.getString(4));
                flights.setDeparture_city(rs.getInt(5));
                flights.setArrival_city(rs.getInt(6));
                lstFlights.add(flights);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return lstFlights;
    }

    public Flights getFlightById(int id) {
        Flights flights = null;
        try {
            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_READ_BY_ID);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                flights = new Flights();
                flights.setId(rs.getInt(1));
                flights.setName(rs.getString(2));
                flights.setDeparture_time(rs.getString(3));
                flights.setArrival_time(rs.getString(4));
                flights.setDeparture_city(rs.getInt(5));
                flights.setArrival_city(rs.getInt(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PackageTourTypesDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return flights;
    }

    public int updateFlight(Flights flight) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, flight.getName());
            pst.setString(2, flight.getDeparture_time());
            pst.setString(3, flight.getArrival_time());
            pst.setInt(4, flight.getDeparture_city());
            pst.setInt(5, flight.getArrival_city());
            pst.setInt(6, flight.getId());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

    public int deleteFlight(int id) throws SQLException {
        try {

            conn = DBUtil.getConn();
            pst = conn.prepareStatement(SQl_DELETE);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FlightsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtil.closeConn(conn);
        }
        return -1;
    }

//    public static void main(String[] args) throws SQLException {
//        //Check method: createFlight()
//        Flights c1 = new Flights();
//        c1.setName("B");
//        c1.setDeparture_time("B");
//        c1.setArrival_time("B");
//        c1.setDeparture_city(1);
//        c1.setArrival_city(1);
//        int i = new FlightsDao().createFlight(c1);
//        System.out.println(i);
//
//        //Check method: getAllFlights()
//        ArrayList<Flights> list = new FlightsDao().getAllFlights();
//        for (Flights c2 : list) {
//            System.out.println(c2.getName());
//        }
//
//        //Check method: update, delete ...
//
//    }
}


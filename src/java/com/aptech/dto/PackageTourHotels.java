/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dto;

/**
 *
 * @author ADMIN
 */
public class PackageTourHotels extends org.apache.struts.action.ActionForm {

    private int id;
    private int packageTourId;
    private int hotelId;

    public PackageTourHotels() {
        super();
        // TODO Auto-generated constructor stub
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPackageTourId() {
        return packageTourId;
    }

    public void setPackageTourId(int packageTourId) {
        this.packageTourId = packageTourId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }
}

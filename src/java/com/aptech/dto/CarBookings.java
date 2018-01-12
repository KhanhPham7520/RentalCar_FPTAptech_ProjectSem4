/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dto;

/**
 *
 * @author ADMIN
 */
public class CarBookings extends org.apache.struts.action.ActionForm {

    private int id;
    private String pickUpDate;
    private String dropUpDate;
    private float price;
    private float refund;
    private String createdOn;
    private String modifiedOn;
    private int status;
    private int carId;
    private int userId;

    public CarBookings() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(String pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public String getDropUpDate() {
        return dropUpDate;
    }

    public void setDropUpDate(String dropUpDate) {
        this.dropUpDate = dropUpDate;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getRefund() {
        return refund;
    }

    public void setRefund(float refund) {
        this.refund = refund;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }

    public String getModifiedOn() {
        return modifiedOn;
    }

    public void setModifiedOn(String modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

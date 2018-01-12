/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dto;

/**
 *
 * @author ADMIN
 */
public class TourBookings extends org.apache.struts.action.ActionForm {

    private int id;
    private int participants;
    private float price;
    private String created_on;
    private String modified_on;
    private int status;
    private int package_id;
    private float refund;
    private int user_id;

    public TourBookings() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the participants
     */
    public int getParticipants() {
        return participants;
    }

    /**
     * @param participants the participants to set
     */
    public void setParticipants(int participants) {
        this.participants = participants;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the created_on
     */
    public String getCreated_on() {
        return created_on;
    }

    /**
     * @param created_on the created_on to set
     */
    public void setCreated_on(String created_on) {
        this.created_on = created_on;
    }

    /**
     * @return the modified_on
     */
    public String getModified_on() {
        return modified_on;
    }

    /**
     * @param modified_on the modified_on to set
     */
    public void setModified_on(String modified_on) {
        this.modified_on = modified_on;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the package_id
     */
    public int getPackage_id() {
        return package_id;
    }

    /**
     * @param package_id the package_id to set
     */
    public void setPackage_id(int package_id) {
        this.package_id = package_id;
    }

    /**
     * @return the refund
     */
    public float getRefund() {
        return refund;
    }

    /**
     * @param refund the refund to set
     */
    public void setRefund(float refund) {
        this.refund = refund;
    }

    /**
     * @return the user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}

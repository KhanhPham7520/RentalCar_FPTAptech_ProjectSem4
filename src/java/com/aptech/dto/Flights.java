/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dto;

/**
 *
 * @author ADMIN
 */
public class Flights extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String departure_time;
    private String arrival_time;
    private int departure_city;
    private int arrival_city;

    public Flights() {
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the departure_time
     */
    public String getDeparture_time() {
        return departure_time;
    }

    /**
     * @param departure_time the departure_time to set
     */
    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    /**
     * @return the arrival_time
     */
    public String getArrival_time() {
        return arrival_time;
    }

    /**
     * @param arrival_time the arrival_time to set
     */
    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    /**
     * @return the departure_city
     */
    public int getDeparture_city() {
        return departure_city;
    }

    /**
     * @param departure_city the departure_city to set
     */
    public void setDeparture_city(int departure_city) {
        this.departure_city = departure_city;
    }

    /**
     * @return the arrival_city
     */
    public int getArrival_city() {
        return arrival_city;
    }

    /**
     * @param arrival_city the arrival_city to set
     */
    public void setArrival_city(int arrival_city) {
        this.arrival_city = arrival_city;
    }
}

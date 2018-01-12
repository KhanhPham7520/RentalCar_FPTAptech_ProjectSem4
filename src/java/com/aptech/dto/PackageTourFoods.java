/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.dto;

/**
 *
 * @author ADMIN
 */
public class PackageTourFoods extends org.apache.struts.action.ActionForm {

    private int id;
    private int package_tour_id;
    private int food_id;

    public PackageTourFoods() {
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
     * @return the package_tour_id
     */
    public int getPackage_tour_id() {
        return package_tour_id;
    }

    /**
     * @param package_tour_id the package_tour_id to set
     */
    public void setPackage_tour_id(int package_tour_id) {
        this.package_tour_id = package_tour_id;
    }

    /**
     * @return the food_id
     */
    public int getFood_id() {
        return food_id;
    }

    /**
     * @param food_id the food_id to set
     */
    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author FPT
 */
public class Product {
    private long id;
    private String name;
    private double unitPrice;
    private int stockLevel;

    public Product() {
    }

    public Product(long id, String name, double unitPrice, int stockLevel) {
        this.id = id;
        this.name = name;
        this.unitPrice = unitPrice;
        this.stockLevel = stockLevel;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    
    public String getUnitPriceText(){
        DecimalFormat nf = new DecimalFormat("$##0.00");
        return nf.format((unitPrice*100)/100);
    }

    public int getStockLevel() {
        return stockLevel;
    }

    public void setStockLevel(int stockLevel) {
        this.stockLevel = stockLevel;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", unitPrice=" + unitPrice + ", stockLevel=" + stockLevel + '}';
    }
}

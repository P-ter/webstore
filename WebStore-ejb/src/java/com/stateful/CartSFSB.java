/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stateful;

import com.model.OrderProduct;
import java.util.ArrayList;
import javax.ejb.Stateful;
import javax.ejb.LocalBean;

/**
 *
 * @author FPT
 */
@Stateful
@LocalBean
public class CartSFSB {
    private ArrayList<OrderProduct> cart = new ArrayList<>(50);

    public void add(OrderProduct orderProduct) {
        cart.add(orderProduct);
    }

    public void remove(int productId) {
        boolean found = false;
        for(int i =0; i< cart.size() && !found; i++){
            if(cart.get(i).getProductId() == productId){
                found = true;
                cart.remove(i);
            }
        }
    }

    public void clear() {
        cart.clear();
    }

    public int size() {
        return cart.size();
    }

    public int numberOfItem(){
        int total = 0;
        for(int i=0; i<cart.size(); i++){
            total += cart.get(i).getQuantity();
        }
        return total;
    }
    
    public ArrayList<OrderProduct> getOrderProductList() {
        return this.cart;
    }
    
    public OrderProduct get(int index){
        return this.cart.get(index);
    }
}

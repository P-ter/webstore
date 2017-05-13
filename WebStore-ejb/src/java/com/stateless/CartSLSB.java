/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stateless;

import com.model.ConnectionPool;
import com.model.OrderProduct;
import com.stateful.CartSFSB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;

/**
 *
 * @author FPT
 */
@Stateless
@LocalBean
public class CartSLSB {

    public void saveCart(CartSFSB cart, String username) {
        Connection conn = ConnectionPool.connect();
        try{
            PreparedStatement deleteOldData = conn.prepareCall("Delete from savedcart where fk_username=?");
            deleteOldData.setString(1,username);
            deleteOldData.executeUpdate();
            deleteOldData.close();
            
            PreparedStatement ps = conn.prepareCall("INSERT INTO savedcart VAlues (?,?,?);");
            ArrayList<OrderProduct> cartItem = cart.getOrderProductList();
            for(int i = 0; i<cartItem.size(); i++){
                ps.setString(1, username);
                ps.setInt(2, cartItem.get(i).getProductId());
                ps.setInt(3, cartItem.get(i).getQuantity());
                ps.addBatch();
                ps.clearParameters();
            }
            ps.executeBatch();
            ps.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public CartSFSB loadCart(CartSFSB cart, String username) {
        Connection conn = ConnectionPool.connect();
        try{
            PreparedStatement ps = conn.prepareCall("Select productID, numUnits from savedcart where fk_username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                OrderProduct orderProduct = new OrderProduct(rs.getInt(1), rs.getInt(2));
                cart.add(orderProduct);
            }
            conn.close();
            return cart;
        } catch (SQLException e){
            e.printStackTrace();
        } 
        return null;
    }
}

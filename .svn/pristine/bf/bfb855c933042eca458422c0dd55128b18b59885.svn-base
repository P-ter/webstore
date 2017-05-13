/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stateless;

import com.model.ConnectionPool;
import com.model.OrderItem;
import com.model.Product;
import java.sql.Connection;
import java.sql.Date;
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
public class OrderSLSB {

    public void recordOrder(String username) {
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Insert into `order`(orderDateTime, fk_username)"
                    + "Values (CURDATE(), ?)");
            ps.setString(1, username);
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int getLatestOrderId(){
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Select max(orderID) from `order`");
            ResultSet rs = ps.executeQuery();
            rs.next();
            int id =  rs.getInt(1);
            rs.close();
            conn.close();
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public void updateOrderItem(ArrayList<OrderItem> orderList){
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Insert into orderitem(fk_orderID, productName, productUnitPrice, productNumberUnits) "
                    + "values (?,?,?,?)");
            int orderId = getLatestOrderId();
            for(int i=0; i< orderList.size(); i++){
                OrderItem item = orderList.get(i);
                
                ps.setInt(1, orderId);
                ps.setString(2, item.getName());
                ps.setDouble(3, item.getPrice());
                ps.setInt(4, item.getNumberUnit());
                ps.addBatch();
                ps.clearParameters();
            }
            ps.executeBatch();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }

        
    public ArrayList<OrderItem> getOrderItems(int orderId){
        ArrayList<OrderItem> itemList = new ArrayList<>(100);
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("SELECT productName, productUnitPrice, productNumberUnits FROM orderitem where fk_orderID=?;");
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                OrderItem item = new OrderItem();
                item.setName(rs.getString(1));
                item.setPrice(rs.getDouble(2));
                item.setNumberUnit(rs.getInt(3));
                itemList.add(item);
            }
            
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return itemList;
    }
}

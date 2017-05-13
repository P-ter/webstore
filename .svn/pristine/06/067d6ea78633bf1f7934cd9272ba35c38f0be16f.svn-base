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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author FPT
 */
@Stateless
@LocalBean
public class ProductSLSB {

    public ArrayList<Product> getProductList() {
        ArrayList<Product> productList = new ArrayList<>(100);
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("SELECT * FROM product;");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getLong("productID"));
                product.setName(rs.getString("productName"));
                product.setUnitPrice(rs.getDouble("productUnitPrice"));
                product.setStockLevel(rs.getInt("productStockLevel"));
                productList.add(product);
            }
            
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return productList;
    }

    public void updateStock(int numberTakenOut, int productID){
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Update product SET productStockLevel = productStockLevel - ? Where productID = ?");
            ps.setInt(1, numberTakenOut);
            ps.setInt(2, productID);
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stateless;

import com.model.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class UserSLSB {

    public boolean register(String username, String password) {
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("INSERT INTO user VALUES (?,?);");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean checkUsernameExisted(String username){
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Select * from User where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            boolean exist = rs.next();
            rs.close();
            ps.close();
            conn.close();
            return exist;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validate(String username, String password) {
        try{
            Connection conn = ConnectionPool.connect();
            PreparedStatement ps = conn.prepareCall("Select * from `user` where BINARY `username`=? AND BINARY `password`=?;");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            /* Since the upper statement will only return 1 row
            , if the ResultSet.next() returns false, it means that
            there was no data found (which also means that this user
            does not exist in 
            */
            boolean valid = rs.next();
            rs.close();
            ps.close();
            conn.close();
            return valid;
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return false;
    }
    
    
    
}

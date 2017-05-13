/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author FPT
 */
public class ConnectionPool {
    public static Connection connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup("jdbc/webStorePool");
            java.sql.Connection conn = ds.getConnection();
            return conn;
        } catch (ClassNotFoundException | SQLException | NamingException e){
            e.printStackTrace();
        }
        return null;
    }
}

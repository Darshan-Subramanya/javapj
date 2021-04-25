/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nodue.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class DBConnection {
    Connection connection;
    public Connection getConnection(){
        try {
            Class.forName(Constants.DRIVER);
            connection = DriverManager.getConnection(Constants.URL, Constants.DB_USERNAME, Constants.DB_PASSWORD);
            System.out.println("Connection Established");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}

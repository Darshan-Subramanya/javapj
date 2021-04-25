/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nodue.dao;

import java.sql.ResultSet;

/**
 *
 * @author Torus
 */
public interface DAO {
    public int putData(String query);
    public ResultSet getData(String query);
    public boolean isExists(String query);
    public int getPrimaryKey(String primaryKey,String table);
    public void closeConnection();
}

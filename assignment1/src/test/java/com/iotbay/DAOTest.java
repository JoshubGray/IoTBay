package com.iotbay;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.iotbay.Dao.DBConnector;
import com.iotbay.Dao.UserDAO;

public class DAOTest{
    private DBConnector connector;
    private Connection conn;
    private UserDAO userDAO;

    public DAOTest() throws ClassNotFoundException, SQLException{
        connector=new DBConnector();
        conn=connector.openConnection();
        userDAO=new UserDAO(conn);
    }

    @Test
    public void testConnection() throws SQLException{
        assertNotNull(conn);
    }  
}


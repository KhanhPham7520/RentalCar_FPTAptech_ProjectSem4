package com.aptech.util;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class DBUtil {

    private static final String DB_CONFIG_FILE = "DB_CONFIG.properties";
    private static Properties props = null;

    private static String ReadKey(String key) throws Exception {
        String readVal = "";

        Properties properties = new Properties();
        properties.load(DBUtil.class.getResourceAsStream(DB_CONFIG_FILE));
        DBUtil.props = properties;

        readVal = props.getProperty(key);
        return readVal;
    }

    public static Connection getConn() {
        try {
            String driver = ReadKey("sqlDriver");
            String sqlURL = ReadKey("sqlUrl");
            String sqlUser = ReadKey("sqlUser");
            String sqlPassword = ReadKey("sqlPassword");

            Connection conn = null;
            Class.forName(driver);
            conn = DriverManager.getConnection(sqlURL, sqlUser, sqlPassword);

            return conn;
        } catch (Exception ex) {
            return null;
        }
    }

    public static void closeConn(Connection conn) {
        try {
            if (!conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

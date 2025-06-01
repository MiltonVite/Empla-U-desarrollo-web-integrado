/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MILTON - SUAREZ
 */
public class Conexion {

    private static Connection conexion;

    private Conexion() {
    }

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdesarrollojava", "root", "");
        } catch (Exception e) {
            System.err.println("Error" + e);
        }
        return conexion;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import ulearn.datos.ConnectionPool;

/**
 *
 * @author migchav
 */
public class SeccionDB {
    public static int insert(int idUsuario,int idSeccion) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;

        String desarrolloCurso = "INSERT INTO DESARROLLOSECCION ( IDSECCION, IDUSUARIO,COMPLETADA) VALUES ( ?,?, ?)";
       
        
        try {
            ps = connection.prepareStatement(desarrolloCurso);
            ps.setInt(1,idSeccion );          
            ps.setInt(2, idUsuario);
            ps.setBoolean(3, true);

            int res=ps.executeUpdate();
            ps.close();
            
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    public static boolean existe(int idUsuario,int idSeccion) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;
        ResultSet rs = null;

        String desarrolloCurso = "SELECT IDSECCION FROM desarrolloseccion WHERE IDSECCION=? AND IDUSUARIO=?;";
       
        
        try {
            ps = connection.prepareStatement(desarrolloCurso);
            ps.setInt(1,idSeccion );          
            ps.setInt(2, idUsuario);

            rs = ps.executeQuery();
            boolean res = rs.next();
            ps.close();
            
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
}

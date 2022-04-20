/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import ulearn.datos.ConnectionPool;
import ulearn.model.User;

/**
 *
 * @author migchav
 */
public class CursoDB {
    public static int insert(int idUsuario,int idCurso) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;

        String desarrolloCurso = "INSERT INTO DESARROLLOCURSO ( FECHAINICIO, IDUSUARIO, IDCURSO,VALORACION) VALUES ( ?, ?,?, ?)";
       
        
        try {
            ps = connection.prepareStatement(desarrolloCurso);
            ps.setObject(1, LocalDate.now());          
            ps.setInt(2, idUsuario);
            ps.setInt(3, idCurso);
            ps.setObject(4,null);

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
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
 * @author Javier
 */
public class SuscripcionesDB {
    
    
    public static int insert(User usuario, String tipoSuscripcion, int idAutor) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;
        PreparedStatement ps1 = null;

        String suscripcion = "INSERT INTO SUSCRIPCION ( TIPO, PRECIO, IDAUTOR) VALUES ( ?, ?, ?)";
        String obtencionsuscripcion = "INSERT INTO OBTENCIONSUSCRIPCION ( FECHAINICIO, COBRO, AUTORENOVAR, IDUSUARIO, IDSUSCRIPCION) VALUES ( ?, ?, ?, ?, ?)";
        
        double precio = 0;
        switch(tipoSuscripcion){
            case "GRATIS":
                precio = 0;
                break;
            case "ESTUDIANTE":
                precio = 9.99;
                break;
            case "TOTAL":
                precio = 19.99;
                break;
            case "AUTOR":
                precio = 3.99;
                break;
        }
        
        try {
            ps = connection.prepareStatement(suscripcion, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, tipoSuscripcion);         
            ps.setDouble(2, precio);
            if(idAutor!=-1){ps.setInt(3, idAutor);} else{ps.setObject(3, null);}
            
            
            int res = 0;
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                res = rs.getInt(1);
            }
            rs.close();
            ps.close();
            
            ps1 = connection.prepareStatement(obtencionsuscripcion,Statement.RETURN_GENERATED_KEYS);
            ps1.setObject(1, LocalDate.now());         
            ps1.setString(2, "MENSUAL");
            ps1.setBoolean(3,  true);
            ps1.setInt(4, usuario.getId());
            ps1.setInt(5, res);
            ps1.executeUpdate();
            ps1.close();
            
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        finally{
            ps.close();
            ps1.close();
            pool.freeConnection(connection);
        }


    }
}

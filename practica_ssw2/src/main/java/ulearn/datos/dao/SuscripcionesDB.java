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
import java.util.ArrayList;
import java.util.Arrays;
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
    public static Boolean[] getSuscripciones(int idUsuario){
        ArrayList <String> tiposSuscripciones=new ArrayList<String>();
        Boolean[] suscripciones = new Boolean[4];
        Arrays.fill(suscripciones, Boolean.FALSE);
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user=new User();
        String query = "SELECT S.ID,S.TIPO FROM OBTENCIONSUSCRIPCION OS,SUSCRIPCION S WHERE OS.IDUSUARIO=? AND OS.IDSUSCRIPCION=S.ID  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                tiposSuscripciones.add(rs.getString("TIPO"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            for (String cadena: tiposSuscripciones)  {
                switch(cadena){
                    case "GRATIS":
                        suscripciones[0]=true;
                        break;
                    case "ESTUDIANTE":
                        suscripciones[1]=true;
                        break;
                    case "TOTAL":
                        suscripciones[2]=true;
                        break;
                    case "AUTOR":
                        suscripciones[3]=true;
                        break;
                }
            }
            
        return suscripciones;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<Integer> getSuscripcionesDeAutor(int idUsuario){
        ArrayList <Integer> autoresSuscritos=new ArrayList<Integer>();
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user=new User();
        String query = "SELECT S.IDAUTOR FROM OBTENCIONSUSCRIPCION OS,SUSCRIPCION S WHERE OS.IDUSUARIO=? AND OS.IDSUSCRIPCION=S.ID AND S.TIPO='AUTOR' ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                autoresSuscritos.add(rs.getInt("IDAUTOR"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            
            
        return autoresSuscritos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
        
}

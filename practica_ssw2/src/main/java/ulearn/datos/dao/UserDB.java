/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;
import java.io.InputStream;
import ulearn.datos.ConnectionPool;
import ulearn.model.User;
import java.sql.*;

/**
 *
 * @author migchav
 */
public class UserDB {
    public static int insert(User usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps = null;

        String query = "INSERT INTO USUARIO (ID, NOMBREUSUARIO, CONTRASEÑA, CORREO, NOMBRE, APELLIDO, TELEFONO,INSTRUCTOR,DIRECCION,OCUPACION,PAIS,CIUDAD,FECHANACIMIENTO,BIOGRAFIA) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(2, usuario.getNombreUsuario());         
            ps.setString(3, usuario.getContraseña());
            ps.setString(4, usuario.getCorreo());
            ps.setString(5, usuario.getNombre());
            ps.setString(6, usuario.getApellidos());
            ps.setInt(7, usuario.getTelefono());
            ps.setBoolean(8, usuario.getInstructor());
            ps.setString(9, usuario.getDireccion());
            ps.setString(10, usuario.getOcupacion());
            ps.setString(11, usuario.getPais());
            ps.setString(12, usuario.getCiudad());
            ps.setObject(13, usuario.getFechaNacimiento());
            ps.setString(14, usuario.getBiografia());
            //ps.setPart(15, null);

            int res = 0;
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                res = rs.getInt(1);
            }
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return 0;
            }
        
    }
    
    public static boolean emailExists(String correo) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT CORREO FROM Usuario "
        + "WHERE CORREO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return false;
            }
        }

    
    

}

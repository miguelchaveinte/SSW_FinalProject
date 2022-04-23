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

        String query = "INSERT INTO USUARIO ( NOMBREUSUARIO, CONTRASEÑA, CORREO, NOMBRE, APELLIDO, TELEFONO,INSTRUCTOR,DIRECCION,OCUPACION,PAIS,CIUDAD,FECHANACIMIENTO,BIOGRAFIA) VALUES ( ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usuario.getNombreUsuario());         
            ps.setString(2, usuario.getContraseña());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getNombre());
            ps.setString(5, usuario.getApellidos());
            ps.setInt(6, usuario.getTelefono());
            ps.setBoolean(7, usuario.getInstructor());
            ps.setString(8, usuario.getDireccion());
            ps.setString(9, usuario.getOcupacion());
            ps.setString(10, usuario.getPais());
            ps.setString(11, usuario.getCiudad());
            ps.setObject(12, usuario.getFechaNacimiento());
            ps.setString(13, usuario.getBiografia());
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

    public static boolean comprobarUsuario(String correo, String userName, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT NOMBREUSUARIO,CONTRASEÑA FROM Usuario "
        + "WHERE CORREO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            boolean res=false;
            if(rs.next()){
                if(userName.equals(rs.getString("NOMBREUSUARIO")) && password.equals(rs.getString("CONTRASEÑA")))
                        res=true;
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return false;
            }
    }

    public static int getIdAutor(String usuarioAutor) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT ID FROM Usuario "
        + "WHERE NOMBREUSUARIO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, usuarioAutor);
            rs = ps.executeQuery();
            
            int res=0;
            if (rs.next()) {
                res = rs.getInt("ID");
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static User getInfoCreador(int idCurso){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user=new User();
        String query = "SELECT U.NOMBREUSUARIO, U.NOMBRE,U.APELLIDO FROM CURSO C, USUARIO U WHERE C.ID = ? AND U.ID=C.CREADOR;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idCurso);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellidos(rs.getString("APELLIDO"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

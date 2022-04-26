/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import ulearn.datos.ConnectionPool;
import ulearn.model.Curso;
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
    
    public static ArrayList<Integer> getCursosGratuitos() throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Integer> cursos = new ArrayList<Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cursosGratuitos = "SELECT C.ID, C.IMAGEN FROM CURSO C WHERE C.PRECIO=0;";
       
        
        try {
            ps = connection.prepareStatement(cursosGratuitos);
            rs=ps.executeQuery();
            
            while(rs.next()){
                cursos.add(rs.getInt("ID")); 
            }
            
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Integer> getCursosDemandados() throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Integer> cursos = new ArrayList<Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cursosDemandados = "with demandas as(\n" +
"                                    select dc.idcurso, count(*) as dem\n" +
"                                    from desarrollocurso dc\n" +
"                                    group by dc.idcurso\n" +
"                                 )\n" +
"                                 select d.idcurso\n" +
"                                 from demandas d, curso c\n" +
"                                 where 5>(select count(*)\n" +
"                                 from demandas d1\n" +
"                                 where d1.dem>d.dem) and c.id=d.idcurso;";
       
        
        try {
            ps = connection.prepareStatement(cursosDemandados);
            rs=ps.executeQuery();
            
            while(rs.next()){
                cursos.add(rs.getInt("idcurso")); 
            }
            
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Integer> getCursosFavoritos() throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Integer> cursos = new ArrayList<Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cursosFavoritos = "with valoraciones as(\n" +
"        select dc.idcurso, avg(dc.valoracion) as media\n" +
"        from desarrollocurso dc\n" +
"        group by dc.idcurso\n" +
"    )\n" +
"    select v.idcurso\n" +
"    from valoraciones v, curso c\n" +
"    where 5>(select count(*)\n" +
"             from valoraciones v1\n" +
"             where v1.media>v.media) and c.id=v.idcurso;";
       
        
        try {
            ps = connection.prepareStatement(cursosFavoritos);
            rs=ps.executeQuery();
            while(rs.next()){
                cursos.add(rs.getInt("idcurso")); 
            }
           
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    
    public static void getImagen(int id, OutputStream respuesta){
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("SELECT imagen FROM curso WHERE id=? ");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                Blob blob = result.getBlob("imagen");
                if (!result.wasNull() && blob.length() > 1) {
                    InputStream imagen = blob.getBinaryStream();
                    byte[] buffer = new byte[1000];
                    int len = imagen.read(buffer);
                    while (len != -1) {
                        respuesta.write(buffer, 0, len);
                        len = imagen.read(buffer);
                    }
                    imagen.close();
                } 
            }
        pool.freeConnection(connection);
        } catch (Exception e) {
        e.printStackTrace();
        } 
    }
    
    public static double getValoracion(int idCurso) throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        double valoracion=0;
        
        String valoracionMedia = "SELECT AVG(DC.VALORACION) AS MEDIA FROM DESARROLLOCURSO DC WHERE IDCURSO = ? GROUP BY DC.IDCURSO;";
       
        
        try {
            ps = connection.prepareStatement(valoracionMedia);
            ps.setInt(1, idCurso);
            rs=ps.executeQuery();
            
            while(rs.next()){
                valoracion=rs.getInt("MEDIA"); 
            }
            
            ps.close();
            pool.freeConnection(connection);
            return valoracion;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
       
    }
    
    public static Curso getInfoCurso (int idCurso) throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Curso curso=new Curso();
        
        String infoCurso = "SELECT NOMBRECURSO, DESCRIPCION, PRECIO, DURACION, CATEGORIA, CREADOR FROM CURSO WHERE ID = ?; ";
       
        
        try {
            ps = connection.prepareStatement(infoCurso);
            ps.setInt(1, idCurso);
            rs=ps.executeQuery();
            
            while(rs.next()){
                curso.setNombre(rs.getString("NOMBRECURSO")); 
                curso.setDescripcion(rs.getString("DESCRIPCION"));
                curso.setPrecio(rs.getFloat("PRECIO"));
                curso.setDuracion(rs.getFloat("DURACION"));
                curso.setCategoria(rs.getString("CATEGORIA"));
                curso.setCreador(rs.getInt("CREADOR"));
            }
            
            ps.close();
            pool.freeConnection(connection);
            return curso;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }

    public static void anadirfavorito(int idUser, int idCurso) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String favoritos = "INSERT INTO CURSOFAVORITO (IDUSUARIO, IDCURSO) VALUES (?, ?) ";
       
        
        try {
            ps = connection.prepareStatement(favoritos);
            ps.setInt(1,idUser);
            ps.setInt(2, idCurso);
            int res=ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }

    public static void eliminarfavorito(int idUser, int idCurso) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String favoritos = "DELETE FROM CURSOFAVORITO WHERE IDUSUARIO=? AND IDCURSO=? ";
       
        
        try {
            ps = connection.prepareStatement(favoritos);
            ps.setInt(1,idUser);
            ps.setInt(2, idCurso);
            int res=ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    
        public static boolean esFavorito(int idUser, int idCurso) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;
        ResultSet rs = null;

        String esFavorito = "SELECT IDCURSO FROM CURSOFAVORITO WHERE IDUSUARIO=? AND IDCURSO=?";
       
        
        try {
            ps = connection.prepareStatement(esFavorito);
            ps.setInt(1,idUser );          
            ps.setInt(2,idCurso);

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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ulearn.datos.dao.UserDB;
import ulearn.model.User;

/**
 *
 * @author Javier
 */
@WebServlet(name = "iniciarSesion", urlPatterns = {"/iniciarSesion"})
public class iniciarSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet iniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet iniciarSesion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);     
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user=new User();
        request.setCharacterEncoding("UTF-8");
        // Si no hay usuario procedemos con el registro
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String url="";
        if (UserDB.emailExists(email) && UserDB.comprobarUsuario(email,userName,password)) {
            url = "/Pricipal_logged.html";
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
        } else {
            //TODO: ERROR
            url = "/Pricipal.html";
            }
        // forward the request and response to the view
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
        
         /*User usuario = CookiesKitchen.GetUser(request, response);
        if (usuario != null) {
            // Si hay usuario redirigimos a perfil
            response.sendRedirect("/rerego/perfil");
        } else {
            request.setCharacterEncoding("UTF-8");
            // Si no hay usuario procedemos a iniciar sesión
            HttpSession session = request.getSession();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String passwordHash = Usuario.getSecurePassword(password);
            password = null;
            String rememberusername = request.getParameter("rememberusername");
            Usuario user = UsuarioDB.selectUser(username);
            if (user == null || !user.getPass().equals(passwordHash)) {
                // Error al iniciar sesión
                String mensajeError = "El nombre de usuario no existe o la contraseña es incorrecta.<br/>";
                session.setAttribute("mensajeError", mensajeError);
                response.sendRedirect("/rerego/iniciarsesion");
            } else {
                // Guardamos el usuario en la sesión...
                session.setAttribute("LoggedUser", user);
                if (rememberusername != null && rememberusername.equals("on")) {
                    // ...y en cookies si decide mantener la sesión abierta
                    Cookie login = new Cookie("login", username);
                    Cookie hash = new Cookie("hash", passwordHash);
                    login.setMaxAge(60 * 60 * 24 * 365 * 2); // 2 años
                    hash.setMaxAge(60 * 60 * 24 * 365 * 2); // 2 años
                    login.setPath("/");
                    hash.setPath("/");
                    response.addCookie(login);
                    response.addCookie(hash);
                }
                // Redirigimos al perfil
                response.sendRedirect("/rerego/perfil");
            }
        }*/
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

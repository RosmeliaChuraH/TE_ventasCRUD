package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Usuario sr = new Usuario();
            UsuarioDAO dao = new UsuarioDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    request.setAttribute("usuario", sr);
                    request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    sr = dao.getById(id);
                    request.setAttribute("usuario", sr);
                    request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("UsuarioControlador");
                    break;
                case "view":
                    // obtener la lista de registros
                    List<Usuario> listaUsuarios= dao.getAll();
                    request.setAttribute("usuarios", listaUsuarios);
                    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        
        Usuario sr = new Usuario();
        UsuarioDAO dao = new UsuarioDAOimpl();
        
        sr.setId(id);
        sr.setNombres(nombres);
        sr.setApellidos(apellidos);
        sr.setCorreo(correo);
        sr.setPassword(password);
        
        if (id == 0) {
            try {
                dao.insert(sr);
            } catch (Exception ex) {
                System.out.println("Error al insertar "+ ex.getMessage());
            }
        }else{
            try {
                dao.update(sr);
            } catch (Exception ex) {
                System.out.println("Error al editar "+ ex.getMessage());
            }
        }
  
        response.sendRedirect("UsuarioControlador");
    
    }

}

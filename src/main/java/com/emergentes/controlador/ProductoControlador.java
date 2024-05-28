
package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            ProductoDAO dao = new ProductoDAOimpl();
            int id;
            Producto prod = new Producto();
            String action =(request.getParameter("action") != null)? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    request.setAttribute("producto", prod);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    prod = dao.getById(id);
                    System.out.println(prod);
                    request.setAttribute("producto", prod);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath()+"/ProductoControlador");
                    break;
                case "view":
                    //obtener la lista de objetos
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                default:
                    break;
            }    
        } catch (Exception ex) {
            System.out.println("Error "+ ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        
        Producto prod = new Producto();
        prod.setId(id);
        prod.setNombre(nombre);
        prod.setDescripcion(descripcion);
        prod.setPrecio(precio);
        
        if(id == 0){
            try {//nuevo registro
                ProductoDAO dao = new ProductoDAOimpl();
                dao.insert(prod);
                response.sendRedirect(request.getContextPath()+"/ProductoControlador");
            } catch (Exception ex) {
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }else{
            try {//edicion de registro
                ProductoDAO dao = new ProductoDAOimpl();
                dao.update(prod);
                response.sendRedirect(request.getContextPath()+"/ProductoControlador");
            } catch (Exception ex) {
                System.out.println("Error al editar "+ex.getMessage());
            }
        }
    }

}

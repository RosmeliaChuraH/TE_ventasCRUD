package com.emergentes.dao;

import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOimpl extends ConexionBD implements UsuarioDAO {

    @Override
    public void insert(Usuario usr) throws Exception {
        try {
            this.conectar();
            String sql = "insert into usuarios (nombres,apellidos,correo,password) values (?,?,?,sha1(?))";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, usr.getNombres());
            ps.setString(2, usr.getApellidos());
            ps.setString(3, usr.getCorreo());
            ps.setString(4, usr.getPassword());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Usuario usr) throws Exception {
        try {
            this.conectar();
            String sql = "update usuarios set nombres=?, apellidos=?, correo=?, password=sha1(?) where id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, usr.getNombres());
            ps.setString(2, usr.getApellidos());
            ps.setString(3, usr.getCorreo());
            ps.setString(4, usr.getPassword());
            ps.setInt(5, usr.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql = "delete from usuarios where id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Usuario getById(int id) throws Exception {
        Usuario usr = new Usuario();
        try {
            this.conectar();
            String sql = "select * from usuarios where id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usr.setId(rs.getInt("id"));
                usr.setNombres(rs.getString("nombres"));
                usr.setApellidos(rs.getString("apellidos"));
                usr.setCorreo(rs.getString("correo"));
                usr.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return usr;
    }

    @Override
    public List<Usuario> getAll() throws Exception {
        List<Usuario> lista = null;
        try {
            this.conectar();
            String sql = "select * from usuarios";
            PreparedStatement ps = this.conn.prepareStatement(sql);

            lista = new ArrayList<Usuario>();

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario usr = new Usuario();
                usr.setId(rs.getInt("id"));
                usr.setNombres(rs.getString("nombres"));
                usr.setApellidos(rs.getString("apellidos"));
                usr.setCorreo(rs.getString("correo"));
                usr.setPassword(rs.getString("password"));
                lista.add(usr);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;

    }

}

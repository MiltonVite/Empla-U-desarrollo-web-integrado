/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DaoImpl;

import Modelo.oferta_practica;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author MILTON - SUAREZ
 */
public class PuestoDaoImpl {
    
    
    public List<oferta_practica> listar(int id_empresa){
    
        List<oferta_practica> lista = new ArrayList<>();
        String sql = "SELECT * FROM puestos where id_empresa = ?";
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_empresa);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                oferta_practica pst = new oferta_practica();
                pst.setId_puesto(rs.getInt("id_puesto"));
                pst.setTitulo(rs.getString("titulo"));
                pst.setDescripcion(rs.getString("descripcion"));
                pst.setRequisitos(rs.getString("requisitos"));
                pst.setEstado(rs.getString("estado"));
                pst.setVacantes(rs.getInt("vacantes"));
                pst.setFecha_limite(rs.getString("fecha_limite"));
                pst.setFecha_publicacion(rs.getString("fecha_publicacion"));
                pst.setId_empresa(rs.getInt("id_empresa"));
                lista.add(pst);
            }
        } catch (SQLException e) {
        }
        return lista;
        
    }
    
    
    
}

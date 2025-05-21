package ModeloDAO;

import Config.Conexion;
import Modelo.Elementos;
import Interfaces.CRUDElementos;
import Modelo.Persona;
import Interfaces.CRUD;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class ElementosDAO implements CRUDElementos {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Elementos p = new Elementos();

    @Override
    public List listarItem() {
        ArrayList<Elementos> list = new ArrayList<>();
        String sql = "select * from elementos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Elementos items = new Elementos();
                items.setIdItem(rs.getInt("IdItem"));
                items.setSerialElemento(rs.getString("SerialElemento"));
                items.setPlaca(rs.getString("Placa"));
                items.setNombreElemento(rs.getString("NombreElemento"));
                items.setModelo(rs.getString("Modelo"));
                items.setSituacionElemento(rs.getString("SituacionElemento"));
                items.setFotoElemento(rs.getString("FotoElemento"));
                list.add(items);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public boolean addItem(Elementos items) {
        String sql = "insert into elementos(SerialElemento,Placa,NombreElemento,Modelo,SituacionElemento,FotoElemento) values('"
                + items.getSerialElemento() + "','" + items.getPlaca() + "','"+ items.getNombreElemento() + "','" + items.getModelo() + "','" + items.getSituacionElemento() + "','" + items.getFotoElemento() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); 
        } catch (SQLException e) {
            System.out.println("Error al Agregar(PersonaDAO): " + e);
        }
        return false;
    }

    @Override
    public Elementos listItem(int idItem) {
        String sql = "select * from elementos where IdItem=" + idItem;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setIdItem(rs.getInt("IdItem"));
                p.setSerialElemento(rs.getString("SerialElemento"));
                p.setPlaca(rs.getString("Placa"));
                p.setNombreElemento(rs.getString("NombreElemento"));
                p.setModelo(rs.getString("Modelo"));
                p.setSituacionElemento(rs.getString("SituacionElemento"));
                p.setFotoElemento(rs.getString("FotoElemento"));

                System.out.println("Modificando Persona: " + p.getNombreElemento());
            }
        } catch (SQLException e) {
            System.out.println("Error al listar (PesonaDAO) en metodo List: " + e);
        }
        return p;
    }

    @Override
    public boolean eliminarItem(int idItem) {
       String sql = "delete from elementos where IdItem=" + idItem;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();            
        }catch(SQLException e){
            System.out.println("Error al Eliminar (productoDAO): " + e);            
        }     
        return false;    
    }

    @Override
    public boolean editItem(Elementos per) {
        String sql = "update elementos set SerialElemento='" + per.getSerialElemento()
                + "', Placa='" + per.getPlaca() +  "', NombreElemento='" + per.getNombreElemento() + "', Modelo='" + per.getModelo() + "', SituacionElemento='" + per.getSituacionElemento() + "', FotoElemento='" + per.getFotoElemento() + "' where IdItem=" + per.getIdItem();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Actualizar (edit) (productoDAO): " + e);
        }
        return false;
    }

    @Override
public Elementos buscarPorSerial(String SerialElemento) {
    String sql = "SELECT * FROM elementos WHERE SerialElemento = ?";
    Elementos items = null;
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, SerialElemento);
        rs = ps.executeQuery();

        if (rs.next()) {
            items = new Elementos();
            items.setIdItem(rs.getInt("IdItem"));
            items.setSerialElemento(rs.getString("SerialElemento"));
            items.setPlaca(rs.getString("Placa"));
            items.setNombreElemento(rs.getString("NombreElemento"));
            items.setModelo(rs.getString("Modelo"));
            items.setSituacionElemento(rs.getString("SituacionElemento"));
            items.setFotoElemento(rs.getString("FotoElemento"));
           
        }
    } catch (SQLException e) {
        System.out.println("Error al buscar por Serial del elemento: " + e);
    }
    return items;
}

@Override
public Elementos buscarPorId(int idItem) {
    Elementos elemento = null;
    String sql = "SELECT * FROM elementos WHERE IdItem = ?";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idItem);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            elemento = new Elementos();
            elemento.setIdItem(rs.getInt("IdItem"));
            elemento.setSerialElemento(rs.getString("SerialElemento"));
            elemento.setPlaca(rs.getString("Placa"));
            elemento.setNombreElemento(rs.getString("NombreElemento"));
            elemento.setModelo(rs.getString("Modelo"));
            elemento.setSituacionElemento(rs.getString("SituacionElemento"));
            elemento.setFotoElemento(rs.getString("FotoElemento"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return elemento;
}

@Override
public List<Elementos> obtenerElementosPorPersona(int idPersona) {
    List<Elementos> listaElementos = new ArrayList<>();
    String sql = "SELECT e.* FROM elementos e "
               + "INNER JOIN relacion_personaelemento r ON e.IdItem = r.IdItemUnit "
               + "WHERE r.IdPerUnit = ?";

    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idPersona); // Corrección: Se usa el parámetro correcto
        rs = ps.executeQuery();

        while (rs.next()) {
            Elementos elemento = new Elementos();
            elemento.setIdItem(rs.getInt("IdItem"));
            elemento.setSerialElemento(rs.getString("Serial")); // Verifica el nombre de la columna en BD
            elemento.setPlaca(rs.getString("Placa"));
            elemento.setNombreElemento(rs.getString("NombreElemento"));
            elemento.setModelo(rs.getString("Modelo"));
            elemento.setSituacionElemento(rs.getString("SituacionElemento"));
            listaElementos.add(elemento);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return listaElementos;
}

}

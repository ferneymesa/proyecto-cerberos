package ModeloDAO;

import Config.Conexion;
import Modelo.Relaciones;
import Interfaces.CRUDRelaciones;
import Modelo.Elementos;
import Interfaces.CRUDElementos;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class RelacionesDAO implements CRUDRelaciones {

    Conexion cn = new Conexion();

    @Override
    public List<Relaciones> listarUnit() {
        List<Relaciones> list = new ArrayList<>();
        String sql = "SELECT * FROM relacion_personaelemento";

        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Relaciones unit = new Relaciones();
                unit.setIdUnit(rs.getInt("IdUnit"));
                unit.setIdPerUnit(rs.getInt("IdPerUnit"));
                unit.setIdItemUnit(rs.getInt("IdItemUnit"));
                list.add(unit);
            }
        } catch (SQLException e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
public boolean addUnit(Relaciones unit) {
    String sql = "INSERT INTO relacion_personaelemento (IdPerUnit, IdItemUnit) VALUES (?, ?)";
    boolean inserted = false;

    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, unit.getIdPerUnit());
        ps.setInt(2, unit.getIdItemUnit());

        int rowsAffected = ps.executeUpdate();
        System.out.println("Filas insertadas: " + rowsAffected);
        inserted = rowsAffected > 0;

    } catch (SQLException e) {
        System.out.println("Error al Agregar (RelacionesDAO): " + e);
        e.printStackTrace();
    }

    return inserted;
}


    @Override
    public Relaciones listUnit(int idUnit) {
        String sql = "SELECT * FROM relacion_personaelemento WHERE IdUnit = ?";
        Relaciones unit = null;

        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUnit);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    unit = new Relaciones();
                    unit.setIdUnit(rs.getInt("IdUnit"));
                    unit.setIdPerUnit(rs.getInt("IdPerUnit"));
                    unit.setIdItemUnit(rs.getInt("IdItemUnit"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al Listar (RelacionesDAO): " + e);
        }
        return unit;
    }

    @Override
    public boolean eliminarUnit(int idUnit) {
        String sql = "DELETE FROM relacion_personaelemento WHERE IdUnit = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUnit);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error al Eliminar (RelacionesDAO): " + e);
            return false;
        }
    }

    @Override
    public boolean editUnit(Relaciones unit) {
        String sql = "UPDATE relacion_personaelemento SET IdPerUnit = ?, IdItemUnit = ? WHERE IdUnit = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, unit.getIdPerUnit());
            ps.setInt(2, unit.getIdItemUnit());
            ps.setInt(3, unit.getIdUnit());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error al Actualizar (RelacionesDAO): " + e);
            return false;
        }
    }

    @Override
    public List<Relaciones> buscarPorIdPerUnit(int IdPerUnit) {
        String sql = "SELECT * FROM relacion_personaelemento WHERE IdPerUnit = ?";
        List<Relaciones> list = new ArrayList<>();

        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, IdPerUnit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Relaciones unit = new Relaciones();
                    unit.setIdUnit(rs.getInt("IdUnit"));
                    unit.setIdPerUnit(rs.getInt("IdPerUnit"));
                    unit.setIdItemUnit(rs.getInt("IdItemUnit"));
                    list.add(unit);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al Buscar por IdPerUnit: " + e);
        }
        return list;
    }

    @Override
    public List<Relaciones> buscarPorIdItemUnit(int IdItemUnit) {
        String sql = "SELECT * FROM relacion_personaelemento WHERE IdItemUnit = ?";
        List<Relaciones> list = new ArrayList<>();

        try (Connection con = cn.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, IdItemUnit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Relaciones unit = new Relaciones();
                    unit.setIdUnit(rs.getInt("IdUnit"));
                    unit.setIdPerUnit(rs.getInt("IdPerUnit"));
                    unit.setIdItemUnit(rs.getInt("IdItemUnit"));
                    list.add(unit);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al Buscar por IdItemUnit: " + e);
        }
        return list;
    }


 @Override
public boolean existeRelacion(int idPerUnit, int idItemUnit) {
    String sql = "SELECT COUNT(*) FROM relacion_personaelemento WHERE IdPerUnit = ? AND IdItemUnit = ?";
    boolean existe = false;

    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, idPerUnit);
        ps.setInt(2, idItemUnit);
        
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next() && rs.getInt(1) > 0) {
                existe = true; // Ya existe la relación
            }
        }
    } catch (SQLException e) {
        System.out.println("Error al verificar existencia de relación: " + e);
        e.printStackTrace();
    }

    return existe;
}

@Override
public List<Elementos> obtenerElementosPorPersona(int idPerUnit) {
    List<Elementos> lista = new ArrayList<>();
    String sql = "SELECT e.* FROM relacion_personaelemento r " +
                 "INNER JOIN elementos e ON r.IdItemUnit = e.IdItem " +
                 "WHERE r.IdPerUnit = ?";

    try (Connection con = cn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, idPerUnit);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Elementos elemento = new Elementos();
                elemento.setIdItem(rs.getInt("IdItem"));
                elemento.setSerialElemento(rs.getString("SerialElemento"));
                elemento.setPlaca(rs.getString("Placa"));
                elemento.setNombreElemento(rs.getString("NombreElemento"));
                elemento.setModelo(rs.getString("Modelo"));
                elemento.setSituacionElemento(rs.getString("SituacionElemento"));
                lista.add(elemento);
            }
        }
    } catch (SQLException e) {
        System.out.println("Error al obtener elementos de la persona: " + e.getMessage());
        e.printStackTrace();
    }
    return lista;
}


}
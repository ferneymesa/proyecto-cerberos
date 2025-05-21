package ModeloDAO;

import Config.Conexion;
import Modelo.Registros;
import Interfaces.CRUDRegistros;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class RegistrosDAO implements CRUDRegistros {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Registros p = new Registros();

    @Override
    public List listarRegistros() {
        ArrayList<Registros> list = new ArrayList<>();
        String sql = "SELECT * FROM controles";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Registros check = new Registros();
                check.setIdCont(rs.getInt("IdCont"));
                check.setNombreCont(rs.getString("NombreCont"));
                check.setDocumentoCont(rs.getString("DocumentoCont"));
                check.setEmpresaCont(rs.getString("EmpresaCont"));
                check.setCargoCont(rs.getString("CargoCont"));
                check.setSerialCont(rs.getString("SerialCont"));
                check.setPlacaCont(rs.getString("PlacaCont"));
                check.setElementoCont(rs.getString("ElementoCont"));
                check.setSituacionCont(rs.getString("SituacionCont"));
                check.setDiaCont(rs.getInt("DiaCont"));
                check.setMesCont(rs.getString("MesCont"));
                check.setAnnoCont(rs.getInt("AnnoCont"));
                check.setHoraCont(rs.getString("HoraCont"));
                check.setProcesoCont(rs.getString("ProcesoCont"));
                check.setAutorizaCont(rs.getString("AutorizaCont"));
                check.setObservacionesCont(rs.getString("ObservacionesCont"));
                check.setResponsableCont(rs.getString("ResponsableCont"));
                list.add(check);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public List listarTemporales() {
        ArrayList<Registros> list = new ArrayList<>();
        String sql = null;
        try {
            con = cn.getConnection();

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Registros check = new Registros();

                check.setNombreCont(rs.getString("NombreCont"));
                check.setDocumentoCont(rs.getString("DocumentoCont"));
                check.setEmpresaCont(rs.getString("EmpresaCont"));
                check.setCargoCont(rs.getString("CargoCont"));
                check.setSerialCont(rs.getString("SerialCont"));
                check.setPlacaCont(rs.getString("PlacaCont"));
                check.setElementoCont(rs.getString("ElementoCont"));
                check.setSituacionCont(rs.getString("SituacionCont"));
                check.setProcesoCont(rs.getString("ProcesoCont"));
                check.setObservacionesCont(rs.getString("ObservacionesCont"));

                list.add(check);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public boolean addRegistros(Registros check) {
        String sql = "INSERT INTO controles (NombreCont, DocumentoCont, EmpresaCont, CargoCont, SerialCont, PlacaCont, ElementoCont, SituacionCont, DiaCont, MesCont, AnnoCont, HoraCont, ProcesoCont, AutorizaCont, ObservacionesCont, ResponsableCont) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, check.getNombreCont());
            ps.setString(2, check.getDocumentoCont());
            ps.setString(3, check.getEmpresaCont());
            ps.setString(4, check.getCargoCont());
            ps.setString(5, check.getSerialCont());
            ps.setString(6, check.getPlacaCont());
            ps.setString(7, check.getElementoCont());
            ps.setString(8, check.getSituacionCont());
            ps.setInt(9, check.getDiaCont()); // Si es INT, usar setInt
            ps.setString(10, check.getMesCont());
            ps.setInt(11, check.getAnnoCont()); // Si es INT, usar setInt
            ps.setString(12, check.getHoraCont());
            ps.setString(13, check.getProcesoCont());
            ps.setString(14, check.getAutorizaCont());
            ps.setString(15, check.getObservacionesCont());
            ps.setString(16, check.getResponsableCont());

            int resultado = ps.executeUpdate();

            if (resultado > 0) {
                System.out.println("Registro insertado correctamente.");
                return true; // ✅ Retorna true si se insertó correctamente
            } else {
                System.out.println("Error: No se insertó el registro.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Error al Agregar (RegistrosDAO): " + e.getMessage());
            return false; // ❌ Retorna false si hubo error
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public Registros listRegistros(int idCont) {
        String sql = "select * from controles where IdCont= ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                p.setIdCont(rs.getInt("IdCont"));
                p.setNombreCont(rs.getString("NombreCont"));
                p.setNombreCont(rs.getString("NombreCont"));
                p.setDocumentoCont(rs.getString("DocumentoCont"));
                p.setEmpresaCont(rs.getString("EmpresaCont"));
                p.setCargoCont(rs.getString("CargoCont"));
                p.setSerialCont(rs.getString("SerialCont"));
                p.setPlacaCont(rs.getString("PlacaCont"));
                p.setElementoCont(rs.getString("ElementoCont"));
                p.setSituacionCont(rs.getString("SituacionCont"));
                p.setDiaCont(rs.getInt("DiaCont"));
                p.setMesCont(rs.getString("MesCont"));
                p.setAnnoCont(rs.getInt("AnnoCont"));
                p.setHoraCont(rs.getString("HoraCont"));
                p.setProcesoCont(rs.getString("ProcesoCont"));
                p.setAutorizaCont(rs.getString("AutorizaCont"));
                p.setObservacionesCont(rs.getString("ObservacionesCont"));
                p.setResponsableCont(rs.getString("ResponsableCont"));

                System.out.println("Modificando Registro: " + p.getIdCont());
            }
        } catch (SQLException e) {
            System.out.println("Error al listar (ControlesDAO) en metodo List: " + e);
        }
        return p;
    }

    @Override
    public boolean eliminarRegistros(int idCont) {
        String sql = "delete from controles where IdCont= ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar (ControlesDAO): " + e);
        }
        return false;
    }

    @Override
    public boolean editRegistros(Registros check) {
        String sql = "update controles set "
                + "NombreCont='" + check.getNombreCont()
                + "', DocumentoCont='" + check.getDocumentoCont()
                + "', EmpresaCont='" + check.getEmpresaCont()
                + "', CargoCont='" + check.getCargoCont()
                + "', SerialCont='" + check.getSerialCont()
                + "', PlacaCont='" + check.getPlacaCont()
                + "', ElementoCont='" + check.getElementoCont()
                + "', SituacionCont='" + check.getSituacionCont()
                + "', DiaCont='" + check.getDiaCont()
                + "', MesCont='" + check.getMesCont()
                + "', AnnoCont='" + check.getAnnoCont()
                + "', HoraCont='" + check.getHoraCont()
                + "', ProcesoCont='" + check.getProcesoCont()
                + "', AutorizaCont='" + check.getAutorizaCont()
                + "', ObservacionesCont='" + check.getObservacionesCont()
                + "', ResponsableCont='" + check.getResponsableCont()
                + "' where IdCont=" + check.getIdCont();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Actualizar (edit) (ControlesDAO): " + e);
        }
        return false;
    }

    @Override
    public Registros buscarPorDocumentoRegistros(String DocumentoCont) {
        String sql = "SELECT * FROM controles WHERE DocumentoCont = ?";
        Registros check = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, DocumentoCont);
            rs = ps.executeQuery();

            if (rs.next()) {
                check = new Registros();
                check.setIdCont(rs.getInt("IdCont"));
                check.setNombreCont(rs.getString("NombreCont"));
                check.setDocumentoCont(rs.getString("DocumentoCont"));
                check.setEmpresaCont(rs.getString("EmpresaCont"));
                check.setCargoCont(rs.getString("CargoCont"));
                check.setSerialCont(rs.getString("SerialCont"));
                check.setPlacaCont(rs.getString("PlacaCont"));
                check.setElementoCont(rs.getString("ElementoCont"));
                check.setSituacionCont(rs.getString("SituacionCont"));
                check.setDiaCont(rs.getInt("DiaCont"));
                check.setMesCont(rs.getString("MesCont"));
                check.setAnnoCont(rs.getInt("AnnoCont"));
                check.setHoraCont(rs.getString("HoraCont"));
                check.setProcesoCont(rs.getString("ProcesoCont"));
                check.setAutorizaCont(rs.getString("AutorizaCont"));
                check.setObservacionesCont(rs.getString("ObservacionesCont"));
                check.setResponsableCont(rs.getString("ResponsableCont"));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar por Documento: " + e);
        }
        return check;
    }

    @Override
    public Registros buscarPorSerialRegistros(String SerialCont) {
        String sql = "SELECT * FROM controles WHERE SerialCont = ?";
        Registros check = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, SerialCont);
            rs = ps.executeQuery();

            if (rs.next()) {
                check = new Registros();
                check.setIdCont(rs.getInt("IdCont"));
                check.setNombreCont(rs.getString("NombreCont"));
                check.setDocumentoCont(rs.getString("DocumentoCont"));
                check.setEmpresaCont(rs.getString("EmpresaCont"));
                check.setCargoCont(rs.getString("CargoCont"));
                check.setSerialCont(rs.getString("SerialCont"));
                check.setPlacaCont(rs.getString("PlacaCont"));
                check.setElementoCont(rs.getString("ElementoCont"));
                check.setSituacionCont(rs.getString("SituacionCont"));
                check.setDiaCont(rs.getInt("DiaCont"));
                check.setMesCont(rs.getString("MesCont"));
                check.setAnnoCont(rs.getInt("AnnoCont"));
                check.setHoraCont(rs.getString("HoraCont"));
                check.setProcesoCont(rs.getString("ProcesoCont"));
                check.setAutorizaCont(rs.getString("AutorizaCont"));
                check.setObservacionesCont(rs.getString("ObservacionesCont"));
                check.setResponsableCont(rs.getString("ResponsableCont"));

            }
        } catch (SQLException e) {
            System.out.println("Error al buscar por Serial del elemento: " + e);
        }
        return check;
    }

    @Override
    public List<Registros> buscarPorFechaRegistros(Integer diaCont, String mesCont, Integer annoCont) {
        List<Registros> lista = new ArrayList<>();
        String sql = "SELECT * FROM controles WHERE 1=1 ";
        List<Object> parametros = new ArrayList<>();

        if (diaCont != null) {
            sql += " AND DiaCont = ?";
            parametros.add(diaCont);
        }
        if (mesCont != null && !mesCont.isEmpty()) {
            sql += " AND MesCont = ?";
            parametros.add(mesCont);
        }
        if (annoCont != null) {
            sql += " AND AnnoCont = ?";
            parametros.add(annoCont);
        }

        try (Connection con = cn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Asignar parámetros dinámicamente
            for (int i = 0; i < parametros.size(); i++) {
                if (parametros.get(i) instanceof Integer) {
                    ps.setInt(i + 1, (Integer) parametros.get(i));
                } else if (parametros.get(i) instanceof String) {
                    ps.setString(i + 1, (String) parametros.get(i));
                }
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Registros check = new Registros();
                    check.setIdCont(rs.getInt("IdCont"));
                    check.setNombreCont(rs.getString("NombreCont"));
                    check.setDocumentoCont(rs.getString("DocumentoCont"));
                    check.setEmpresaCont(rs.getString("EmpresaCont"));
                    check.setCargoCont(rs.getString("CargoCont"));
                    check.setSerialCont(rs.getString("SerialCont"));
                    check.setPlacaCont(rs.getString("PlacaCont"));
                    check.setElementoCont(rs.getString("ElementoCont"));
                    check.setSituacionCont(rs.getString("SituacionCont"));
                    check.setDiaCont(rs.getInt("DiaCont"));
                    check.setMesCont(rs.getString("MesCont"));
                    check.setAnnoCont(rs.getInt("AnnoCont"));
                    check.setHoraCont(rs.getString("HoraCont"));
                    check.setProcesoCont(rs.getString("ProcesoCont"));
                    check.setAutorizaCont(rs.getString("AutorizaCont"));
                    check.setObservacionesCont(rs.getString("ObservacionesCont"));
                    check.setResponsableCont(rs.getString("ResponsableCont"));

                    lista.add(check);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar por fecha: " + e.getMessage());
        }

        return lista;
    }

   @Override
public Registros obtenerUltimoRegistro(String documento) {
    Registros registro = null;
    String sql = "SELECT * FROM controles WHERE documentoCont = ? ORDER BY idCont DESC LIMIT 1";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, documento);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            registro = new Registros();
            registro.setIdCont(rs.getInt("idCont"));
            registro.setDocumentoCont(rs.getString("documentoCont"));
            registro.setProcesoCont(rs.getString("procesoCont")); // Asegúrate de que esta columna existe en la BD
        }
    } catch (Exception e) {
        System.out.println("Error en obtenerUltimoRegistro: " + e.getMessage());
    }
    return registro;
}

}

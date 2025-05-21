package ModeloDAO;

import Config.Conexion;
import Modelo.Externos;
import Interfaces.CRUDExternos;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class ExternosDAO implements CRUDExternos {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Externos p = new Externos();

    @Override
    public List listarExt() {
        ArrayList<Externos> list = new ArrayList<>();
        String sql = "select * from externos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Externos outers = new Externos();
                outers.setIdExt(rs.getInt("IdExt"));
                outers.setDocumentoExt(rs.getString("DocumentoExt"));
                outers.setNombreExt(rs.getString("NombreExt"));
                outers.setTelefonoExt(rs.getString("TelefonoExt"));
                outers.setEmailExt(rs.getString("EmailExt"));
                outers.setCargoExt(rs.getString("CargoExt"));
                outers.setEmpresaExt(rs.getString("EmpresaExt"));
                list.add(outers);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public boolean addExt(Externos outers) {
        String sql = "insert into externos(DocumentoExt,NombreExt, TelefonoExt, EmailExt, CargoExt, EmpresaExt) "
                + "values('" + outers.getDocumentoExt() + "','" + outers.getNombreExt() + "','" + outers.getTelefonoExt() + "','" + outers.getEmailExt() + "','" + outers.getCargoExt() + "','" + outers.getEmpresaExt() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Agregar(ExternoDAO): " + e);
        }
        return false;
    }

    @Override
    public Externos listExt(int idExt) {
        String sql = "select * from externos where IdExt=" + idExt;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setIdExt(rs.getInt("IdExt"));
                p.setIdExt(rs.getInt("IdExt"));
                p.setDocumentoExt(rs.getString("DocumentoExt"));
                p.setNombreExt(rs.getString("NombreExt"));
                p.setTelefonoExt(rs.getString("TelefonoExt"));
                p.setEmailExt(rs.getString("EmailExt"));
                p.setCargoExt(rs.getString("CargoExt"));
                p.setEmpresaExt(rs.getString("EmpresaExt"));

                System.out.println("Modificando Persona: " + p.getNombreExt());
            }
        } catch (SQLException e) {
            System.out.println("Error al listar (PesonaDAO) en metodo List: " + e);
        }
        return p;
    }

    @Override
    public boolean eliminarExt(int idExt) {
        String sql = "delete from externos where IdExt=" + idExt;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar (ExternosDAO): " + e);
        }
        return false;
    }

    @Override
    public boolean editExt(Externos outers) {
        String sql = "update externos set "
                + "DocumentoExt='" + outers.getDocumentoExt()
                + "', NombreExt='" + outers.getNombreExt()
                + "', TelefonoExt='" + outers.getTelefonoExt()
                + "', EmailExt='" + outers.getEmailExt()
                + "', CargoExt='" + outers.getCargoExt()
                + "', EmpresaExt='" + outers.getEmpresaExt() + "' "
                + "where IdExt=" + outers.getIdExt();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Actualizar (edit) (externoDAO): " + e);
        }
        return false;
    }

    @Override
    public Externos buscarPorDocumento(String DocumentoExt) {
        String sql = "SELECT * FROM externos WHERE DocumentoExt = ?";
        Externos outers = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, DocumentoExt);
            rs = ps.executeQuery();

            if (rs.next()) {
                outers = new Externos();
                outers.setIdExt(rs.getInt("IdExt"));
                outers.setDocumentoExt(rs.getString("DocumentoExt"));
                outers.setNombreExt(rs.getString("NombreExt"));
                outers.setTelefonoExt(rs.getString("TelefonoExt"));
                outers.setEmailExt(rs.getString("EmailExt"));
                outers.setCargoExt(rs.getString("CargoExt"));
                outers.setEmpresaExt(rs.getString("EmpresaExt"));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar por Serial del elemento: " + e);
        }
        return outers;
    }

}

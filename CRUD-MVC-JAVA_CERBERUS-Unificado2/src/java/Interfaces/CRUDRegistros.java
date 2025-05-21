
package Interfaces;

import Modelo.Registros;
import java.util.List;

public interface CRUDRegistros {
    public List listarRegistros();
    public List listarTemporales();
    public Registros listRegistros(int idCont);
    public boolean addRegistros(Registros check);
    public boolean editRegistros(Registros check);
    public boolean eliminarRegistros(int idCont);
    public Registros buscarPorDocumentoRegistros(String DocumentoCont);
    public Registros buscarPorSerialRegistros(String SerialCont);
    public List<Registros> buscarPorFechaRegistros(Integer dia, String mes, Integer anno);
    public Registros obtenerUltimoRegistro(String documento);
}

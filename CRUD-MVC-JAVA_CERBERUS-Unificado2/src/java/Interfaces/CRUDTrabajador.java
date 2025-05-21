
package Interfaces;

import Modelo.Trabajador;
import java.util.List;

public interface CRUDTrabajador {
    public List listarRH();
    public Trabajador listRH(int idRH);
    public boolean addRH(Trabajador recursoH);
    public boolean editRH(Trabajador recursoH);
    public boolean eliminarRH(int idRH);
    public Trabajador buscarPorDocumentoRH(String DocumentoRH);
    public Trabajador validarUsuario(String documentoRH, String passwordRH);
}

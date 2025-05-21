package Interfaces;

import Modelo.Externos;
import java.util.List;

public interface CRUDExternos {

    public List listarExt();

    public boolean addExt(Externos outers);

    public Externos listExt(int idExt);

    public boolean eliminarExt(int idExt);

    public boolean editExt(Externos outers);

    public Externos buscarPorDocumento(String DocumentoExt);
}

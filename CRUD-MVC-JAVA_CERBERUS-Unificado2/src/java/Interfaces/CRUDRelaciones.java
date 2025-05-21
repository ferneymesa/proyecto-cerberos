
package Interfaces;

import Modelo.Elementos;
import Modelo.Relaciones;
import java.util.List;

public interface CRUDRelaciones {
    public List listarUnit();
    public Relaciones listUnit(int idUnit);
    public boolean addUnit(Relaciones unit);
    public boolean editUnit(Relaciones unit);
    public boolean eliminarUnit(int idunit);
    public List<Relaciones> buscarPorIdItemUnit(int IdItemUnit);
    public List<Relaciones> buscarPorIdPerUnit(int IdPerUnit);
    public boolean existeRelacion(int idPerUnit, int idItemUnit);
    public List<Elementos> obtenerElementosPorPersona(int idPerUnit);
    
}

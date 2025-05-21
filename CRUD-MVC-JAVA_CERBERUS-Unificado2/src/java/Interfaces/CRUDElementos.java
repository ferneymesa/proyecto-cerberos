
package Interfaces;

import Modelo.Elementos;
import java.util.List;

public interface CRUDElementos {
    public List listarItem();
    public Elementos listItem(int idItem);
    public boolean addItem(Elementos per);
    public boolean editItem(Elementos per);
    public boolean eliminarItem(int idItem);
    public Elementos buscarPorSerial(String dni);
    public Elementos buscarPorId(int idItem);
    public List<Elementos> obtenerElementosPorPersona(int idPersona);
}

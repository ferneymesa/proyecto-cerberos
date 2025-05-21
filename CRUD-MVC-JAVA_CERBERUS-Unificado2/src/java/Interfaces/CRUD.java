
package Interfaces;

import Modelo.Persona;
import java.util.List;

public interface CRUD {
    public List listarPer();
    public Persona listPer(int idPer);
    public boolean addPer(Persona per);
    public boolean editPer(Persona per);
    public boolean eliminarPer(int idPer);
    public Persona buscarPorDni(String dni);
}

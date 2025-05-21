package Modelo;

public class Relaciones {

    int idUnit;
    int idPerUnit;
    int idItemUnit;

    public Relaciones() {
    }

    public Relaciones(int idPerUnit, int idItemUnit) {
        this.idPerUnit = idPerUnit;
        this.idItemUnit = idItemUnit;
    }

    public int getIdUnit() {
        return idUnit;
    }

    public void setIdUnit(int idUnit) {
        this.idUnit = idUnit;
    }

    public int getIdPerUnit() {
        return idPerUnit;
    }

    public void setIdPerUnit(int idPerUnit) {
        this.idPerUnit = idPerUnit;
    }

    public int getIdItemUnit() {
        return idItemUnit;
    }

    public void setIdItemUnit(int idItemUnit) {
        this.idItemUnit = idItemUnit;
    }

   
}

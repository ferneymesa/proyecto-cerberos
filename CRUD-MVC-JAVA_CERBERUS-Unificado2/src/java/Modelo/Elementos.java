package Modelo;

public class Elementos {

    int idItem;
    String serialElemento;
    String placa;
    String nombreElemento;
    String modelo;
    String situacionElemento;
    String fotoElemento;

    public Elementos() {
    }

    public Elementos(String serialElemento, String placa, String nombreElemento, String modelo, String situacionElemento, String fotoElemento) {
        this.serialElemento = serialElemento;
        this.placa = placa;
        this.nombreElemento = nombreElemento;
        this.modelo = modelo;
        this.situacionElemento = situacionElemento;
        this.fotoElemento = fotoElemento;
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public String getSerialElemento() {
        return serialElemento;
    }

    public void setSerialElemento(String serialElemento) {
        this.serialElemento = serialElemento;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getNombreElemento() {
        return nombreElemento;
    }

    public void setNombreElemento(String nombreElemento) {
        this.nombreElemento = nombreElemento;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getSituacionElemento() {
        return situacionElemento;
    }

    public void setSituacionElemento(String situacionElemento) {
        this.situacionElemento = situacionElemento;
    }

    public String getFotoElemento() {
        return fotoElemento;
    }

    public void setFotoElemento(String fotoElemento) {
        this.fotoElemento = fotoElemento;
    }


}

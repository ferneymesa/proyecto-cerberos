package Modelo;

public class Trabajador {
    int idRH;
    String documentoRH;
    String nombreRH;
    String telefonoRH;
    String categoria;
    private String passwordRH;

    public Trabajador() {
    }

    public Trabajador(String documentoRH, String nombreRH, String telefonoRH, String Categoria, String passwordRH) {
        this.documentoRH = documentoRH;
        this.nombreRH = nombreRH;
        this.telefonoRH = telefonoRH;
        this.categoria = Categoria;
        this.passwordRH = passwordRH;
    }

    public int getIdRH() {
        return idRH;
    }

    public void setIdRH(int idRH) {
        this.idRH = idRH;
    }

    public String getDocumentoRH() {
        return documentoRH;
    }

    public void setDocumentoRH(String documentoRH) {
        this.documentoRH = documentoRH;
    }

    public String getNombreRH() {
        return nombreRH;
    }

    public void setNombreRH(String nombreRH) {
        this.nombreRH = nombreRH;
    }

    public String getTelefonoRH() {
        return telefonoRH;
    }

    public void setTelefonoRH(String telefonoRH) {
        this.telefonoRH = telefonoRH;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }


    public String getPasswordRH() {
        return passwordRH;
    }

    public void setPasswordRH(String passwordRH) {
        this.passwordRH = passwordRH;
    }

}
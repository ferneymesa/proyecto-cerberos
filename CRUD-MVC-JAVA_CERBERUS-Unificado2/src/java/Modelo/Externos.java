package Modelo;

public class Externos {
    int idExt;
    String documentoExt;
    String nombreExt;
    String telefonoExt;
    String emailExt;
    String cargoExt;
    String empresaExt;
    

    public Externos() {
    }

    public Externos(String documentoExt, String nombreExt, String telefonoExt, String emailExt, String cargoExt, String empresaExt) {
        this.documentoExt = documentoExt;
        this.nombreExt = nombreExt;
        this.telefonoExt = telefonoExt;
        this.emailExt = emailExt;
        this.cargoExt = cargoExt;
        this.empresaExt = empresaExt;
    }

    public int getIdExt() {
        return idExt;
    }

    public void setIdExt(int idExt) {
        this.idExt = idExt;
    }

    public String getDocumentoExt() {
        return documentoExt;
    }

    public void setDocumentoExt(String documentoExt) {
        this.documentoExt = documentoExt;
    }

    public String getNombreExt() {
        return nombreExt;
    }

    public void setNombreExt(String nombreExt) {
        this.nombreExt = nombreExt;
    }

    public String getTelefonoExt() {
        return telefonoExt;
    }

    public void setTelefonoExt(String telefonoExt) {
        this.telefonoExt = telefonoExt;
    }

    public String getEmailExt() {
        return emailExt;
    }

    public void setEmailExt(String emailExt) {
        this.emailExt = emailExt;
    }

    public String getCargoExt() {
        return cargoExt;
    }

    public void setCargoExt(String cargoExt) {
        this.cargoExt = cargoExt;
    }

    public String getEmpresaExt() {
        return empresaExt;
    }

    public void setEmpresaExt(String empresaExt) {
        this.empresaExt = empresaExt;
    }
    
    
}
package Modelo;

public class Persona {
    int idPer;
    String dni;
    String nom;
    String telefono;
    String email;
    String AreaTrabajo;
    String empresa;
    String FotoUsua;

    public Persona() {
    }

    public Persona(String dni, String nom, String telefono, String email, String AreaTabajo,String empresa, String FotoUsua) {
        this.dni = dni;
        this.nom = nom;
        this.telefono = telefono;
        this.email = email;
        this.AreaTrabajo = AreaTabajo;
        this.empresa = empresa;
        this.FotoUsua = FotoUsua;
    }

    public int getIdPer() {
        return idPer;
    }

    public void setIdPer(int idPer) {
        this.idPer = idPer;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAreaTrabajo() {
        return AreaTrabajo;
    }

    public void setAreaTrabajo(String AreaTrabajo) {
        this.AreaTrabajo = AreaTrabajo;
    }


    public String getFotoUsua() {
        return FotoUsua;
    }

    public void setFotoUsua(String FotoUsua) {
        this.FotoUsua = FotoUsua;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    

}
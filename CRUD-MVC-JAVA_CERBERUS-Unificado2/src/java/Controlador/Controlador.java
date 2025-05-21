package Controlador;

import java.util.List;
import Modelo.Elementos;
import ModeloDAO.RelacionesDAO;
import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {

    String listarPer = "vistas/listarPer.jsp";
    String addPer = "vistas/addPer.jsp";
    String editPer = "vistas/editPer.jsp";
    String Buscar = "vistas/control_1.jsp";

    Persona persona = new Persona();
    PersonaDAO personaDAO = new PersonaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listarPer")) {
            acceso = listarPer;
        } else if (action.equalsIgnoreCase("addPer")) {
            acceso = addPer;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String dni = request.getParameter("txtDni");
            String nom = request.getParameter("txtNom");
            String telefono = request.getParameter("txtTelefono");
            String email = request.getParameter("txtEmail");
            String AreaTrabajo = request.getParameter("txtAreaTrabajo");
            String empresa = request.getParameter("txtEmpresa");
            String FotoUsua = request.getParameter("txtFotoUsua");
            persona.setDni(dni);
            persona.setNom(nom);
            persona.setTelefono(telefono);
            persona.setEmail(email);
            persona.setAreaTrabajo(AreaTrabajo);
            persona.setEmpresa(empresa);
            persona.setFotoUsua(FotoUsua);
            personaDAO.addPer(persona);
            acceso = listarPer;
        } else if (action.equalsIgnoreCase("editarPer")) {
            request.setAttribute("idPer", request.getParameter("idPer"));
            acceso = editPer;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int idPer = Integer.parseInt(request.getParameter("txtidPer"));
            String dni = request.getParameter("txtDni");
            String nom = request.getParameter("txtNom");
            String telefono = request.getParameter("txtTelefono");
            String email = request.getParameter("txtEmail");
            String AreaTrabajo = request.getParameter("txtAreaTrabajo");
            String empresa = request.getParameter("txtEmpresa");
            String FotoUsua = request.getParameter("txtFotoUsua");
            persona.setIdPer(idPer);
            persona.setDni(dni);
            persona.setNom(nom);
            persona.setTelefono(telefono);
            persona.setEmail(email);
            persona.setAreaTrabajo(AreaTrabajo);
            persona.setEmpresa(empresa);
            persona.setFotoUsua(FotoUsua);
            personaDAO.editPer(persona);
            acceso = listarPer;
        } else if (action.equalsIgnoreCase("eliminarPer")) {
            int idPer = Integer.parseInt(request.getParameter("idPer"));
            persona.setIdPer(idPer);
            personaDAO.eliminarPer(idPer);
            acceso = listarPer;
        } else if (action.equalsIgnoreCase("Consultar")) {
            acceso = "vistas/consultaPer.jsp";
        } else if (action.equalsIgnoreCase("Buscar")) {
            String dni = request.getParameter("txtDni");
            Persona persona = personaDAO.buscarPorDni(dni);

            if (persona != null) {
                int idPersona = persona.getIdPer();
                RelacionesDAO relacionesDAO = new RelacionesDAO();
                List<Elementos> elementos = relacionesDAO.obtenerElementosPorPersona(idPersona);

                request.setAttribute("persona", persona);
                request.setAttribute("elementos", elementos);
                acceso = Buscar; // Redirige a la vista JSP
            } else {
                request.setAttribute("error", "Persona no encontrada");
                acceso = Buscar;
            }

        } else if (action.equalsIgnoreCase("buscarPersona")) {
            // Nueva funcionalidad para AJAX: Responder con datos separados por ";"
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            String dni = request.getParameter("txtDni");
            Persona personaEncontrada = personaDAO.buscarPorDni(dni); // Método que busca la persona

            PrintWriter out = response.getWriter();
            if (personaEncontrada != null) {
                out.print(personaEncontrada.getIdPer() + ";"
                        + personaEncontrada.getDni() + ";"
                        + personaEncontrada.getNom() + ";"
                        + personaEncontrada.getTelefono() + ";"
                        + personaEncontrada.getEmail() + ";"
                        + personaEncontrada.getAreaTrabajo() + ";"
                        + personaEncontrada.getEmpresa()
                );
            } else {
                out.print("Error;No se encontró la persona");
            }
            out.flush();
            return;
        }
        if (action.equalsIgnoreCase("addPer")) {
            String fotoUrl = request.getParameter("txtFotoUsua");

            // Si viene la URL de la imagen, enviarla a la vista
            if (fotoUrl != null && !fotoUrl.isEmpty()) {
                request.setAttribute("fotoUrl", fotoUrl);
            }

            acceso = addPer;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Se unifica el manejo en doGet()
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Personas";
    }
}

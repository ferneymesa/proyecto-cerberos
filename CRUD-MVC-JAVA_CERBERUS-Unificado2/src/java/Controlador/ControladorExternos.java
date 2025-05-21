package Controlador;

import Modelo.Externos;
import ModeloDAO.ExternosDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorExternos extends HttpServlet {

    String listarExt = "vistas/listarExt.jsp";
    String addExt = "vistas/addExt.jsp";
    String editExt = "vistas/editExt.jsp";
    String control = "vistas/control_1.jsp";

    Externos outers = new Externos();
    ExternosDAO outersDAO = new ExternosDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listarExt")) {
            acceso = listarExt;
        } else if (action.equalsIgnoreCase("addExt")) {
            acceso = addExt;
        } else if (action.equalsIgnoreCase("Agregar")) {            
            String documentoExt = request.getParameter("txtDocumentoExt");
            String nombreExt = request.getParameter("txtNombreExt");
            String telefonoExt = request.getParameter("txtTelefonoExt");
            String emailExt = request.getParameter("txtEmailExt");
            String cargoExt = request.getParameter("txtCargoExt");
            String empresaExt = request.getParameter("txtEmpresaExt");
            outers.setDocumentoExt(documentoExt);
            outers.setNombreExt(nombreExt);
            outers.setTelefonoExt(telefonoExt);
            outers.setEmailExt(emailExt);
            outers.setCargoExt(cargoExt);
            outers.setEmpresaExt(empresaExt);
            outersDAO.addExt(outers);
            acceso = listarExt;
        } else if (action.equalsIgnoreCase("editExt")) {
            request.setAttribute("idExt", request.getParameter("idExt"));
            acceso = editExt;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int idExt = Integer.parseInt(request.getParameter("txtIdExt"));
            String documentoExt = request.getParameter("txtDocumentoExt");
            String nombreExt = request.getParameter("txtNombreExt");
            String telefonoExt = request.getParameter("txtTelefonoExt");
            String emailExt = request.getParameter("txtEmailExt");
            String cargoExt = request.getParameter("txtCargoExt");
            String empresaExt = request.getParameter("txtEmpresaExt");
            outers.setIdExt(idExt);
            outers.setDocumentoExt(documentoExt);
            outers.setNombreExt(nombreExt);
            outers.setTelefonoExt(telefonoExt);
            outers.setEmailExt(emailExt);
            outers.setCargoExt(cargoExt);
            outers.setEmpresaExt(empresaExt);
            outersDAO.editExt(outers);
            acceso = listarExt;
        } else if (action.equalsIgnoreCase("eliminarExt")) {
            int idExt = Integer.parseInt(request.getParameter("idExt"));
            outers.setIdExt(idExt);
            outersDAO.eliminarExt(idExt);
            acceso = listarExt;
        } else if (action.equalsIgnoreCase("Consultar")) {
            acceso = "vistas/consultaExt.jsp"; 
        } else if (action.equalsIgnoreCase("Buscar")) {
            acceso = control ;
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
        return "Controlador de Externos";
    }
}

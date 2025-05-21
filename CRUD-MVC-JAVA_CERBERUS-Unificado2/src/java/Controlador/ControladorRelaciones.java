package Controlador;

import Modelo.Relaciones;
import ModeloDAO.RelacionesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorRelaciones extends HttpServlet {

    String asignar = "vistas/asignar.jsp";
    String addUnit = "agregarRelacion.jsp";
    String editUnit = "editarRelacion.jsp";
    String listarUnit = "editarRelacion.jsp";

    Relaciones unit = new Relaciones();
    RelacionesDAO unitDAO = new RelacionesDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorRelaciones</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorRelaciones at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "index.jsp"; // Página por defecto si `action` es null
        String action = request.getParameter("accion");

        if (action != null) {
            if (action.equalsIgnoreCase("listarUnit")) {
                acceso = listarUnit;
            } else if (action.equalsIgnoreCase("addUnit")) {
                acceso = addUnit;
            } else if (action.equalsIgnoreCase("editarUnit")) {
                request.setAttribute("idUnit", request.getParameter("idUnit"));
                acceso = editUnit;
            } else if (action.equalsIgnoreCase("Actualizar")) {
                int idUnit = Integer.parseInt(request.getParameter("txtIdUnit"));
                int idPerUnit = Integer.parseInt(request.getParameter("txtIdPerUnit"));
                int idItemUnit = Integer.parseInt(request.getParameter("txtIdItemUnit"));
                unit.setIdUnit(idUnit);
                unit.setIdPerUnit(idPerUnit);
                unit.setIdItemUnit(idItemUnit);
                unitDAO.editUnit(unit);
                acceso = listarUnit;
            } else if (action.equalsIgnoreCase("Consultar")) {
                acceso = "vistas/control.jsp";
            }
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("accion");
        System.out.println("Acción recibida: " + action); // Depuración

        if (action != null && action.equalsIgnoreCase("unificar")) {
            try {
                String idPerUnitStr = request.getParameter("txtIdPerUnit");
                String idItemUnitStr = request.getParameter("txtIdItemUnit");

                System.out.println("ID Persona: " + idPerUnitStr);
                System.out.println("ID Elemento: " + idItemUnitStr);

                if (idPerUnitStr == null || idItemUnitStr == null || idPerUnitStr.isEmpty() || idItemUnitStr.isEmpty()) {
                    out.write("error: Datos vacíos, no se puede unificar.");
                } else {
                    int idPerUnit = Integer.parseInt(idPerUnitStr);
                    int idItemUnit = Integer.parseInt(idItemUnitStr);

                    // Verificar si la relación ya existe antes de insertarla
                if (unitDAO.existeRelacion(idPerUnit, idItemUnit)) {
                    out.write("error: Registro duplicado.");
                } else {
                    unit.setIdPerUnit(idPerUnit);
                    unit.setIdItemUnit(idItemUnit);
                    boolean agregado = unitDAO.addUnit(unit);

                    if (agregado) {
                        out.write("success");
                    } else {
                        out.write("error: No se pudo agregar la relación.");
                    }
                }
            }
            } catch (NumberFormatException e) {
                out.write("error: Datos inválidos - " + e.getMessage());
            }
        } else {
            out.write("error: Acción no válida.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

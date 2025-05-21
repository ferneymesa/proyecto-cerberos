package Controlador;

import Modelo.Elementos;
import ModeloDAO.ElementosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorElementos extends HttpServlet {

    String listarItem = "vistas/listarItem.jsp";
    String addItem = "vistas/addItem.jsp";
    String editItem = "vistas/editItem.jsp";

    Elementos items = new Elementos();
    ElementosDAO itemsDAO = new ElementosDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listarItem")) {
            acceso = listarItem;
        } else if (action.equalsIgnoreCase("addItem")) {
            acceso = addItem;
        } else if (action.equalsIgnoreCase("Agregar")) {            
            String serialElemento = request.getParameter("txtSerialElemento");
            String placa = request.getParameter("txtPlaca");
            String nombreElemento = request.getParameter("txtNombreElemento");
            String modelo = request.getParameter("txtModelo");
            String situacionElemento = request.getParameter("txtSituacionElemento");
            String fotoElemento = request.getParameter("txtFotoElemento");
            items.setSerialElemento(serialElemento);
            items.setPlaca(placa);
            items.setNombreElemento(nombreElemento);
            items.setModelo(modelo);
            items.setSituacionElemento(situacionElemento);
            items.setFotoElemento(fotoElemento);
            itemsDAO.addItem(items);
            acceso = listarItem;
        } else if (action.equalsIgnoreCase("editarItem")) {
            request.setAttribute("idItems", request.getParameter("idItem"));
            acceso = editItem;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int idItem = Integer.parseInt(request.getParameter("txtIdItems"));
            String serialElemento = request.getParameter("txtSerialElemento");
            String placa = request.getParameter("txtPlaca");
            String nombreElemento = request.getParameter("txtNombreElemento");
            String modelo = request.getParameter("txtModelo");
            String situacionElemento = request.getParameter("txtSituacionElemento");
            String fotoElemento = request.getParameter("txtFotoElemento");
            items.setIdItem(idItem);
            items.setSerialElemento(serialElemento);
            items.setPlaca(placa);
            items.setNombreElemento(nombreElemento);
            items.setModelo(modelo);
            items.setSituacionElemento(situacionElemento);
            items.setFotoElemento(fotoElemento);
            itemsDAO.editItem(items);
            acceso = listarItem;
        } else if (action.equalsIgnoreCase("eliminarItem")) {
            int idItem = Integer.parseInt(request.getParameter("idItem"));
            items.setIdItem(idItem);
            itemsDAO.eliminarItem(idItem);
            acceso = listarItem;
        } else if (action.equalsIgnoreCase("Consultar")) {
            acceso = "vistas/consultaItem.jsp"; 
        } else if (action.equalsIgnoreCase("asignar")) {
            acceso = "vistas/asignar.jsp";
        } else if (action.equalsIgnoreCase("Buscar")) {
            acceso = "vistas/asignar.jsp";
        } else if (action.equalsIgnoreCase("buscarElemento")) {
            // Nueva funcionalidad para AJAX
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            String serial = request.getParameter("txtSerialElemento");
            Elementos elemento = itemsDAO.buscarPorSerial(serial); // Método que busca el elemento

            PrintWriter out = response.getWriter();
            if (elemento != null) {
                out.print(elemento.getIdItem() + ";" +
                          elemento.getSerialElemento() + ";" +
                          elemento.getPlaca() + ";" +
                          elemento.getNombreElemento() + ";" +
                          elemento.getModelo() + ";" +
                          elemento.getSituacionElemento());
            } else {
                out.print("Error;No se encontró el elemento");
            }
            out.flush();
            return;
        }if (action.equalsIgnoreCase("addPer")) {
            String fotoUrl = request.getParameter("txtFotoElemento");

            // Si viene la URL de la imagen, enviarla a la vista
            if (fotoUrl != null && !fotoUrl.isEmpty()) {
                request.setAttribute("fotoUrl", fotoUrl);
            }

            acceso = addItem;
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
        return "Controlador de Elementos";
    }
}

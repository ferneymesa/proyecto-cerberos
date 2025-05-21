<%@page import="Modelo.Trabajador" %>
<%@page import="ModeloDAO.TrabajadorDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Empleados</title>
    </head>

    <body>
        <main>
            <div>
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <var>
                <%
                    Trabajador usuario = (Trabajador) session.getAttribute("usuario");
                %>
                <var class="tablaBienvenida">
                    <p>Personal en Turno</p>
                    <div>
                        <p>Nombre:</p>
                        <label><%= usuario.getNombreRH()%></label>
                    </div>
                    <div>
                        <p>Documento:</p>
                        <label><%= usuario.getDocumentoRH()%></label>  
                    </div>
                </var>
            </var>
            <div class="botonera">   
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorTrabajador?accion=listarRH">Ir a Lista de Empleados</a>
                <a href="ControladorTrabajador?accion=addRH">Ir a Agregar Nuevo Empleado</a>
            </div> 
            <h1>CONSULTA DE EMPLEADOS POR CÉDULA</h1>
            <form class="btn-Buscar" action="ControladorTrabajador" method="get">
                <label class="labelBuscar" for="txtDocumentoRH">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDocumentoRH" id="txtDocumentoRH" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                String documentoRH = request.getParameter("txtDocumentoRH");
                if (documentoRH != null && !documentoRH.isEmpty()) {
                    TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
                    Trabajador trabajador = trabajadorDAO.buscarPorDocumentoRH(documentoRH);

                    if (trabajador != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <div class="tabla-Busqueda">   
                <table class="tabla2" border="1">
                    <tr>
                        <th>ID</th>
                        <td><%= trabajador.getIdRH()%></td>         
                    </tr>
                    <tr>
                        <th>DOCUMENTO EMPLEADO</th>
                        <td><%= trabajador.getDocumentoRH()%></td>

                    </tr>
                    <tr>
                        <th>NOMBRE EMPLEADO</th>
                        <td><%= trabajador.getNombreRH()%></td>
                    </tr>
                    <tr>
                        <th>TELEFONO EMPLEADO</th>
                        <td><%= trabajador.getTelefonoRH()%></td>
                    </tr>
                    <tr>
                        <th>ACCIONES</th>
                        <td>
                            <div class="botones-acciones">
                                <a class="btn-editar" href="ControladorTrabajador?accion=editar&idRH=<%= trabajador.getIdRH()%>"> Editar </a>
                                <a class="btn-remover" href="ControladorTrabajador?accion=eliminar&idRH=<%= trabajador.getIdRH()%>">Remover</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <%
                } else {
                %>
                <p class="NoText">No se encontraron resultados para el Documento: <%= documentoRH%>.</p>
                <%
                        }
                    }
                %>
        </main>
    </body>
</html>

<%@page import="Modelo.Externos" %>
<%@page import="ModeloDAO.ExternosDAO" %>
<%@page import="Modelo.Trabajador" %>
<%@page import="ModeloDAO.TrabajadorDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Personal Externo</title>
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
                <a href="ControladorExternos?accion=listarExt">Ir a Lista de Personal Externo</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="ControladorExternos?accion=addExt" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Ir a Agregar Nuevo Personal Externo</a>
            </div> 
            <h1>CONSULTA DE PERSONAL EXTERNO POR CÉDULA</h1>
            <form class="btn-Buscar" action="ControladorExternos" method="get">
                <label class="labelBuscar" for="txtDocumentoExt">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDocumentoExt" id="txtDocumentoExt" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                String documentoExt = request.getParameter("txtDocumentoExt");
                if (documentoExt != null && !documentoExt.isEmpty()) {
                    ExternosDAO externosDAO = new ExternosDAO();
                    Externos externos = externosDAO.buscarPorDocumento(documentoExt);

                    if (externos != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <div class="tabla-Busqueda">      
                <table class="tabla2" border="1">
                    <tr>
                        <th>ID</th>
                        <td><%= externos.getIdExt()%></td>
                    </tr>
                    <tr>
                        <th>DOCUMENTO</th>
                        <td><%= externos.getDocumentoExt()%></td>
                    </tr>
                    <tr>
                        <th>NOMBRE</th>
                        <td><%= externos.getNombreExt()%></td>
                    </tr>
                    <tr>
                        <th>TELEFONO</th>
                        <td><%= externos.getTelefonoExt()%></td>
                    </tr>
                    <tr>
                        <th>CORREO ELECTRONICO</th>
                        <td><%= externos.getEmailExt()%></td>
                    </tr>
                    <tr>
                        <th>AREA DE TRABAJO</th>
                        <td><%= externos.getCargoExt()%></td>
                    </tr>
                    <tr>
                        <th>EMPRESA</th>
                        <td><%= externos.getEmpresaExt()%></td>
                    </tr>
                    <tr <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                        <th>ACCIONES</th>
                        <td>
                            <div class="botones-acciones">
                                <a class="btn-editar" href="ControladorExternos?accion=editExt&idExt=<%= externos.getIdExt()%>"> Editar </a>
                                <a class="btn-remover" href="ControladorExternos?accion=eliminarExt&idExt=<%= externos.getIdExt()%>">Remover</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <%
                } else {
                %>
            </div>
            <p class="NoText">No se encontraron resultados para el Documento: <%= documentoExt%> en Personal Externo.</p>
            <%
                    }
                }
            %>
        </main>
    </body>
</html>

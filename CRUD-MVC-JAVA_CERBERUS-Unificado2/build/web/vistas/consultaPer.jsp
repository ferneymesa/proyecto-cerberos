<%-- Document : consulta Created on : 24/11/2024, 2:59:34 p. m. Author : Usuario --%>

<%@page import="Modelo.Persona" %>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.PersonaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Persona</title>
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
                <a href="Controlador?accion=listarPer">Ir a Lista de Personas</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="Controlador?accion=addPer" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Ir a Agregar Nueva Persona</a>
            </div> 
            <h1>CONSULTA DE PERSONA POR CÉDULA</h1>
            <form class="btn-Buscar" action="Controlador" method="get">
                <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                // Verificar si se ha enviado el DNI para buscar
                String dniBuscado = request.getParameter("txtDni");
                if (dniBuscado != null && !dniBuscado.isEmpty()) {
                    PersonaDAO personaDAO = new PersonaDAO();
                    Persona persona = personaDAO.buscarPorDni(dniBuscado);
                    if (persona != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <div class="tabla-Busqueda">
                <table class="tabla" border="1">
                    <tr>
                        <th>ID</th>
                        <td><%= persona.getIdPer()%></td>
                    </tr>
                    <tr>
                        <th>DOCUMENTO</th>
                        <td><%= persona.getDni()%></td>
                    </tr>
                    <tr>
                        <th>NOMBRE</th>
                        <td><%= persona.getNom()%></td>
                    </tr>
                    <tr>
                        <th>TELEFONO</th>
                        <td><%= persona.getTelefono()%></td>
                    </tr>
                    <tr>
                        <th>CORREO ELECTRONICO</th>
                        <td><%= persona.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>AREA DE TRABAJO</th>
                        <td><%= persona.getAreaTrabajo()%></td>
                    </tr>
                    <tr>
                        <th>EMPRESA</th>
                        <td><%= persona.getEmpresa()%></td>
                    </tr>
                    <tr>
                        <th>URL FOTO USUARIO</th>
                        <td><%= persona.getFotoUsua()%></td>
                    </tr>
                    <tr <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                        <th>ACCIONES</th>
                        <td class="tdAccion">
                            <div class="botones-acciones">
                                <a class="btn-editar" href="Controlador?accion=editarPer&idPer=<%= persona.getIdPer()%>">Editar</a>
                                <a class="btn-remover" href="Controlador?accion=eliminarPer&idPer=<%= persona.getIdPer()%>">Remover</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- Mostrar la imagen -->
                <%
                    String urlFoto = persona.getFotoUsua(); // Asignar la URL de la foto a la variable
                    // Verifica si la URL es null o está vacía
                    if (urlFoto == null || urlFoto.isEmpty()) {
                %>
                <var class="contenedor-Img">
                    <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                    <p class="texto-ImgNull">No hay foto disponible.</p>
                </var>
                <%
                } else {
                %>
                <var class="contenedor-Img">
                    <img src="<%= urlFoto%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
                </var>
                <%
                    }
                } else {
                %>
            </div>
                <p class="NoText">No se encontraron resultados para el Documento N°  <%= dniBuscado%>.</p>
            <%
                    }
                }
            %>
        </main>
    </body>
</html>
<%-- Document : consulta Created on : 24/11/2024, 2:59:34 p. m. Author : Usuario --%>

<%@page import="Modelo.Elementos" %>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Elementos</title>
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
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="ControladorElementos?accion=addItem" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Ir a Agregar Nuevo Elemento</a>
            </div> 
            <h1>CONSULTA DE ELEMENTOS POR SERIAL</h1>
            <form class="btn-Buscar" action="ControladorElementos" method="get">
                <label class="labelBuscar" for="txtSerialElemento">Ingrese el Serial:</label>
                <input class="inputText" type="text" name="txtSerialElemento" id="txtSerialElemento" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                // Verificar si se ha enviado el DNI para buscar
                String SerialBuscado = request.getParameter("txtSerialElemento");
                if (SerialBuscado != null && !SerialBuscado.isEmpty()) {
                    ElementosDAO elementosDAO = new ElementosDAO();
                    Elementos items = elementosDAO.buscarPorSerial(SerialBuscado);
                    if (items != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <div class="tabla-Busqueda">      
                <table class="tabla" border="1">
                    <tr>
                        <th>ID</th>
                        <td><%= items.getIdItem()%></td>
                    </tr>
                    <tr>
                        <th>SERIAL DEL ELEMENTO</th>
                        <td><%= items.getSerialElemento()%></td>
                    </tr>
                    <tr>
                        <th>PLACA DEL ELEMENTO</th>
                        <td><%= items.getPlaca()%></td>
                    </tr>
                    <tr>
                        <th>NOMBRE DE ELEMENTO</th>
                        <td><%= items.getNombreElemento()%></td>
                    </tr>
                    <tr>
                        <th>MODELO DEL ELEMENTO</th>
                        <td><%= items.getModelo()%></td>
                    </tr>
                    <tr>
                        <th>SITUACION ELEMENTO</th>
                        <td><%= items.getSituacionElemento()%></td>
                    </tr>
                    <tr class="tdurl">
                        <th>URL FOTO ELEMENTO</th>
                        <td ><%= items.getFotoElemento()%></td>
                    </tr>
                    <tr <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                        <th>ACCIONES</th>
                        <td>
                            <div class="botones-acciones">
                                <a class="btn-editar" href="ControladorElementos?accion=editarItem&idItem=<%= items.getIdItem()%>"> Editar </a>
                                <a class="btn-remover" href="ControladorElementos?accion=eliminarItem&idItem=<%= items.getIdItem()%>">Remover</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- Mostrar la imagen -->
                <%
                    String urlFotoElemento = items.getFotoElemento(); // Asignar la URL de la foto a la variable
                    // Verifica si la URL es null o está vacía
                    if (urlFotoElemento == null || urlFotoElemento.isEmpty()) {
                %>
                <var class="contenedor-Img">
                    <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                    <p class="texto-ImgNull">No hay foto disponible.</p>
                </var>
                <%
                } else {
                %>
                <var class="contenedor-Img">
                    <img src="<%= urlFotoElemento%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
                </var>
                <%
                    }
                } else {
                %>
            </div>
            <p class="NoText">No se encontraron resultados para el Serial: <%= SerialBuscado%>.</p>
            <%
                    }
                }
            %>
        </main>
    </body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Modelo.Trabajador"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Subir Imagen a Imgur</title>
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
            <var class="botonera">
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="Controlador?accion=listarPer">Ir a Lista de Personas</a>
                <a href="ControladorImg?accion=subirImg">Limpiar</a>
            </var>

            <var>
                <h1>Subir Imagen a Imgur</h2>
            </var>

            <!-- Formulario para subir imágenes a Imgur -->
            <form class="subirImg" action="${pageContext.request.contextPath}/ControladorImg" method="POST" enctype="multipart/form-data">
                <label for="image">Seleccionar imagen:</label>
                <input type="file" name="image" id="image" required>
                <button type="submit">Subir Imagen</button>
            </form>

            <%-- Obtener la URL de la imagen --%>
            <%
                String imageUrl = (String) request.getAttribute("imageUrl");
                if (imageUrl == null) {
                    imageUrl = "";
                }
            %>
            <!-- Si hay una imagen subida, mostrarla junto con su enlace -->
            <% if (!imageUrl.isEmpty()) {%>

            <h3>Imagen Subida:</h3>
            <img src="<%= imageUrl%>" alt="Imagen subida" width="300">
            <p><a href="<%= imageUrl%>" target="_blank">Ver en Imgur</a></p>
            <p>URL de la imagen: <%= imageUrl%></p>

            <var class="cambiarPg">
            <!-- Botón para redirigir a addPer.jsp con la URL de la imagen -->
            <form action="Controlador" method="GET">
                <input type="hidden" name="accion" value="addPer">
                <input type="hidden" name="txtFotoUsua" value="<%= imageUrl%>">
                <button type="submit">Ir a Agregar Personal</button>
            </form>

            <!-- Botonera con enlaces a otras páginas -->
            <form action="ControladorElementos" method="GET">
                <input type="hidden" name="accion" value="addItem">
                <input type="hidden" name="txtFotoElemento" value="<%= imageUrl%>">
                <button type="submit">Ir a Agregar Elementos</button>
            </form>
            <% }%>
            </var>
        </main>
    </body>
</html>
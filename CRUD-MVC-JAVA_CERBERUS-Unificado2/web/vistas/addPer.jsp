<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Personal</title>
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
                <a href="Controlador?accion=listarPer">Ir a Lista de Personas</a>
                <a href="Controlador?accion=Consultar">Ir a Consultar por Cédula</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="ControladorImg?accion=subirImg">Agregar Imagen</a>
            </var>
            <div>
                <var>
                    <h1>AGREGAR PERSONAL</h1>
                    <form action="Controlador">
                </var > 

                <div class="class-ModificarDiv"> 
                    <var class="class-ModificarVar">
                        <p>Documento:</p>
                        <input type="text" name="txtDni">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Nombre:</p>
                        <input type="text" name="txtNom">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Teléfono:</p>
                        <input type="text" name="txtTelefono"> 
                    </var>
                    <var class="class-ModificarVar">
                        <p>Correo Electrónico:</p>
                        <input type="text" name="txtEmail">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Área de Trabajo:</p>
                        <input type="text" name="txtAreaTrabajo">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Empresa:</p>
                        <input type="text" name="txtEmpresa" value="SENA">
                    </var>
                    <%
                        String fotoUrl = request.getParameter("txtFotoUsua");
                        if (fotoUrl == null) {
                            fotoUrl = ""; // Si no hay URL, dejar el campo vacío
                        }
                    %>

                    <var class="class-ModificarVar">
                        <p>URL Foto Usuario:</p>
                        <input type="text" name="txtFotoUsua" value="<%= fotoUrl%>">
                    </var>

                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                    </var>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>

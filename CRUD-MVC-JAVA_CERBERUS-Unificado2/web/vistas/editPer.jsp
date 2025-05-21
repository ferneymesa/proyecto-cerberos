<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Persona"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Editar Personal interno</title>
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
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="Controlador?accion=listarPer">Regresar</a>
            </var>
            <div>
                <var>
                    <%
                        PersonaDAO personaDAO = new PersonaDAO();
                        int idPer = Integer.parseInt((String) request.getAttribute("idPer"));
                        Persona persona = (Persona) personaDAO.listPer(idPer);
                    %>
                    <h1>MODIFICAR PERSONAL</h1>
                    <form action="Controlador">
                </var>
                <div class="class-ModificarDiv"> 
                    <input type="hidden" name="txtidPer" value="<%= persona.getIdPer()%>">
                    <var class="class-ModificarVar">
                        <p>Documento:</p>
                        <input type="text" name="txtDni" value="<%= persona.getDni()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Nombre:</p>
                        <input type="text" name="txtNom" value="<%= persona.getNom()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Teléfono:</p>
                        <input type="text" name="txtTelefono" value="<%= persona.getTelefono()%>"> <br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Correo Electrónico:</p>
                        <input type="text" name="txtEmail" value="<%= persona.getEmail()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Área de Trabajo:</p>
                        <input type="text" name="txtAreaTrabajo" value="<%= persona.getAreaTrabajo()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Empresa:</p>
                        <input type="text" name="txtEmpresa" value="<%= (persona.getEmpresa() != null && !persona.getEmpresa().isEmpty()) ? persona.getEmpresa() : "SENA"%>"<br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>URL Foto Usuario:</p>
                        <input type="text" name="txtFotoUsua" value="<%= persona.getFotoUsua()%>"><br>
                    </var>

                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Actualizar"><br>  
                    </var>
                </div>
                </form>
            </div>
        </main>
    </body>
</html>

<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Externos" %>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.ExternosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Personal Externo</title>
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
                <a href="ControladorExternos?accion=Buscar">Ir a Control de Procesos</a>
                <a href="ControladorExternos?accion=listarExt">Lista de personal Externos</a>
            </var>
            <div>
                <var>
                    <h1 class="h1-add">AGREGAR PERSONAL EXTERNO</h1>
                    <form action="ControladorExternos">
                </var > 
                <div class="class-ModificarDiv"> 
                        <%
                            String documentoRecibido = request.getParameter("txtDocumentoExt");
                        %>
                        <var class="class-ModificarVar">
                            <p>Documento:</p>
                            <input type="text" name="txtDocumentoExt" value="<%= (documentoRecibido != null) ? documentoRecibido : ""%>">
                        </var>
                        <var class="class-ModificarVar">
                            <p>Nombre:</p>
                            <input type="text" name="txtNombreExt">
                        </var>
                        <var class="class-ModificarVar">
                            <p>Teléfono:</p>
                            <input type="text" name="txtTelefonoExt"> 
                        </var>
                        <var class="class-ModificarVar">
                            <p>Correo Electrónico:</p>
                            <input type="text" name="txtEmailExt">
                        </var>
                        <var class="class-ModificarVar">
                            <p>Área de Trabajo:</p>
                            <input type="text" name="txtCargoExt">
                        </var>
                        <var class="class-ModificarVar">
                            <p>Empresa:</p>
                            <input type="text" name="txtEmpresaExt" >
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

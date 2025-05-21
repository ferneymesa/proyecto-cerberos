<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.TrabajadorDAO"%>
<%@page import="Modelo.Externos"%>
<%@page import="ModeloDAO.ExternosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Modificar personal Externo</title>
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
                <a href="ControladorTrabajador?accion=listarRH">Regresar</a>
            </var>
            <div>
                <var>
                    <%
                        ExternosDAO externosDAO = new ExternosDAO();
                        int idExt = Integer.parseInt((String) request.getAttribute("idExt"));
                        Externos externos = (Externos) externosDAO.listExt(idExt);
                    %>
                    <h1 class="h1-add">MODIFICAR PERSONAL EXTERNO</h1>
                    <form action="ControladorExternos">
                </var>
                <div class="class-ModificarDiv"> 
                    <input type="hidden" name="txtIdExt" value="<%= externos.getIdExt()%>">
                    <var class="class-ModificarVar">
                        <p>Documento:</p>
                        <input type="text" name="txtDocumentoExt" value="<%= externos.getDocumentoExt()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Nombre Personal Externo:</p>
                        <input type="text" name="txtNombreExt" value="<%= externos.getNombreExt()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Telefono Personal Externo:</p>
                        <input type="text" name="txtTelefonoExt" value="<%= externos.getTelefonoExt()%>"> <br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Correo Electrónico:</p>
                        <input type="text" name="txtEmailExt" value="<%= externos.getEmailExt()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Área de Trabajo:</p>
                        <input type="text" name="txtCargoExt" value="<%= externos.getCargoExt()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Empresa:</p>
                        <input type="text" name="txtEmpresaExt" value="<%= externos.getEmpresaExt()%>"> <br>
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

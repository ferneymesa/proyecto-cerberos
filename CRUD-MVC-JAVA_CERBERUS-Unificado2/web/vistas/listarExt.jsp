<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Externos"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.ExternosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Lista Personal Externo</title>
    </head>
    <body >
        <main >
            <div class="logos">
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
                <a href="ControladorExternos?accion=addExt">Agregar Nuevo Externo</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="ControladorExternos?accion=consultar">Ir consulta Externos por Documento</a>
            </div> 
            <h1>LISTA DE PERSONAL EXTERNO</h1>
            <div class="tabla-responsive">
                <table class="tablaItem" border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DOCUMENTO</th>
                            <th>NOMBRE</th>
                            <th>TELEFONO</th>
                            <th>CORREO ELECTRONICO</th>
                            <th>AREA DE TRABAJO</th>
                            <th>EMPRESA</th>
                            <th <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        ExternosDAO dao = new ExternosDAO();
                        List<Externos> list = dao.listarExt();
                        Iterator<Externos> iter = list.iterator();
                        Externos per = null;
                        while (iter.hasNext()) {
                            per = iter.next();
                    %>
                    <tbody>
                        <tr>
                            <td><%= per.getIdExt()%></td>
                            <td><%= per.getDocumentoExt()%></td>
                            <td><%= per.getNombreExt()%></td>
                            <td><%= per.getTelefonoExt()%></td>
                            <td><%= per.getEmailExt()%></td>
                            <td><%= per.getCargoExt()%></td>
                            <td><%= per.getEmpresaExt()%></td>
                            <td <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                                <a href="ControladorExternos?accion=editExt&idExt=<%= per.getIdExt()%>"> Editar </a>
                                <a href="ControladorExternos?accion=eliminarExt&idExt=<%= per.getIdExt()%>">Remover</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>

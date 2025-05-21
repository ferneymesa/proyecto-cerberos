<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Trabajador"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>LISTA DE PERSONAL</title>
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
                <a href="Controlador?accion=addPer"
                   <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Nuevo</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="Controlador?accion=Consultar">Ir a Consultar por Cédula</a>
            </div> 
            <h1 class=>LISTA DE PERSONAS</h1>
            <div class="tabla-responsive">
                <table class="tablaPersonas" border="1">
                    <thead>
                        <tr>
                            <th class="th1">ID</th>
                            <th class="th2">DOCUMENTO</th>
                            <th class="th3">NOMBRE</th>
                            <th class="th4">TELEFONO</th>
                            <th class="th5">CORREO ELECTRONICO</th>
                            <th class="th6">AREA DE TRABAJO</th>
                            <th class="th7">EMPRESA</th>
                            <th class="th8">URL FOTO USUARIO</th>
                            <th class="th9" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        PersonaDAO dao = new PersonaDAO();
                        List<Persona> list = dao.listarPer();
                        Iterator<Persona> iter = list.iterator();
                        Persona per = null;
                        while (iter.hasNext()) {
                            per = iter.next();
                    %>
                    <tbody>
                        <tr>
                            <td class="td1"><%= per.getIdPer()%></td>
                            <td class="td2"><%= per.getDni()%></td>
                            <td class="td3"><%= per.getNom()%></td>
                            <td class="td4"><%= per.getTelefono()%></td>
                            <td class="td5"><%= per.getEmail()%></td>
                            <td class="td6"><%= per.getAreaTrabajo()%></td>
                            <td class="td7"><%= per.getEmpresa()%></td>
                            <td class="td8"><%= per.getFotoUsua()%></td>
                            <td class="td9" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                                <a href="Controlador?accion=editarPer&idPer=<%= per.getIdPer()%>"> Editar </a>
                                <a href="Controlador?accion=eliminarPer&idPer=<%= per.getIdPer()%>">Remover</a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>

  
<%@page import="Modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos2.css" rel="stylesheet" type="text/css"/>
        <title>CERBERUS</title>

    </head>
    <body>
        <main>
            <%
                Trabajador usuario = (Trabajador) session.getAttribute("usuario");
                if (usuario == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
            %>
            <h1>Bienvenido</h1>
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
            <div class="botones" >
                <div class="classListas">
                    <h3 class="tituloLista">Listas</h3>
                    <ul class="listaMenu">
                        <li><a href="Controlador?accion=listarPer">Lista de Personas</a></li>
                        <li><a href="ControladorElementos?accion=listarItem">Lista de Elementos</a></li>
                        <li><a href="ControladorTrabajador?accion=listarRH">Lista de Empleados</a></li>
                        <li><a href="ControladorExternos?accion=listarExt">Lista de Personal Externo</a></li>
                    </ul>
                </div>
                <div class="classListas">
                    <h3 class="tituloLista">Busquedas</h3>
                    <ul class="listaMenu">
                        <li><a href="Controlador?accion=Consultar">Buscar Persona por Cédula</a> </li>
                        <li><a href="ControladorElementos?accion=Consultar">Buscar Elementos por Serial</a></li>
                        <li><a href="ControladorTrabajador?accion=Consultar">Buscar Empleado por Cédula</a></li>
                        <li><a href="ControladorExternos?accion=Consultar">Buscar Persona Externa por Cédula</a></li>
                    </ul>
                </div>
                <div class="classListas">
                    <h3 class="tituloLista">procesos</h3>
                    <ul class="listaMenu">
                        <li><a href="ControladorRegistros?accion=Control_1">Control de procesos</a></li>
                        <li><a href="Controlador?accion=addPer"<%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Nuevo Usuario</a></li>
                        <li><a href="ControladorElementos?accion=addItem"<%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Nuevo Elemento</a></li>
                        <li><a href="ControladorTrabajador?accion=addRH"<%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Nuevo Trabajador</a></li>
                    </ul>
                </div> 
                <div class="classListas">
                    <h3 class="tituloLista">Otros...</h3>
                    <ul class="listaMenu">
                        <li><a href="ControladorElementos?accion=asignar"<%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Asignar Elementos</a></li>
                        <li><a href="ControladorImg?accion=subirImg"<%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Subir Imagenes</a></li>
                        <li><a href="ControladorRegistros?accion=listarRegistros">Lista de Registros </a></li>
                    </ul>
                </div> 
                <div class="classListas" >
                    <h3 class="tituloLista" >
                    <a href="ControladorTrabajador?accion=logout">Cerrar Sesión</a></h3>
                </div>
            </div>
            <div>
                <img class="logoImg" src="./IMAGENES/cerberus.png" alt="logo Cerberus"/>
            </div>
        </main>
    </body>
</html>

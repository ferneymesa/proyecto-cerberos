<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Elementos"%>
<%@page import="ModeloDAO.ElementosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Elementos</title>
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
                <a href="ControladorElementos?accion=addItem"
                   <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Nuevo Elemento</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
                <a href="ControladorElementos?accion=Consultar">Ir a Consultar Elemento por Serial</a>
            </div> 

            <h1>LISTA DE ELEMENTOS</h1>
            <div class="tabla-responsive">
                <table class="tablaItem" border="1">
                    <thead>
                        <tr>
                            <th class="th1">ID</th>
                            <th class="th2">SERIAL DEL ELEMENTO</th>
                            <th class="th3">PLACA DEL ELEMENTO</th>
                            <th class="th4">NOMBRE DE ELEMENTO</th>
                            <th class="th5">MODELO DEL ELEMENTO</th>
                            <th class="th6">SITUACION ELEMENTO</th>
                            <th class="th7">URL FOTO ELEMENTO</th>
                            <th class="th8" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        ElementosDAO dao = new ElementosDAO();
                        List<Elementos> list = dao.listarItem();
                        Iterator<Elementos> iter = list.iterator();
                        Elementos per = null;
                        while (iter.hasNext()) {
                            per = iter.next();
                    %>
                    <tbody>
                        <tr>
                            <td class="td1"><%= per.getIdItem()%></td>
                            <td class="td2"><%= per.getSerialElemento()%></td>
                            <td class="td3"><%= per.getPlaca()%></td>
                            <td class="td4"><%= per.getNombreElemento()%></td>
                            <td class="td5"><%= per.getModelo()%></td>
                            <td class="td6"><%= per.getSituacionElemento()%></td>
                            <td class="td7"><%= per.getFotoElemento()%></td>
                            <td class="td8" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>
                                <a href="ControladorElementos?accion=editarItem&idItem=<%= per.getIdItem()%>"> Editar </a>
                                <a href="ControladorElementos?accion=eliminarItem&idItem=<%= per.getIdItem()%>">Remover</a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

        </main>
    </body>
</html>

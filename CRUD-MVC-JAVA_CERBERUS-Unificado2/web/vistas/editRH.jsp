<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.TrabajadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Empleados</title>
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
                        TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
                        int idRH = Integer.parseInt((String) request.getAttribute("idTrabajadorRH"));
                        Trabajador trabajador = (Trabajador) trabajadorDAO.listRH(idRH);
                    %>
                    <h1>MODIFICAR EMPLEADOS</h1>
                    <form action="ControladorTrabajador">
                </var>
                <div class="class-ModificarDiv"> 
                    <input type="hidden" name="txtIdRH" value="<%= trabajador.getIdRH()%>">
                    <var class="class-ModificarVar">
                        <p>Documento Empleado:</p>
                        <input type="text" name="txtDocumentoRH" value="<%= trabajador.getDocumentoRH()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Nombre Del Empleado:</p>
                        <input type="text" name="txtNombreRH" value="<%= trabajador.getNombreRH()%>"><br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Telefono del Empleado:</p>
                        <input type="text" name="txtTelefonoRH" value="<%= trabajador.getTelefonoRH()%>"> <br>
                    </var>
                    <var class="class-ModificarVar">
                        <p>Categoria:</p>
                        <input type="text" name="txtCategoria" value="<%= trabajador.getCategoria()%>"> <br>
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

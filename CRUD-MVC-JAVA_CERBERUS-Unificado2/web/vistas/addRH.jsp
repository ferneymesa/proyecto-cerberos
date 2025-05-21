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
        <title>Agregar Empleados</title>
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
                <a href="ControladorTrabajador?accion=listarRH">Ir a Lista de Empleados</a>
                <a href="ControladorTrabajador?accion=Consultar">Ir a Consultar por Cédula de Empleado</a>
            </var>
            <div>
                <var>
                    <h1>AGREGAR EMPLEADO</h1>
                    <form action="ControladorTrabajador">
                </var > 
                <div class="class-ModificarDiv"> 
                    <var class="class-ModificarVar">
                        <p>Documento Empleado:</p>
                        <input type="text" name="txtDocumentoRH">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Nombre Del Empleado:</p>
                        <input type="text" name="txtNombreRH">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Telefono del Empleado:</p>
                        <input type="text" name="txtTelefonoRH"> 
                    </var>
                    <var class="class-ModificarVar">
                        <p>Categoría:</p>
                        <select name="txtCategoria">
                            <option value="Admin">Admin</option>
                            <option value="Empleado">Empleado</option>
                        </select>
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

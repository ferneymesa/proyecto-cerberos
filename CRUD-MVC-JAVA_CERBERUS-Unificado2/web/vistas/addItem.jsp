<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Elementos" %>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>

        <title>Agregar Elementos</title>

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
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="ControladorElementos?accion=Consultar">Ir a Consultar por Serial</a>
                <a href="ControladorImg?accion=subirImg">Agregar Imagen</a>
            </var>
            <div>
                <var class="var-add">
                    <h1 class="h1-add">AGREGAR ELEMENTOS</h1>
                    <form action="ControladorElementos">
                </var > 

                <div class="class-ModificarDiv"> 
                    <var class="class-ModificarVar">
                        <p> Serial del Elemento: </p>
                        <input type="text" name="txtSerialElemento">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Placa Interna: </p>
                        <input type="text" name="txtPlaca">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Tipo de Elemento: </p>
                        <input type="text" name="txtNombreElemento"> 
                    </var>
                    <var class="class-ModificarVar">
                        <p>Marca o Modelo: </p>
                        <input type="text" name="txtModelo">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Estado del Elemento: </p>
                        <input type="text" name="txtSituacionElemento">
                    </var>

                    <%
                        String fotoUrl = request.getParameter("txtFotoElemento");
                        if (fotoUrl == null) {
                            fotoUrl = ""; // Si no hay URL, dejar el campo vacío
                        }
                    %>

                    <var class="class-ModificarVar">
                        <p>URL Foto del Elemento: </p>
                        <input type="text" name="txtFotoElemento" value="<%= fotoUrl%>">
                    </var>
                    <br>
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                    </var>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>

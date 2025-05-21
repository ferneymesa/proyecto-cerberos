<%@page import="Modelo.Elementos"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.ElementosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Elementos</title>

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
                <a href="ControladorElementos?accion=listarItem">Regresar a lista de Elementos</a>
            </var>
            <div>
                <var>
                    <%
                        ElementosDAO elementosDAO = new ElementosDAO();
                        Object idObj = request.getAttribute("idItems");
                        int id = idObj != null ? Integer.parseInt(idObj.toString()) : 0;
                        Elementos items = elementosDAO.listItem(id);
                        if (items == null) {
                            items = new Elementos(); // Evitar errores si no se encuentra el elemento
                        }
                    %>
                    <h1>MODIFICAR ELEMENTOS</h1>
                    <form action="ControladorElementos">
                </var>
                <div class="class-ModificarDiv"> 
                    <input type="hidden" name="txtIdItems" value="<%= items.getIdItem()%>">
                    <var class="class-ModificarVar">
                        <p>Serial del Elemento:</p>
                        <input type="text" name="txtSerialElemento" value="<%= items.getSerialElemento()%>">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Placa Interna:</p>
                        <input type="text" name="txtPlaca" value="<%= items.getPlaca()%>">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Tipo de Elemento:</p>
                        <input type="text" name="txtNombreElemento" value="<%= items.getNombreElemento()%>">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Marca o Modelo:</p>
                        <input type="text" name="txtModelo" value="<%= items.getModelo()%>">
                    </var>
                    <var class="class-ModificarVar">
                        <p>Estado del Elemento:</p>
                        <input type="text" name="txtSituacionElemento" value="<%= items.getSituacionElemento()%>">
                    </var>
                    <var class="class-ModificarVar">
                        <p>URL Foto del Elemento:</p>
                        <input type="text" name="txtFotoElemento" value="<%= items.getFotoElemento()%>">
                    </var>
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Actualizar">
                    </var>
                </div>
                </form>
            </div>
        </main>
    </body>
</html>

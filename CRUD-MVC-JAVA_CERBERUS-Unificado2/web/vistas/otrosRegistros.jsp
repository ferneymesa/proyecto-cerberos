<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Trabajador"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Otros Registros</title>
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
                <a href="Controlador?accion=listarPer">Lista de Personas</a>
                <a href="Controlador?accion=addPer" <%= "Empleado".equals(usuario.getCategoria()) ? "style='display:none;'" : ""%>>Agregar Personal Interno</a>
                <a href="ControladorExternos?accion=addExt">Agregar Personal Externo</a>
                <a href="ControladorExternos?accion=Buscar">Regresar a control</a>
            </div>
            <h1>PERSONAL</h1>
            <%
                // Obtener datos de la persona del request o de los parámetros
                String documentoRecibido = request.getParameter("txtDocumentoCont");
                String nombreRecibido = request.getParameter("txtNombreCont");
                String telefonoRecibido = request.getParameter("txtTelefonoTemporal");
                String emailRecibido = request.getParameter("txtEmailTemporal");
                String cargoRecibido = request.getParameter("txtCargoCont");
                String empresaRecibido = request.getParameter("txtEmpresaCont");
            %>

            <!-- Tabla de información personal -->
            <div class="tabla-Busqueda">
                <div class="tabla-responsive">
                    <table class="tablaOtros">
                        <tr>
                            <th>DOCUMENTO</th>
                            <th>NOMBRE</th>
                            <th>TELEFONO</th>
                            <th>CORREO ELECTRONICO</th>
                            <th>AREA DE TRABAJO</th>
                            <th>EMPRESA</th>
                        </tr>
                        <tr>
                            <td><%= documentoRecibido != null ? documentoRecibido : ""%></td>
                            <td><%= nombreRecibido != null ? nombreRecibido : ""%></td>
                            <td><%= telefonoRecibido != null ? telefonoRecibido : ""%></td>
                            <td><%= emailRecibido != null ? emailRecibido : ""%></td>
                            <td><%= cargoRecibido != null ? cargoRecibido : ""%></td>
                            <td><%= empresaRecibido != null ? empresaRecibido : ""%></td>
                        </tr>
                    </table>
                </div>
            </div>

            <h1>Registro de Otros Elementos</h1>

            <!-- Formulario para crear filas -->
            <form action="ControladorRegistros" method="post">
                <input type="hidden" name="txtDocumentoCont" value="<%= documentoRecibido%>">
                <input type="hidden" name="txtNombreCont" value="<%= nombreRecibido%>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= telefonoRecibido%>">
                <input type="hidden" name="txtEmailTemporal" value="<%= emailRecibido%>">
                <input type="hidden" name="txtCargoCont" value="<%= cargoRecibido%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= empresaRecibido%>">

                <div class="btn-Buscar">
                    <label class="labelBuscar" for="numFilas">Número de filas a crear:</label>
                    <input class="inputText" type="number" name="numFilas" id="numFilas" min="1" required>
                    <input class="inputBtn" type="submit" name="accion" value="Crear Filas">
                </div>
            </form>

            <!-- Formulario para registrar elementos -->
            <form action="ControladorRegistros" method="post">
                <input type="hidden" name="txtDocumentoCont" value="<%= documentoRecibido%>">
                <input type="hidden" name="txtNombreCont" value="<%= nombreRecibido%>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= telefonoRecibido%>">
                <input type="hidden" name="txtEmailTemporal" value="<%= emailRecibido%>">
                <input type="hidden" name="txtCargoCont" value="<%= cargoRecibido%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= empresaRecibido%>">
                <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">


                <%
                    String numFilasStr = request.getParameter("numFilas");
                    int numFilas = 0;
                    if (numFilasStr != null && !numFilasStr.isEmpty()) {
                        try {
                            numFilas = Integer.parseInt(numFilasStr);
                        } catch (NumberFormatException e) {
                            numFilas = 0;
                        }
                    }
                    for (int i = 0; i < numFilas; i++) {
                %>

                <div class="tabla-responsive">
                    <table class="tablaItemsOtros" border="1">
                        <thead>
                            <tr>
                                <th>SERIAL</th>
                                <th>PLACA</th>
                                <th>ELEMENTO</th>
                                <th>SITUACIÓN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="text" name="serial_<%= i%>" required></td>
                                <td><input type="text" name="placa_<%= i%>" required></td>
                                <td><input type="text" name="nombre_<%= i%>" required></td>
                                <td><input type="text" name="situacion_<%= i%>" required></td>
                                <td style="display: none;">
                                    <input type="checkbox" name="elementosSeleccionados" value="<%= i%>" checked>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                </div>
                <% if (numFilas > 0) {%>
                <div action="ControladorRegistros" >
                    <div class="div-AutorizNot">
                        <var class="class-VarContenedor">
                            <var class="class-ModificarVar">
                                <p>Autorizá:</p>
                                <input type="text" name="txtAutorizaCont">
                            </var>
                            <var class="class-ModificarVar">
                                <p class="p-Observaciones">Observaciones:</p>
                                <textarea class="input-Observaciones" name="txtObservacionesCont"></textarea>
                            </var>
                        </var>           
                    </div>

                    <var class="varDiv-IngreSalid">
                        <div class="div-IngreSalid">
                            <input class="btn-editar" type="submit" name="accion" value="Ingreso">
                            <input class="btn-remover" type="submit" name="accion" value="Salida">
                        </div>
                    </var>
                </div>
                <% }%>
            </form>


        </main>
    </body>
</html>
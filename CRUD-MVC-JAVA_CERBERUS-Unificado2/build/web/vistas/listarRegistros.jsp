<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Registros"%>
<%@page import="Modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>LISTA DE REGISTROS</title>
    </head>
    <body>
        <main>
            <div>
                <!-- Cabecera -->
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

                <!-- Botonera -->
                <div class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="ControladorExternos?accion=Buscar">Ir a Control</a>
                    <a href="ControladorRegistros?accion=listarRegistros">Actualizar</a>
                </div>

                <h1>PROCESOS REALIZADOS</h1>

                <!-- Formulario de búsqueda -->
                <form class="form-busqueda-cerberus" action="ControladorRegistros" method="GET">
                    <div class="campo">
                        <label for="dia">Día</label>
                        <input type="number" name="dia" id="dia" min="1" max="31">
                    </div>

                    <div class="campo">
                        <label for="mes">Mes</label>
                        <select name="mes" id="mes">
                            <option value="">Seleccione...</option>
                            <option value="Enero">Enero</option>
                            <option value="Febrero">Febrero</option>
                            <option value="Marzo">Marzo</option>
                            <option value="Abril">Abril</option>
                            <option value="Mayo">Mayo</option>
                            <option value="Junio">Junio</option>
                            <option value="Julio">Julio</option>
                            <option value="Agosto">Agosto</option>
                            <option value="Septiembre">Septiembre</option>
                            <option value="Octubre">Octubre</option>
                            <option value="Noviembre">Noviembre</option>
                            <option value="Diciembre">Diciembre</option>
                        </select>
                    </div>

                    <div class="campo">
                        <label for="anno">Año</label>
                        <input type="number" name="anno" id="anno" min="2000" max="2100" required>
                    </div>

                    <input type="hidden" name="accion" value="buscarPorFecha">
                    <input type="hidden" name="start" value="0"/>
                    <input type="hidden" name="limit" value="30"/>
                    <div class="campo">
                        <button type="submit">Buscar</button>
                    </div>
                </form>

                <!-- Tabla de registros -->
                <%
                    int start = 0;
                    int limit = 30;
                    try {
                        if (request.getParameter("start") != null) {
                            start = Integer.parseInt(request.getParameter("start"));
                        }
                        if (request.getParameter("limit") != null) {
                            limit = Integer.parseInt(request.getParameter("limit"));
                        }
                    } catch (NumberFormatException e) {
                    }

                    List<Registros> registros = (List<Registros>) request.getAttribute("registros");
                    if (registros == null) {
                        ModeloDAO.RegistrosDAO dao = new ModeloDAO.RegistrosDAO();
                        registros = dao.listarRegistros();
                    }

                    int total = 0;
                    if (registros != null && !registros.isEmpty()) {
                        Collections.reverse(registros);
                        total = registros.size();

                        int end = Math.min(start + limit, total);
                        if (start < total) {
                            registros = registros.subList(start, end);
                        } else {
                            registros = Collections.emptyList();
                        }
                    }

                    int anterior = Math.max(start - limit, 0);
                    int siguiente = start + limit;
                    int paginaActual = (start / limit) + 1;
                    int totalPaginas = (int) Math.ceil((double) total / limit);
                %>

                <div class="tabla-responsive">
                    <table class="tabla" border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>DOCUMENTO</th>
                                <th>NOMBRE PERSONAL</th>
                                <th>EMPRESA</th>
                                <th>CARGO</th>
                                <th>SERIAL ELEMENTO</th>
                                <th>PLACA ELEMENTO</th>
                                <th>TIPO ELEMENTO</th>
                                <th>SITUACION</th>
                                <th>FECHA</th>
                                <th>HORA</th>
                                <th>PROCESO</th>
                                <th>AUTORIZA</th>
                                <th>OBSERVACIONES</th>
                                <th>RESPONSABLE</th>
                            </tr>                           
                        </thead>
                        <tbody>
                            <%
                                if (registros != null && !registros.isEmpty()) {
                                    for (Registros reg : registros) {
                            %>
                            <tr>
                                <td><%= reg.getIdCont()%></td>
                                <td><%= reg.getDocumentoCont()%></td>
                                <td><%= reg.getNombreCont()%></td>
                                <td><%= reg.getEmpresaCont()%></td>
                                <td><%= reg.getCargoCont()%></td>
                                <td><%= reg.getSerialCont()%></td>
                                <td><%= reg.getPlacaCont()%></td>
                                <td><%= reg.getElementoCont()%></td>
                                <td><%= reg.getSituacionCont()%></td>
                                <td><%= reg.getDiaCont()%> / <%= reg.getMesCont()%> / <%= reg.getAnnoCont()%></td>
                                <td><%= reg.getHoraCont()%></td>
                                <td><%= reg.getProcesoCont()%></td>
                                <td><%= reg.getAutorizaCont()%></td>
                                <td><%= reg.getObservacionesCont()%></td>
                                <td><%= reg.getResponsableCont()%></td>
                            </tr>          
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="15" style="text-align: center;">No se encontraron registros</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <!-- Paginación -->
                <div class="paginacion">
                    <p>Página <%= paginaActual%> de <%= totalPaginas%></p>

                    <% if (start > 0) {%>
                    <a href="ControladorRegistros?accion=listarRegistros&start=<%= anterior%>&limit=<%= limit%>">Anterior</a>
                    <% } %>

                    <% for (int i = 1; i <= totalPaginas; i++) {
                            int inicio = (i - 1) * limit;
                    %>
                    <a href="ControladorRegistros?accion=listarRegistros&start=<%= inicio%>&limit=<%= limit%>"><%= i%></a>
                    <% } %>

                    <% if (siguiente < total) {%>
                    <a href="ControladorRegistros?accion=listarRegistros&start=<%= siguiente%>&limit=<%= limit%>">Siguiente</a>
                    <% } %>
                </div>

                <!-- Mensajes -->
                <%
                    String mensaje = (String) request.getAttribute("mensaje");
                    if (mensaje != null) {
                %>
                <p style="color: red;"><%= mensaje%></p>
                <%
                    }
                %>
            </div>
        </main>
    </body>
</html>

<%@page import="Modelo.Persona" %>
<%@page import="ModeloDAO.PersonaDAO" %>
<%@page import="ModeloDAO.RelacionesDAO" %>
<%@page import="Modelo.Elementos" %>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page import="Modelo.Externos" %>
<%@page import="ModeloDAO.ExternosDAO" %>
<%@page import="Modelo.Registros" %>
<%@page import="ModeloDAO.RegistrosDAO" %>
<%@page import="Modelo.Trabajador"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Controles de Personal</title>
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
                <a href="ControladorRegistros?accion=listarRegistros">Lista de Registros </a>                
            </div>
            <h1>CONSULTA DE PERSONA POR CÉDULA PARA CONTROL</h1>
            <form class="btn-Buscar" action="Controlador" method="get">
                <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                <input class="inputBtn" type="submit" name="accion" value="Buscar">
            </form>

            <%
                String dniBuscado = request.getParameter("txtDni");
                boolean esExterno = false;
                Persona persona = null;
                List<Elementos> elementosList = null;

                if (dniBuscado != null && !dniBuscado.isEmpty()) {
                    try {
                        PersonaDAO personaDAO = new PersonaDAO();
                        persona = personaDAO.buscarPorDni(dniBuscado);

                    } catch (Exception e) {
                        e.printStackTrace(); // Depuración
                    }

                    if (persona == null) {
                        try {
                            ExternosDAO externosDAO = new ExternosDAO();
                            Externos externo = externosDAO.buscarPorDocumento(dniBuscado);
                            if (externo != null) {
                                esExterno = true;

            %>
            <var class="contenedor-Limpiar">
                <div class="div-H2">
                    <h2>Resultados en Personal Externo:</h2>
                </div>            
                <div class="botonera">
                    <a href="Controlador?accion=Buscar">Limpiar Datos</a>
                </div>
            </var>
            <div class="tabla-Busqueda">
                <div class="tabla-responsive">
                    <table class="tablaItem">
                        <tr>
                            <th>DOCUMENTO</th>
                            <th>NOMBRE</th>
                            <th>CARGO</th>
                            <th>EMPRESA</th>
                        </tr>
                        <tr>
                            <td><%= externo.getDocumentoExt()%></td>
                            <td><%= externo.getNombreExt()%></td>
                            <td><%= externo.getCargoExt()%></td>
                            <td><%= externo.getEmpresaExt()%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <form action="ControladorRegistros" >
                <input type="hidden" name="txtDocumentoCont" value="<%= externo.getDocumentoExt()%>">
                <input type="hidden" name="txtNombreCont" value="<%= externo.getNombreExt()%>">
                <input type="hidden" name="txtCargoCont" value="<%= externo.getCargoExt()%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= externo.getEmpresaExt()%>">

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
                            <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">
                        </var>           
                    </div>
                </div>

                <var class="varDiv-IngreSalid">
                    <div class="div-IngreSalid">
                        <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">
                        <input class="btn-editar" type="submit" name="accion" value="Ingreso">
                        <input class="btn-remover" type="submit" name="accion" value="Salida">
                    </div>
                </var>
            </form>


            <%
            } else {
            %>
            <script>
                alert("No se encontró resultado para esta Cédula.");
                window.location.href = "ControladorExternos?accion=addExt&txtDocumentoExt=" + encodeURIComponent("<%= dniBuscado%>");
            </script>
            <%      }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (!esExterno && persona != null) {
                    RelacionesDAO relacionesDAO = new RelacionesDAO();
                    List<Elementos> elementos = relacionesDAO.obtenerElementosPorPersona(persona.getIdPer());
            %>
            <var class="contenedor-Limpiar">
                <div class="div-H2">
                    <h2>Resultados de la búsqueda:</h2>
                </div>
                
                <div class="botonera">
                    <a href="Controlador?accion=Buscar">Limpiar Datos</a>
                </div>
            </var>
            <div class="tabla-Busqueda">
                <table class="tabla" border="1">
                    <tr>
                        <th>ID</th>
                        <td><%= persona.getIdPer()%></td>
                    </tr>
                    <tr>
                        <th>DOCUMENTO</th>
                        <td><%= persona.getDni()%></td>
                    </tr>
                    <tr>
                        <th>NOMBRE</th>
                        <td><%= persona.getNom()%></td>
                    </tr>
                    <tr>
                        <th>TELEFONO</th>
                        <td><%= persona.getTelefono()%></td>
                    </tr>
                    <tr>
                        <th>CORREO ELECTRONICO</th>
                        <td><%= persona.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>AREA DE TRABAJO</th>
                        <td><%= persona.getAreaTrabajo()%></td>
                    </tr>
                    <tr>
                        <th>EMPRESA</th>
                        <td><%= persona.getEmpresa()%></td>
                    </tr>
                    <tr>
                        <th>URL FOTO USUARIO</th>
                        <td><%= persona.getFotoUsua()%></td>
                    </tr>
                </table>
                <%
                    String urlFoto = persona.getFotoUsua(); // Asignar la URL de la foto a la variable
                    // Verifica si la URL es null o está vacía
                    if (urlFoto == null || urlFoto.isEmpty()) {
                %>
                <var class="contenedor-Img">
                    <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                    <p class="texto-ImgNull">No hay foto disponible.</p>
                </var>
                <%
                } else {
                %>
                <var class="contenedor-Img">
                    <img src="<%= urlFoto%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
                </var>
                <%
                    }
                %>
            </div>
            <% if (elementos != null && !elementos.isEmpty()) { %>
            <div class="form-position">
                <form action="ControladorRegistros" method="post" >
                    <h2>Elementos Asociados:</h2>
                    <div class="tabla-Busqueda">
                        <div class="tabla-responsive">
                            <table class="tablaItem" border="1">
                                <tr>
                                    <th>SERIAL</th>
                                    <th>PLACA</th>
                                    <th>ELEMENTO</th>
                                    <th>SITUACIÓN</th>
                                    <th>SELECCIONAR</th>
                                </tr>
                                <% for (Elementos elemento : elementos) {%>
                                <tr>
                                    <td><%= elemento.getSerialElemento()%></td>
                                    <td><%= elemento.getPlaca()%></td>
                                    <td><%= elemento.getNombreElemento()%></td>
                                    <td><%= elemento.getSituacionElemento()%></td>
                                    <td>
                                        <input type="checkbox" name="elementosSeleccionados" value="<%= elemento.getIdItem()%>">
                                        <!-- Solo se enviarán los siguientes inputs si el checkbox está marcado (con JS) -->
                                        <input type="hidden" name="serial_<%= elemento.getIdItem()%>" value="<%= elemento.getSerialElemento()%>">
                                        <input type="hidden" name="placa_<%= elemento.getIdItem()%>" value="<%= elemento.getPlaca()%>">
                                        <input type="hidden" name="nombre_<%= elemento.getIdItem()%>" value="<%= elemento.getNombreElemento()%>">
                                    </td>
                                </tr>
                                <% }%>
                            </table>
                        </div>
                    </div>
                    <!-- Campos adicionales -->
                    <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                    <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                    <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                    <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                    <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">

                    <div class="div-Autoriz">
                        <var class="class-ModificarVar">
                            <p>Autorizá:</p>
                            <input type="text" name="txtAutorizaCont">
                        </var>
                        <var class="class-ModificarVar">
                            <p>Observaciones:</p>
                            <textarea class="input-Observaciones" name="txtObservacionesCont"></textarea>
                        </var>
                    </div>
                    <div class="div-IngreSalid">
                        <input class="btn-editar" type="submit" name="accion" value="Ingreso">
                        <input class="btn-remover" type="submit" name="accion" value="Salida">
                    </div>
                </form>

                <var class="form-PositionAbsulute">
                    <form class="form-AccionIngOtros" action="ControladorRegistros">
                        <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                        <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                        <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                        <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                        <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">
                        <input type="submit" name="accion" value="Ingresar Otros Elementos">
                    </form>
                </var>
            </div>
        </div>
        <% } else {%>
        <div class="divform-AccionIngOtros">
            <p>No hay elementos asociados a esta persona.</p>        
            <form class="form-AccionIngOtros" action="ControladorRegistros" >
                <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">
                <input type="submit" name="accion" value="Ingresar Otros Elementos">
            </form>
        </div>
        <form action="ControladorRegistros" >
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
                    <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">
                </var>           
            </div>

            <var class="varDiv-IngreSalid">
                <div class="div-IngreSalid">
                    <!-- Botones de acción -->
                    <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                    <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                    <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                    <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                    <input type="hidden" name="txtResponsableCont" value="<%= usuario.getNombreRH()%>">

                    <input class="btn-editar" type="submit" name="accion" value="Ingreso">
                    <input class="btn-remover" type="submit" name="accion" value="Salida">
                </div>
            </var>
        </form>

        <% }
            }
        %>
    </main>
</body>
</html>

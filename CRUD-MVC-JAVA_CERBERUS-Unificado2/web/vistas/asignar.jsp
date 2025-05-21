<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Trabajador"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Stylos.css" rel="stylesheet" type="text/css"/>
        <title>Asignar Elementos</title>
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
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="ControladorElementos?accion=addItem">Ir a Agregar Nuevo Elemento</a>
            </div> 
            <!-- CONSULTA DE ELEMENTOS -->
            <section>
                <h1>CONSULTA DE ELEMENTOS POR SERIAL</h1>
                <form class="btn-Buscar" onsubmit="event.preventDefault(); buscarElemento();">
                    <label class="labelBuscar" for="txtSerialElemento">Ingrese el Serial:</label>
                    <input class="inputText" type="text" name="txtSerialElemento" id="txtSerialElemento" required>
                    <input class="inputBtn" type="submit" value="Buscar">
                </form>

                <div class="resultadoBusqueda" id="resultadoElemento" style="display: none;"></div>
            </section>

            <!-- CONSULTA DE PERSONA -->
            <section>
                <h1>CONSULTA DE PERSONA POR CÉDULA</h1>
                <form class="btn-Buscar" onsubmit="event.preventDefault(); buscarPersona();">
                    <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                    <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                    <input class="inputBtn" type="submit" value="Buscar">
                </form>

                <div id="resultadoPersona" style="display: none;"></div>
            </section>
 
            <!-- FORMULARIO DE ASOCIACIÓN -->
            <form id="formAsociacion" action="ControladorRelaciones" method="POST" onsubmit="return asociarConFormulario();">
                <input type="hidden" name="accion" value="unificar">
                <input type="hidden" name="txtIdPerUnit" id="inputIdPer">
                <input type="hidden" name="txtIdItemUnit" id="inputIdItem">
                <input class="botonUnificar" type="submit" value="Unificar">
            </form>
        </main>

        <!-- Script de AJAX -->
        <script>
            var idPersona = null;
            var idElemento = null;

            function buscarElemento() {
                var serial = document.getElementById("txtSerialElemento").value.trim();
                if (!serial) {
                    alert("Debe ingresar un número de serie.");
                    return;
                }
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "ControladorElementos?accion=buscarElemento&txtSerialElemento=" + serial, true);
                xhr.setRequestHeader("Content-Type", "text/plain");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var data = xhr.responseText.split(';');
                        var divResultado = document.getElementById("resultadoElemento");

                        if (data[0] === "Error") {
                            divResultado.style.display = "block";
                            divResultado.innerHTML = "<p class='mensajeError'>" + data[1] + "</p>";
                        } else {
                            idElemento = data[0];
                            document.getElementById("inputIdItem").value = idElemento;
                            divResultado.style.display = "block";
                            divResultado.innerHTML =
                                    "<h2>Resultados de la búsqueda:</h2>" +"<table class='tablaAsignar'><tr><th>ID</th><th>SERIAL</th><th>PLACA</th><th>NOMBRE</th><th>MODELO</th><th>SITUACIÓN</th></tr>" +
                                    "<tr><td>" + data[0] + "</td><td>" + data[1] + "</td><td>" + data[2] + "</td><td>" +
                                    data[3] + "</td><td>" + data[4] + "</td><td>" + data[5] + "</td></tr></table>";
                        }
                    }
                };
                xhr.send();
            }

            function buscarPersona() {
                var dni = document.getElementById("txtDni").value.trim();
                if (!dni) {
                    alert("Debe ingresar una cédula.");
                    return;
                }
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "Controlador?accion=buscarPersona&txtDni=" + dni, true);
                xhr.setRequestHeader("Content-Type", "text/plain");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var data = xhr.responseText.split(';');
                        var divResultado = document.getElementById("resultadoPersona");

                        if (data[0] === "Error") {
                            divResultado.style.display = "block";
                            divResultado.innerHTML = "<p class='mensajeError'>" + data[1] + "</p>";
                        } else {
                            idPersona = data[0];
                            document.getElementById("inputIdPer").value = idPersona;
                            divResultado.style.display = "block";
                            divResultado.innerHTML =
                                    "<h2>Resultados de la búsqueda:</h2>" + " <table class='tablaAsignar'><tr><th>ID</th><th>DNI</th><th>NOMBRE</th><th>TELÉFONO</th><th>EMAIL</th><th>ÁREA</th></tr>" +
                                    "<tr><td>" + data[0] + "</td><td>" + data[1] + "</td><td>" + data[2] + "</td><td>" +
                                    data[3] + "</td><td>" + data[4] + "</td><td>" + data[5] + "</td></tr></table>";
                        }
                    }
                };
                xhr.send();
            }

            function asociarConFormulario() {
                if (!idPersona || !idElemento) {
                    alert("Debe buscar primero una persona y un elemento antes de asociarlos.");
                    return false;
                }

                var boton = document.querySelector("#formAsociacion input[type='submit']");
                boton.disabled = true;

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "ControladorRelaciones", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var respuesta = xhr.responseText.trim();

                            if (respuesta === "success") {
                                alert("Asociación realizada correctamente.");
                                limpiarCampos();
                            } else if (respuesta.includes("Registro duplicado")) {
                                alert("Error: El registro ya existe.");
                            } else {
                                alert("Error en la asociación: " + respuesta);
                            }
                        } else {
                            alert("Error de comunicación con el servidor. Código: " + xhr.status);
                        }
                        boton.disabled = false;
                    }
                };

                var params = "accion=unificar&txtIdPerUnit=" + encodeURIComponent(idPersona) +
                        "&txtIdItemUnit=" + encodeURIComponent(idElemento);
                xhr.send(params);

                return false;
            }

            function limpiarCampos() {
                document.getElementById("resultadoElemento").style.display = "none";
                document.getElementById("resultadoPersona").style.display = "none";
                document.getElementById("resultadoElemento").innerHTML = "";
                document.getElementById("resultadoPersona").innerHTML = "";
                document.getElementById("txtDni").value = "";
                document.getElementById("txtSerialElemento").value = "";
                document.getElementById("inputIdPer").value = "";
                document.getElementById("inputIdItem").value = "";
                idPersona = null;
                idElemento = null;
            }
        </script>
    </body>
</html>

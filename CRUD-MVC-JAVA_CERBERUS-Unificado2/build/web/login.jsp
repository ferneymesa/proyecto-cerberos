<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/Stylos2.css" rel="stylesheet" type="text/css"/>
    <title>Login - CERBERUS</title>
</head>
<body >
    <main>
        <div>
            <img class="logoImg" src="./IMAGENES/cerberus.png" alt="logo Cerberus"/>
           
            <h2>Iniciar Sesión</h2>
            
            <form action="ControladorTrabajador" method="POST">
                <input type="hidden" name="accion" value="login"> 

                <label for="documento">Documento:</label>
                <input type="text" id="documento" name="documentoRH" required>

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="passwordRH" required>

                <button type="submit">Ingresar</button>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <p style="color:red;">Usuario o contraseña incorrectos</p>
            <% } %>
        </div>
    </main>
</body>
</html>
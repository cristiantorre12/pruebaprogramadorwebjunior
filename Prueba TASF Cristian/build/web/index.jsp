<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventana de Login:</title>
    </head>
    <body>
        <div class="container">
        <h1>Login:</h1>
        <form class="form-group" action="validarusuario.jsp" method="POST">
            <h3>Usuario:</h3>
            <input type="text" name="usuario" class="form-control">
            <br>
            <h3>Contraseña:</h3>
            <input type="password" name="clave" class="form-control">
            <br>
            <input type="submit" name="submit" value="Ingresar" class="btn btn-primary">
        </form>
        </div>
        </body>
</html>

<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>VideoGame Store - Header</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/_reset.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/styles.css">
    </head>
    <body>
        <header class="header">
            <div class="user-info">
                <img src="../assets/images/logo.jfif" alt="Logotipo VideoGamesGG" class="logo">
                <h1 class="title1">VideoGameGG</h1>
            </div>
            <div class="user-info">
                <h3 class="username"><%if (request.getSession().getAttribute("catNombre") != null){%>
                	<%=request.getSession().getAttribute("catNombre")%>
                </h3><%}else{}%><p>&nbsp;&nbsp;&nbsp;</p>
                <a href="#"><img src="../assets/images/icono-usuario.png" alt="Icono de Usuario" class="user-icon"></a>
            </div>
        </header>
    </body>
</html>
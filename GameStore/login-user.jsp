<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <title>Login | VideoGameGG</title>
	    <link rel="stylesheet" type="text/css" href="./assets/css/_reset.css">
	    <link rel="stylesheet" type="text/css" href="./assets/css/login.css">
	</head>
	<body>
	    <main class="container">
	        <div class="card">
	            <h2 class="title">Iniciar Sesi&#243;n</h2>
	            <form id="loginForm" class="form" method="POST" action="inicio">
	                <div class="form-group">
	                    <label for="email" class="label">Correo Electr&#243;nico</label>
	                    <input type="email" id="email" name="email" class="input" placeholder="usuario@example.com.gt" required>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="label">Contrase&ntilde;a</label>
	                    <input type="password" id="password" name="password" class="input" placeholder="********" required>
	                </div>
	                <div>
	                    <p><a href="#"  class="forgot-password">Olvid&eacute; mi Contrase&ntilde;a</a></p>
	                </div>
	                <button type="submit" id="loginButton" class="button">Ingresar</button>
	                <%if((request.getSession().getAttribute("catCredenciales")) != null){%>
	                <div>
	                	<p class="error"><strong><%=request.getSession().getAttribute("catCredenciales")%></strong></p>
	                </div>
	                <%}else{}%>
	            </form>
	        </div>
	        <div class="footer">
	            <p>&copy; VideoGameGG | <a href="./screens/footer.html">by Angel Jacinto</a></p>
	        </div>
	    </main>
	</body>
</html>

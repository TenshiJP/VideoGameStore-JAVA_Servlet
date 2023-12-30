<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <title>B&#250;squeda de Clientes</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/_reset.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/forms.css">
	</head>
	<body>
	    <main>
	        <div>
	            <h2 class="form-title">B&#250;squeda de Clientes</h2>
	        </div>
	        <section class="form-container">
	            <form name="form-registro" method="post" action="../cliente">
	                <div class="input-group">
	                    <label for="nombre" class="input-label">
	                        <span class="input-span">B&#250;squeda por nombre</span>
	                    </label>
	                    <input type="search" id="nombre" name="nombre" class="input-field" value="" placeholder="Pon el nombre a buscar...">
	                </div>
	                <div class="input-group">
	                    <label for="apellido" class="input-label">
	                        <span class="input-span">B&#250;squeda por apellido</span>
	                    </label>
	                    <input type="search" id="apellido" name="apellido" class="input-field" value="" placeholder="Pon el apellido a buscar...">
	                </div>
	                <div class="input-group">
	                    <label for="apodo" class="input-label">
	                        <span class="input-span">B&#250;squeda por correo electronico</span>
	                    </label>
	                    <input type="search" id="email" name="email" class="input-field" value="" placeholder="Pon el email a buscar...">
	                </div>
	                <div class="input-group">
		                <input type="hidden" name="userMail" value="<%=request.getSession().getAttribute("catUser")%>">
	                    <input type="submit" name="Consultar" class="submit-button" id="btn-crear-cuenta" value="Buscar">
	                </div>
	            </form>
	        </section>
	    </main>
	</body>
</html>

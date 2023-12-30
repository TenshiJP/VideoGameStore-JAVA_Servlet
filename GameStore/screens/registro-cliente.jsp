<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <title>Registrar Cliente</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/_reset.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/forms.css">
	</head>
	<body>
	    <main>
	        <div>
	            <h2 class="form-title">Registrar Cliente</h2>
	        </div>
	        <section class="form-container">
	            <form name="formRegistro" method="post" action="../cliente">
	                <div class="input-group">
	                    <label for="nombre" class="input-label">
	                        <span class="input-span">Nombre</span>
	                    </label>
	                    <input type="text" id="nombre" name="nombre" class="input-field" placeholder="Pon el nombre..." required>
	                </div>
	                <div class="input-group">
	                    <label for="apellido" class="input-label">
	                        <span class="input-span">Apellido</span>
	                    </label>
	                    <input type="text" id="apellido" name="apellido" class="input-field" placeholder="Pon el apellido..." required>
	                </div>
                    <div class="input-group">
	                    <label for="fecha" class="input-label">
	                        <span class="input-span">Fecha de nacimiento</span>
	                    </label>
	                    <input type="date" id="fecha" name="fecha" class="input-field" required>
	                </div>
                    <div class="input-group">
	                    <label class="input-legend">
	                        <span class="input-span">G&#233;nero</span>
	                    </label>
	                    <div class="radio-group">
	                        <input type="radio" id="hombre" name="genero" value="Masculino" class="radio-input">
	                        <label for="hombre" class="radio-label">Hombre</label>
	                    </div>
	                    <div class="radio-group">
	                        <input type="radio" id="mujer" name="genero" value="Femenino" class="radio-input">
	                        <label for="mujer" class="radio-label">Mujer</label>
	                    </div>
	                    <div class="radio-group">
	                        <input type="radio" id="otro" name="genero" value="Otro" class="radio-input">
	                        <label for="otro" class="radio-label">Otro</label>
	                    </div>
	                    <div class="radio-group">
	                        <input type="radio" id="desconocido" name="genero" value="No especificado" class="radio-input">
	                        <label for="desconocido" class="radio-label">Prefiero no responder</label>
	                    </div>
	                </div>
                    <div class="input-group">
	                    <label for="dept" class="input-label">
	                        <span class="input-span">Nacionalidad</span>
	                    </label>
	                    <input type="text" id="dept" name="dept" class="input-field" placeholder="Pon el pa&#237;
	                    s de origen..." required>
	                </div>
                    <div class="input-group">
	                    <label for="direccion" class="input-label">
	                        <span class="input-span">Direcci&#243;n</span>
	                    </label>
	                    <input type="text" id="direc" name="direc" class="input-field" placeholder="Pon la direcci&#243;n..." required>
	                </div>
	                <div class="input-group">
	                    <label for="tel" class="input-label">
	                        <span class="input-span">N&#250;mero de celular principal</span>
	                    </label>
	                    <input type="tel" id="tel" name="tel" class="input-field" placeholder="XXXXXXXX" required>
	                </div>
                    <div class="input-group">
	                    <label for="cel" class="input-label">
	                        <span class="input-span">N&#250;mero de celular secundario (Opcional)</span>
	                    </label>
	                    <input type="tel" id="cel" name="cel" class="input-field" placeholder="XXXXXXXX">
	                </div>
	                <div class="input-group">
	                    <label for="email" class="input-label">
	                        <span class="input-span">Correo electr&#243;nico</span>
	                    </label>
	                    <input type="email" id="email" name="email" class="input-field" placeholder="Pon tu correo electr&#243;nico..." required>
	                </div>
	                <div class="input-group">
	                    <label class="input-legend">
	                        <span class="input-span">&#218;ltimas novedades</span>
	                    </label>
	                    <input type="checkbox" id="oferta" name="oferta" value="Si" class="checkbox-input">
	                    <label for="oferta" class="checkbox-label">Conocer todas las &#250;ltimas noticias, informaci&#243;n y ofertas de VideoGames Store.</label>
	                </div>
	                <div class="input-group">
	                	<input type="hidden" name="userMail" value="<%=request.getSession().getAttribute("catUser")%>">
	                    <input type="submit" name="Registrar" class="submit-button" id="btn-add-client" value="Registrar">
	                </div>
	            </form>
	        </section>
	    </main>
	</body>
</html>

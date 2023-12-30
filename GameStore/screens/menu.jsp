<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>VideoGame Store - Menu</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/_reset.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/styles.css">
    </head>
    <body>
        <main>
            <section class="menu-container">
                <ul class="menu-list">
                    <li class="menu-item"><a href="main.html" target="mainFrame" class="menu-link">Acerca De</a></li>
                    <li class="menu-item"><a href="registro-cliente.jsp" target="mainFrame" class="menu-link">Registrar Cliente</a></li>
                    <li class="menu-item"><a href="consulta-cliente.jsp" target="mainFrame" class="menu-link">Buscar Clientes</a></li>
                    <li class="menu-item">
                    	<form method="post" action="../cliente">
                    		<input type="hidden" name="userMail" value="<%=request.getSession().getAttribute("catUser")%>">
                    		<input class="menu-link" style="width:100%" name="Consultar" type="submit" value="Lista de Clientes">
                    	</form>               
                    </li>
                </ul>
            </section>
        </main>
        <script>
			document.addEventListener("DOMContentLoaded", function() {
			    document.querySelector("input[name='Consultar']").addEventListener("click", function() {
			        const form = this.form;
			        if (form.checkValidity()) {
			            form.target = "mainFrame";
			            form.submit();
			        } else {
			            alert("Por favor, complete todos los campos requeridos.");
			        }
			    });
			});
		</script>
    </body>
</html>

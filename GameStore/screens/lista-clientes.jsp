<%@ page language="java" import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<!-- Angel Roberto Jacinto Payes - 5990-20-1756 -->
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <title>Registrar Cliente</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/_reset.css">
	    <link rel="stylesheet" type="text/css" href="../assets/css/forms.css">
	</head>
	<script languaje="javascript">
		function askDelete(){
			if(confirm("&iquest;Esta seguro de eliminar el cliente seleccionado?")){
				document.forms.formOptions.Eliminar.value = "SI";
				window.document.formOptions.submit();
			}
		}
	
		function askUpdate(){
			if(confirm("&iquest;Esta seguro de actualizar los datos del cliente seleccionado?")){
				document.forms.formOptions.Actualizar.value = "SI";
				window.document.formOptions.submit();
			}
		}
		
		function asigneValues(pId, pNombre, pApellido, pFecha, pSexo, pDept, pDirec, pTel, pCel, pMail, pOferta){
			document.forms.formOptions.Eliminar.value = "";
			document.forms.formOptions.Actualizar.value = "";
			document.getElementById('dUser1').style.display = 'block';
			document.getElementById('dUser2').style.display = 'block';
			document.forms.formOptions.cod.value = pId;
			document.forms.formOptions.nombre.value = pNombre;
			document.forms.formOptions.apellido.value = pApellido;
			document.forms.formOptions.fecha.value = pFecha.substring(0, 10);
			document.forms.formOptions.genero.value = pSexo;
			document.forms.formOptions.dept.value = pDept;
			document.forms.formOptions.direc.value = pDirec;
			document.forms.formOptions.tel.value = pTel;
			document.forms.formOptions.cel.value = pCel;
			document.forms.formOptions.email.value = pMail;
			document.forms.formOptions.oferta.value = pOferta;
			document.forms.formOptions.cod.focus();	
		}
	</script>
	<body>
	    <main>
	        <div id="dUser1" style="display:none">
	            <h2 class="form-title">Cliente Seleccionado</h2>
	        </div>
	    	<section id="dUser2" class="form-container"  style="display:none">
	            <form name="formOptions" method="post" action="../cliente">
	            	<div class="input-group">
	                    <label for="cod" class="input-label">
	                        <span class="input-span">ID</span>
	                    </label>
	                    <input type="text" id="cod" name="cod" class="input-field" value="" readonly>
	                </div>
	                <div class="input-group">
	                    <label for="nombre" class="input-label">
	                        <span class="input-span">Nombre</span>
	                    </label>
	                    <input type="text" id="nombre" name="nombre" class="input-field" value="">
	                </div>
	                <div class="input-group">
	                    <label for="apellido" class="input-label">
	                        <span class="input-span">Apellido</span>
	                    </label>
	                    <input type="text" id="apellido" name="apellido" class="input-field" value="">
	                </div>
	                <div class="input-group">
	                    <label for="fecha" class="input-label">
	                        <span class="input-span">Fecha de Nacimiento</span>
	                    </label>
	                    <input type="text" id="fecha" name="fecha" class="input-field" value="">
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
	                    <input type="text" id="dept" name="dept" class="input-field" value="">
	                </div>
                    <div class="input-group">
	                    <label for="direc" class="input-label">
	                        <span class="input-span">Dirección</span>
	                    </label>
	                    <input type="text" id="direc" name="direc" class="input-field" value="">
	                </div>
                    <div class="input-group">
	                    <label for="tel" class="input-label">
	                        <span class="input-span">N&#250;mero de celular principal</span>
	                    </label>
	                    <input type="tel" id="tel" name="tel" class="input-field" value="">
	                </div>
                    <div class="input-group">
	                    <label for="cel" class="input-label">
	                        <span class="input-span">N&#250;mero de celular secundario (Opcional)</span>
	                    </label>
	                    <input type="tel" id="cel" name="cel" class="input-field" value="">
	                </div>
	                <div class="input-group">
	                    <label for="email" class="input-label">
	                        <span class="input-span">Correo Electr&#243;nico</span>
	                    </label>
	                    <input type="text" id="email" name="email" class="input-field" value="">
	                </div>
	                <div class="input-group">
	                    <label class="input-legend">
	                        <span class="input-span">Conocer las &#250;ltimas novedades</span>
	                    </label>
	                    <div class="radio-group">
	                        <input type="radio" id="Si" name="oferta" value="Si" class="radio-input">
	                        <label for="Si" class="radio-label">Si</label>
	                    </div>
	                    <div class="radio-group">
	                        <input type="radio" id="Nombre" name="oferta" value="No" class="radio-input">
	                        <label for="No" class="radio-label">No</label>
	                    </div>
	                </div>
	                <div class="input-group">
	                	<input type="hidden" name="userMail" value="<%=request.getSession().getAttribute("catUser")%>">
	                    <input type="button" value="Actualizar" class="submit-button" onClick="javascript:askUpdate();">
	                    <input type="hidden" name="Actualizar">
	                    <input type="button" value="Eliminar" class="submit-button" onClick="javascript:askDelete();">
	                    <input type="hidden" name="Eliminar">
	                </div>
	            </form>
	        </section>
	        <br>
	        <div>
	            <h2 class="form-title">Listado de Clientes</h2>
	        </div>
	        <section name="usuarios-cuenta" class="result-table-container">
	            <table class="result-table">
	            	<tr>
	            		<th style="display: none;">ID</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Fecha de Nacimiento</th>
						<th>Sexo</th>
						<th>Pa&#237;s</th>
						<th>Direccion</th>
						<th>N&#250;mero Principal</th>
						<th>N&#250;mero Secundario</th>
						<th>E-mail</th>
						<th>Novedades</th>
					</tr>
					
					<%if(session.getAttribute("catClientes") != null){
						ArrayList arrayData = (ArrayList)session.getAttribute("catClientes");
						if(arrayData.size() > 0){ 
							for (int j=0; j<arrayData.size(); j++) {
								Object[] objDatos = (Object[])arrayData.get(j);
					%>
					
					<tr onClick="javascript:asigneValues('<%=objDatos[0]%>', '<%=objDatos[1]%>', '<%=objDatos[2]%>', '<%=objDatos[3]%>', '<%=objDatos[4]%>', '<%=objDatos[5]%>', '<%=objDatos[6]%>', '<%=objDatos[7]%>', '<%=objDatos[8]%>', '<%=objDatos[9]%>', '<%=objDatos[10]%>');">
						<td style="display: none;"><%=objDatos[0]%></td>
						<td><%=objDatos[1]%></td>
						<td><%=objDatos[2]%></td>
						<td><%=objDatos[3]%></td>
						<td><%=objDatos[4]%></td>
						<td><%=objDatos[5]%></td>
						<td><%=objDatos[6]%></td>
						<td><%=objDatos[7]%></td>
						<td><%=objDatos[8]%></td>
						<td><%=objDatos[9]%></td>
						<td><%=objDatos[10]%></td>
					</tr>
					
					<%		} //Fin ciclo
						} // Fin if Condicional.
					  }	// Fin if session. 
					%>
	            </table>
	        </section><br><br>   
	    </main>
	</body>
</html>

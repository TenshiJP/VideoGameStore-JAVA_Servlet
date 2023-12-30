/*
 * Created on 17/10/2023
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.videogamegg.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.pool.OracleDataSource;

/**
 * @author Angel Jacinto
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Cliente extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request, response);
	}
	protected void doPost(
		HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {
			//Varaibles
			String strQuerry = "", userMail="";
			ArrayList arrayClientes = new ArrayList();
			String [] valores = new String[11];
			ArrayList condiciones = new ArrayList();
			
			//Validaciones
			if(request.getParameter("cod") != null && (!request.getParameter("cod").toString().trim().equals(""))){
				valores[0] = request.getParameter("cod");
			}else{
				valores[0] = "";
			}
			if(request.getParameter("nombre") != null && (!request.getParameter("nombre").toString().trim().equals(""))){
				valores[1] = request.getParameter("nombre");
			}else{
				valores[1] = "";
			}
			if(request.getParameter("apellido") != null && (!request.getParameter("apellido").toString().trim().equals(""))){
				valores[2] = request.getParameter("apellido");
			}else{
				valores[2] = "";
			}
			if(request.getParameter("fecha") != null && (!request.getParameter("fecha").toString().trim().equals(""))){
				valores[3] = request.getParameter("fecha");
			}else{
				valores[3] = "";
			}
			if(request.getParameter("genero") != null && (!request.getParameter("genero").toString().trim().equals(""))){
				valores[4] = request.getParameter("genero");
			}else{
				valores[4] = "";
			}
			if(request.getParameter("dept") != null && (!request.getParameter("dept").toString().trim().equals(""))){
				valores[5] = request.getParameter("dept");
			}else{
				valores[5] = "";
			}
			if(request.getParameter("direc") != null && (!request.getParameter("direc").toString().trim().equals(""))){
				valores[6] = request.getParameter("direc");
			}else{
				valores[6] = "";
			}
			if(request.getParameter("tel") != null && (!request.getParameter("tel").toString().trim().equals(""))){
				valores[7] = request.getParameter("tel");
			}else{
				valores[7] = "";
			}
			if(request.getParameter("cel") != null && (!request.getParameter("cel").toString().trim().equals(""))){
				valores[8] = request.getParameter("cel");
			}else{
				valores[8] = "";
			}
			if(request.getParameter("email") != null && (!request.getParameter("email").toString().trim().equals(""))){
				valores[9] = request.getParameter("email");
			}else{
				valores[9] = "";
			}
			if(request.getParameter("oferta") != null && (!request.getParameter("oferta").toString().trim().equals(""))){
				valores[10] = request.getParameter("oferta");
			}else{
				valores[10] = "No";
			}
			if(request.getParameter("userMail") != null && (!request.getParameter("userMail").toString().trim().equals(""))){
				userMail = request.getParameter("userMail");
				//System.out.println("UserMail: "+ request.getParameter("userMail"));
			}else{
				userMail = "Unknow";
			}
			
			System.out.println("Datos del formulario");
			for (int i = 0; i < valores.length; i++) {
				System.out.println(valores[i]);
			}
			
			
			try{	
				OracleDataSource odsDataSource = new OracleDataSource();//Objeto para la conexion.
				odsDataSource.setURL("jdbc:oracle:thin:" + Autenticacion.DB_USER_DEV + "/" + Autenticacion.DB_PASSWORD_DEV + Autenticacion.DB_URL_DEV); //Establecer canal de comunicacion hacia la BD.
				Connection conOracle = odsDataSource.getConnection(); //Crear conexión para la BD.
				Statement stateDML = conOracle.createStatement();//Objeto para instrucciones DML.
				
				//SQL INSERT
				if(request.getParameter("Registrar") != null){
					System.out.println("SQL INSERT");
					System.out.println("Registro a Agregar: ");
					strQuerry = "INSERT INTO CLIENTE (NOMBRE, APELLIDO, FECHA_NACIMIENTO, GENERO, PAIS, DIRECCION, NUMERO_PRINCIPAL, NUMERO_SECUNDARIO, EMAIL, NOVEDADES) VALUES ('" +
						valores[1] + "', '" +
						valores[2] + "', TO_DATE('" +
						valores[3] + "', 'YYYY-MM-DD'), '" +
						valores[4] + "', '" +
						valores[5] + "', '" +
						valores[6] + "', '" +
						valores[7] + "', '" +
						valores[8] + "', '" +
						valores[9] + "', '" +
						valores[10] + "')";
					stateDML.executeUpdate(strQuerry);
					System.out.println("Consultada ejecutada: " + strQuerry);
					//Llenar Bitacora
					strQuerry = "INSERT INTO AUDITORIA (USUARIO, OPERACION, REGISTRO_AFECTADO, DESCRIPCION) VALUES" +						"('"+userMail+"', 'INSERCCION', 0, 'Nuevo cliente agregado: "+valores[1]+" "+valores[2]+"')";
					stateDML.executeUpdate(strQuerry);
					conOracle.commit();//Confirmar cambio en la BD.
				}else{/*FIN INSERT*/}
				
				//SQL SELECT
				if (request.getParameter("Consultar") != null){	
					System.out.println("SQL SELECT");			
					//Combinaciones de condiciones
					if (valores[1] != null && valores[1].length() > 0) {
						condiciones.add("UPPER(NOMBRE) = UPPER('" + valores[1] + "')");
					}
					if (valores[2] != null && valores[2].length() > 0) {
						condiciones.add("UPPER(APELLIDO) = UPPER('" + valores[2] + "')");
					}
					if (valores[9] != null && valores[9].length() > 0) {
						condiciones.add("UPPER(EMAIL) LIKE UPPER('%" + valores[9] + "%')");
					}
					
					//Construir consulta SQL
					strQuerry = "SELECT ID, NOMBRE, APELLIDO, FECHA_NACIMIENTO, GENERO, PAIS, DIRECCION, NUMERO_PRINCIPAL, NUMERO_SECUNDARIO, EMAIL, NOVEDADES FROM CLIENTE";
					if (!condiciones.isEmpty()) {
						strQuerry += " WHERE ";
						for (int i = 0; i < condiciones.size(); i++) {
							if (i > 0) {
								strQuerry += " AND ";
							}else{}
								strQuerry += condiciones.get(i);
						}
					}
					//Ejcutar querry y retomamos un ResultSet
					ResultSet resultCliente = stateDML.executeQuery(strQuerry);
					System.out.println("Consultada a ejecutar: " + strQuerry);
					//Asignar data tomada a un array
					while(resultCliente.next()){
						arrayClientes.add(new Object[]{ 
							resultCliente.getString("id"),
							resultCliente.getString("nombre"),
							resultCliente.getString("apellido"),
							resultCliente.getString("fecha_nacimiento"),
							resultCliente.getString("genero"),
							resultCliente.getString("pais"),
							resultCliente.getString("direccion"),
							resultCliente.getString("numero_principal"),
							resultCliente.getString("numero_secundario"),
							resultCliente.getString("email"),
							resultCliente.getString("novedades")
						});
						System.out.println(resultCliente.getString("id"));
						System.out.println(resultCliente.getString("nombre"));
						System.out.println(resultCliente.getString("apellido"));
						System.out.println(resultCliente.getString("fecha_nacimiento"));
						System.out.println(resultCliente.getString("genero"));
						System.out.println(resultCliente.getString("pais"));
						System.out.println(resultCliente.getString("direccion"));
						System.out.println(resultCliente.getString("numero_principal"));
						System.out.println(resultCliente.getString("numero_secundario"));
						System.out.println(resultCliente.getString("email"));
						System.out.println(resultCliente.getString("novedades"));
						System.out.println("-----------------------------------------------");
					}
					resultCliente.close(); //Cerrar objeto ResultSet	
					request.getSession().setAttribute("catClientes", arrayClientes);
				}else{/*FIN SELECT*/}
				
				//SQL UPDATE
				if(request.getParameter("Actualizar") != null){
					System.out.println("SQL UPDATE");
					strQuerry = "UPDATE CLIENTE SET NOMBRE = '" + valores[1] + "', " +
						"APELLIDO = '" + valores[2] + "', " +
						"FECHA_NACIMIENTO = TO_DATE('" + valores[3] + "', 'YYYY-MM-DD'), " +
						"GENERO = '" + valores[4] + "', " +
						"PAIS = '" + valores[5] + "', " +
						"DIRECCION = '" + valores[6] + "', " +
						"NUMERO_PRINCIPAL = '" + valores[7] + "', " +
						"NUMERO_SECUNDARIO = '" + valores[8] + "', " +
						"EMAIL = '" + valores[9] + "', " +
						"NOVEDADES = '" + valores[10] + "' WHERE ID = " + valores[0];
					System.out.println("Consultada a ejecutar: " + strQuerry);
					
					if(valores[0] != "0"){
						stateDML.executeUpdate(strQuerry);
						//Llenar Bitacora
						strQuerry = "INSERT INTO AUDITORIA (USUARIO, OPERACION, REGISTRO_AFECTADO, DESCRIPCION) VALUES" +
							"('"+userMail+"', 'ACTUALIZACION', "+valores[0]+", 'Se modficaron los datos del cliente.')";
						stateDML.executeUpdate(strQuerry);
						conOracle.commit();//Confirmar cambio en la BD.
					}else{}
				}else{/*FIN UPDATE*/}
				
				//SQL DELETE
				if((request.getParameter("Eliminar") != null) && (request.getParameter("Eliminar").toString().trim().equals("SI"))){
					System.out.println("SQL DELETE");
					strQuerry = "DELETE FROM CLIENTE WHERE ID = " + valores[0];
					System.out.println("Consultada a ejecutar: " + strQuerry);
					
					if(!valores[0].equals("0")){
						stateDML.executeUpdate(strQuerry);
						//Llenar Bitacora
						strQuerry = "INSERT INTO AUDITORIA (USUARIO, OPERACION, REGISTRO_AFECTADO, DESCRIPCION) VALUES" +
							"('"+userMail+"', 'ELIMINACION', "+valores[0]+", 'Se dieron de baja todos los datos del cliente.')";
						stateDML.executeUpdate(strQuerry);
						conOracle.commit();//Confirmar cambio en la BD.
					}else{}
				}else{}
				conOracle.close();//Cerrar sesión
				
			} catch(SQLException err){
				err.printStackTrace();
				System.out.println("Error en en la conexion de la BD");
			}
			
			if(request.getParameter("Registrar") != null){
				response.sendRedirect("./screens/main.html");
			}else{
				response.sendRedirect("./screens/lista-clientes.jsp");
			}
			
	}
}

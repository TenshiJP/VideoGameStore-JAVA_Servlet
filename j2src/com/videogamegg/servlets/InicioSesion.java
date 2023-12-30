/*
 * Created on 18/10/2023
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
public class InicioSesion extends HttpServlet {

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
			// Varaibles
			String strQuerry = "", email ="", password = "", loginValue = "No", nombre = "", apellido = "";
			ArrayList credenciales = new ArrayList();
			
			//Validaciones
			if(request.getParameter("email") != null && (!request.getParameter("email").toString().trim().equals(""))){
				email = request.getParameter("email");
			}else{
				email = "";
			}
			if(request.getParameter("password") != null && (!request.getParameter("password").toString().trim().equals(""))){
				password = request.getParameter("password");
			}else{
				password = "";
			}		  
			
			try{	
				OracleDataSource odsDataSource = new OracleDataSource(); //Objeto para la conexion.
				odsDataSource.setURL("jdbc:oracle:thin:" + Autenticacion.DB_USER_DEV + "/" + Autenticacion.DB_PASSWORD_DEV + Autenticacion.DB_URL_DEV); //Establecer canal de comunicacion hacia la BD.
				Connection conOracle = odsDataSource.getConnection(); //Crear conexión para la BD.
				Statement stateDML = conOracle.createStatement(); //Objeto para instrucciones DML.
				
				//VALIDAR CREDENCIALES EN LA BD
				strQuerry = "SELECT NOMBRE, APELLIDO FROM USUARIO " +
					"WHERE EMAIL='"+email+"' AND PASS='"+password+"'";
				//Ejcutar querry y retomamos un ResultSet
				ResultSet resultUser = stateDML.executeQuery(strQuerry);
				//Asignar data tomada a un array
				while(resultUser.next()){
					nombre = resultUser.getString("nombre");
					apellido = resultUser.getString("apellido");
					loginValue="Si";
				}
				resultUser.close(); //Cerrar objeto ResultSet
				request.getSession().setAttribute("catNombre", nombre + " " + apellido);
				request.getSession().setAttribute("catUser", email);
				System.out.println("Cargando datos a la memoria..");
				//Insertar logueo al log
				if (loginValue == "Si"){
					strQuerry = "INSERT INTO LOG_LOGIN (USUARIO, LOGIN) VALUES ('"+email+"', 'EXITOSO')";					
				}else{
					strQuerry = "INSERT INTO LOG_LOGIN (USUARIO, LOGIN) VALUES ('"+email+"', 'FALLIDO')";
				}
				stateDML.executeUpdate(strQuerry);
				conOracle.commit();//Confirmar cambio en la BD.
				conOracle.close();//Cerrar sesión
				
			} catch(SQLException err){
				//err.printStackTrace();
				System.out.println("Error en en la conexion... ");
				loginValue="No";
			}
			
			if(loginValue.trim().equals("Si")){
				response.sendRedirect("index.jsp");
			}else{
				request.getSession().setAttribute("catCredenciales", "ERROR: e-Mail o contaseña incorrecta, por favor validar sus credenciales.");
				System.out.println("Cargando datos a la memoria..");
				response.sendRedirect("login-user.jsp");	
			}
	}
}

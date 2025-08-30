package com.ecobasketry.model.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connectors {
	public static Connection requestConnection()
	{
	Connection con=null;
	String url="jdbc:mysql://localhost:3306/ecobasket";
	String user="root";
	String pass="Kgowda@1999";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
		
		
	} catch (ClassNotFoundException | SQLException e) {
		
		e.printStackTrace();
	}
	
	return con;
	}

}

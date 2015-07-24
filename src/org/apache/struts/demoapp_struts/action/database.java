package org.apache.struts.demoapp_struts.action;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {
	
	public static Connection getConnection()
	{
		 Connection conn = null;
		try
		{
			 Class.forName("com.mysql.jdbc.Driver");
			 conn =
          	       DriverManager.getConnection("jdbc:mysql://72.13.93.200:3307/tpanagoda?" +
                             "user=tpanagoda&password=19900722");
			
			
		}
		catch (ClassNotFoundException ex) {
           ex.printStackTrace();
        }
		catch(SQLException se)
		{
			se.printStackTrace();
			
		}
		return conn;
	}
	
	
	
}

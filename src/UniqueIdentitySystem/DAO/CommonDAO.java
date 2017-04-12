package UniqueIdentitySystem.DAO;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.postgresql.jdbc3.Jdbc3PoolingDataSource;

// This class contains the DB Connection Only
// and all the DAO is calling the CommonDAO to 
//reterive the connection


// Singleton - it is a design pattern
// Create Single Object Only
public class CommonDAO {
	// 1. Eager Singleton - Object is already there when class is loaded
	// 2. Lazy Singleton - Object create on demand
	//private static CommonDAO commonDAOObject= new CommonDAO();
	private static CommonDAO commonDAOObject ;
	// this is private constructor
	private CommonDAO(){

	}

	public static  CommonDAO getObject(){
		synchronized(CommonDAO.class){
			if(commonDAOObject==null){
				commonDAOObject = new CommonDAO();
			}
		}
		return commonDAOObject;
	}

	public Connection getConnection() throws ClassNotFoundException, SQLException{
		// To Read Property File
		ResourceBundle rb = ResourceBundle.getBundle("db");
		Class.forName(rb.getString("drivername"));

		Connection con= DriverManager.
				getConnection(rb.getString("dburl")
						,rb.getString("userid")
						,rb.getString("password"));
		return con;
	}

	private static Jdbc3PoolingDataSource dataSource;
	
	public Connection getConnectionFromPool() throws URISyntaxException, SQLException {
		synchronized (commonDAOObject) {
			if (dataSource==null) {
				URI dbUri;
				dbUri = new URI(System.getenv("DATABASE_URL"));
				String username = dbUri.getUserInfo().split(":")[0];
				String password = dbUri.getUserInfo().split(":")[1];
				//			    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

				//pooling datasource config prop
				Jdbc3PoolingDataSource dataSource = new Jdbc3PoolingDataSource();
				dataSource.setServerName(dbUri.getHost());
				dataSource.setDatabaseName(dbUri.getPath().substring(1));
				dataSource.setPortNumber(dbUri.getPort());
				dataSource.setUser(username);
				dataSource.setPassword(password);
				//additional
				//				dataSource.setDataSourceName("defined");
				dataSource.setInitialConnections(1);
				dataSource.setMaxConnections(15);
			}
		}
		return dataSource.getConnection();
	}
	
	
}

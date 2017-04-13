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
//retrieve the connection


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
	public Connection getConnectionFromPoolHeroku() throws URISyntaxException, SQLException {
		synchronized(CommonDAO.class){
			if (dataSource==null) {
				URI dbUri;
				dbUri = new URI(System.getenv("DATABASE_URL"));
				String username = dbUri.getUserInfo().split(":")[0];
				String password = dbUri.getUserInfo().split(":")[1];
				//			    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

				//pooling datasource config prop
				dataSource = new Jdbc3PoolingDataSource();
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
	
	public Connection getConnectionFromPoolLocalhost() throws SQLException {
		synchronized(CommonDAO.class){
			if (dataSource==null) {
				/*URI dbUri;
				dbUri = new URI(System.getenv("DATABASE_URL"));
				String username = dbUri.getUserInfo().split(":")[0];
				String password = dbUri.getUserInfo().split(":")[1];
				//			    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
*/
				//pooling datasource config prop
				dataSource = new Jdbc3PoolingDataSource();
				dataSource.setServerName("ec2-50-19-89-124.compute-1.amazonaws.com");
				dataSource.setDatabaseName("dce5bo2d7q2tn3");
				dataSource.setPortNumber(5432);
				dataSource.setUser("rchbmhslsaaqag");
				dataSource.setPassword("5e6d14af07264aff9dee7753392f5d595a66d392746c5992c92ebb8f672a9fad");
				//additional
				//				dataSource.setDataSourceName("defined");
				dataSource.setInitialConnections(1);
				dataSource.setMaxConnections(15);
			}
		}
		return dataSource.getConnection();
	}
}

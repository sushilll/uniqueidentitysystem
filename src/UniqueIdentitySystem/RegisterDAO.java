package UniqueIdentitySystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import UniqueIdentitySystem.DAO.CommonDAO;

public class RegisterDAO {  
	  
public static int save(RegisterAction r){  
int status=0;  
try{  
/*Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","oracle");  */
	Connection con = CommonDAO.getObject().getConnectionFromPoolLocalhost();
  
PreparedStatement ps=con.prepareStatement("insert into citizen values(?,?,?,?,?)");  
ps.setString(1,r.getName());  
ps.setString(2,r.getPassword());  
ps.setString(3,r.getEmail());  
ps.setString(4,r.getGender());  
ps.setString(5,r.getCountry());  
          
status=ps.executeUpdate();  
  
}catch(Exception e){e.printStackTrace();}  
    return status;  
}  
}  
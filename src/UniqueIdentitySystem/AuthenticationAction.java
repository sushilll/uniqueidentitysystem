package UniqueIdentitySystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
 
import com.opensymphony.xwork2.ActionSupport;

import UniqueIdentitySystem.DAO.CommonDAO;
import UniqueIdentitySystem.DAO.SQLConstants;
 
public class AuthenticationAction extends ActionSupport implements SessionAware {
     
    private Map<String, Object> sessionMap;
    private String userName;
    private String password;
 
    public String login() throws ClassNotFoundException, SQLException {
        String loggedUserName = null;
        
        Connection con = CommonDAO.getObject().getConnectionFromPoolLocalhost();
		PreparedStatement pst = con.prepareStatement(SQLConstants.CITIZEN_LOGIN);
		pst.setString(1, userName);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
 
        // check if the userName is already stored in the session
        if (sessionMap.containsKey("userName")) {
            loggedUserName = (String) sessionMap.get("userName");
        }
        /*if (loggedUserName != null && loggedUserName.equals("admin")) {
            return SUCCESS; // return welcome page
        }*/
         
        // if no userName stored in the session,
        // check the entered userName and password
        /*if (userName != null && userName.equals("admin")
                && password != null && password.equals("nimda")) {
             
            // add userName to the session
            sessionMap.put("userName", userName);
             
            return SUCCESS; // return welcome page
        }*/
        if (rs.next()) {
        	sessionMap.put("userName", userName);
        	
        	rs.close();
        	pst.close();
        	con.close();
        	
			return SUCCESS;
			}
         
        // in other cases, return login page
        rs.close();
    	pst.close();
    	con.close();
        return INPUT;
    }
     
    public String logout() {
        // remove userName from the session
    	System.out.println("logout");
    	if (sessionMap.containsKey("userName")) {
            sessionMap.remove("userName");
        }
        return SUCCESS;
    }
 
    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
     
    public void setUserName(String userName) {
        this.userName = userName;
    }
     
    public void setPassword(String password) {
        this.password = password;
    }
}
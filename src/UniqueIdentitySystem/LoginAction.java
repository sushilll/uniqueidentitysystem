package UniqueIdentitySystem;

import java.sql.SQLException;

import org.omg.Messaging.SyncScopeHelper;

import com.opensymphony.xwork2.ActionSupport;

import UniqueIdentitySystem.DAO.LoginDAO;

public class LoginAction extends ActionSupport {

	private String usertype;
	private int userid;
	private String pwd;
	
	public String getUsertype() {
		return usertype;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String execute() throws ClassNotFoundException, SQLException {
		/*if (LoginDAO.login(this)) {
			return com.opensymphony.xwork2.Action.SUCCESS;
		}*/
		
		return com.opensymphony.xwork2.Action.ERROR;
	}
	
	/*public void validate() {
		if (usertype == null) {
			addFieldError("", "Please select usertype");
		}
		
	}
	*/
	public void validate()
	   {
	      if (usertype == null || usertype.trim().equals(""))
	      {
	         addFieldError("usertype","Please select usertype");
	      }
	      if (userid < 1000 || userid > 9999)
	      {
	         addFieldError("userid","Invalid userid");
	      }
	      if (pwd == null || pwd.trim().equals("")) {
	    	  addFieldError("pwd","enter password");
		}
	   }
}

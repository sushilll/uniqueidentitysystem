package UniqueIdentitySystem.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import UniqueIdentitySystem.LoginAction;

public class LoginDAO {
	
	public static boolean login(LoginAction loginAction) throws ClassNotFoundException, SQLException {
		
		Connection con = CommonDAO.getObject().getConnectionFromPoolLocalhost();
		PreparedStatement pst = null;
		switch (loginAction.getUsertype()) {
		case "citizen":
			pst = con.prepareStatement(SQLConstants.CITIZEN_LOGIN);
			break;
		case "admin":
			pst = con.prepareStatement(SQLConstants.ADMIN_LOGIN);
			break;
		case "rta":
			pst = con.prepareStatement(SQLConstants.RTA_LOGIN);
			break;
		case "aai":
			pst = con.prepareStatement(SQLConstants.AAI_LOGIN);
			break;
		case "staff":
			pst = con.prepareStatement(SQLConstants.STAFF_LOGIN);
			break;
		case "crime":
			pst = con.prepareStatement(SQLConstants.CRIME_LOGIN);
			break;

		default:
			break;
		}
		
		pst.setInt(1, loginAction.getUserid());
		pst.setString(2, loginAction.getPwd());
		System.out.println(pst.toString());
		ResultSet rs = pst.executeQuery();
		
		if (rs.next()) {
			System.out.println("logged in");
			/*int i = 0;
			while (i<n) {
				System.out.println(rs.absolute(i));
			}*/
			rs.close();
			pst.close();
			con.close();
			return true;
		}
		rs.close();
		pst.close();
		con.close();
		
		return false;
	}

}

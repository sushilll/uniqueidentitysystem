package UniqueIdentitySystem.DAO;

public interface SQLConstants {
	static final String CITIZEN_LOGIN = "select name,pwd from citizen where uid=? and pwd=?";
	static final String RTA_LOGIN = "select name,pwd from rta where uid=? and pwd=?";
	static final String CRIME_LOGIN = "select name,pwd from crime where uid=? and pwd=?";
	static final String AAI_LOGIN = "select name,pwd from aai where uid=? and pwd=?";
	static final String ADMIN_LOGIN = "select name,pwd from admin where uid=? and pwd=?";
	static final String STAFF_LOGIN = "select name,pwd from staff where uid=? and pwd=?";
	static final String REGISTER_SQL = "INSERT INTO public.citizen(aappno, uid, pwd, name, fname, mobile, occupation, photo, address, gender, uid_status, pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
}


public interface SQLConstants {
String LOGIN_SQL = "select userid,password from citizen where userid=? and password=?";
String REGISTER_SQL = "INSERT INTO public.citizen(aappno, uid, pwd, name, fname, mobile, occupation, photo, address, gender, uid_status, pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
}

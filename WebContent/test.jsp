<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="UniqueIdentitySystem.DAO.CommonDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = null;
		try {
			con = CommonDAO.getObject().conFromPool();
			out.println(con);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from citizen;");
			ResultSetMetaData metadata = rs.getMetaData();
			int n = metadata.getColumnCount();
			while (rs.next()) {
				int i = 1;
				if (i < n) {
					out.println(rs.getString(i++));
				}
			}
			st.close();
			con.close();
		} catch (SQLException e) {
			// log error
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					out.println("closing conn.:;';';';'';");
					con.close();
				} catch (SQLException e) {
				}
			}
		}
	%>
</body>
</html>
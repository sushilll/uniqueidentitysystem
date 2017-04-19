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
			con = CommonDAO.getObject().getConnectionFromPoolLocalhost();
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
			out.println("1st exception");
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					out.println("closing conn.:;';';';'';");
					con.close();
				} catch (SQLException e) {
					out.println("problem in closing");
				}
			}
		}
	%>
	
	<%@ taglib uri="/struts-tags" prefix="s" %>  
  
<%-- <s:form action="register">  
<s:textfield name="name" label="UserName"></s:textfield>  
<s:password name="password" label="Password"></s:password>  
<s:textfield name="email" label="Email"></s:textfield>  
<s:radio list="{'male','female'}" name="gender"></s:radio>  
<s:select cssStyle="width:155px;" list="{'india','pakistan','other'}"  name="country" label="Country"></s:select>  
  
<s:submit value="register"></s:submit>  
  
</s:form> --%>

<center>
        <h3>Login</h3>
        <s:form action="login" method="post">
            <s:textfield name="userName" label="Enter User Name" />
            <s:password name="password" label="Enter Password" />
            <s:submit label="Login" />
        </s:form>
    </center>
</body>
</html>
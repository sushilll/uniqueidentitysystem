<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><center>
        <h3>Welcome <i>${sessionScope.userName}</i>, you have logged in successfully!</h3>
        <h3><a href="logout">Logout</a></h3>
    </center>
</body>
</html>
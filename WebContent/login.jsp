<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>


<body>




<div class="container-fluid">
	<form id="myform" action="login" method="post" class="form-horizontal">

		<div class="input-group" data-toggle="buttons">
			<span class="input-group-addon">I am</span> <label
				class="btn btn-default"> <input type="radio" name="usertype"
				value="admin" <s:actionerror />/> Admin
			</label> <label class="btn btn-default active"> <input type="radio"
				name="usertype" value="citizen" /> Citizen
			</label> <label class="btn btn-default"> <input type="radio"
				name="usertype" value="staff" /> Staff
			</label> <label class="btn btn-default"> <input type="radio"
				name="usertype" value="crime" /> Crime
			</label> <label class="btn btn-default"> <input type="radio"
				name="usertype" value="rta" /> RTA
			</label> <label class="btn btn-default"> <input type="radio"
				name="usertype" value="aai" /> AAI
			</label>
		</div>

		<div class="input-group">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-user"></i></span> <input name="userid"
				class="form-control" type="number" id="username"
				placeholder="Enter user id here"  <s:actionerror />/>
		</div>
		<div class="input-group">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-lock"></i></span><input name="pwd"
				class="form-control" type="password" id="pwd"
				placeholder="Enter password here" <s:actionerror/>  />
		</div>
		<br>
		<input type="submit" class="btn btn-default" value="Login" />
		<a href="#" style="margin-left: 5px;">Forgot Password</a>
	</form>
</div>
</body>
</html>

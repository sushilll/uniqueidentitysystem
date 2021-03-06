<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,300italic,400italic" />

<!-- Latest compiled and minified CSS -->
<!--<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!--<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">-->
<!--<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">-->
<link rel="stylesheet" href="css/custom.css" />
<title>Unique Identity System</title>
</head>
<body>
	
	<!--Login Modal -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">


					<s:form action="login" method="post" class="form-horizontal">

						<div class="input-group" data-toggle="buttons">
							<span class="input-group-addon">I am</span> <label
								class="btn btn-default"> <input type="radio"
								name="usertype" value="admin" /> Admin
							</label> <label class="btn btn-default active"> <input
								type="radio" name="usertype" value="citizen" /> Citizen
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
								class="form-control" type="text" id="username"
								placeholder="Enter user id here" required />
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input name="pwd"
								class="form-control" type="password" id="pwd"
								placeholder="Enter password here" required />
						</div>
						<br>
						<input type="submit" class="btn btn-default" value="Login" />
						<a href="#" style="margin-left: 5px;">Forgot Password</a>
					</s:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--SIgn up Modal -->
	<div id="SignupModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Sign up</h4>
				</div>
				<div class="modal-body">
					<s:form action="registration" method="post" class="form-horizontal"
						onsubmit="return checkSignupForm(this);">
						<div class="form-group">
							<label class="control-label col-xs-4" for="regDate">Registration
								Date</label>
							<div class="col-xs-8">
								<input name="regDate" type="date" class="form-control"
									id="regDate" disabled />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4" for="name">Name</label>
							<div class="col-xs-8">
								<input name="name" class="form-control" type="text" id="name"
									placeholder="Enter Full Name here" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4" for="fathersname">Father's
								Name</label>
							<div class="col-xs-8">
								<input name="fname" class="form-control" type="text"
									id="fathersname" placeholder="Enter Father's Name" required />
							</div>
						</div>
						<div class="form-group">
							<label for="dob" class="control-label col-xs-4"><i
								class="fa fa-calendar"></i> Date Of Birth</label>
							<div class="col-xs-8">
								<input name type="date" class="form-control" id="dob" required />
							</div>
						</div>
						<div class="form-group">
							<label for="mobileno" class="control-label col-xs-4"><i
								class="fa fa-phone"></i> Mobile no.</label>
							<div class="col-xs-8">
								<input type="text" pattern="[0-9]{10}" id="mobileno"
									class="form-control" placeholder="10 digit mobile no." required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4 loginlabel" for="pwd1"><i
								class="fa fa-lock"></i> Password</label>
							<div class="col-xs-8">
								<input class="form-control" type="password" id="pwd1"
									placeholder="Enter password here" name="pwd1"
									onchange="form.pwd2.pattern = this.value;" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4 loginlabel" for="pwd2"><i
								class="fa fa-lock"></i> Confirm Password</label>
							<div class="col-xs-8">
								<input title="Please enter the same Password as above"
									class="form-control" type="password" id="pwd2"
									placeholder="Repeat password here" name="pwd2"
									onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
									required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4"> <i
								class="fa fa-question"></i> Secret Question
							</label>
							<div class="col-xs-8">
								<input class="form-control" type="text" name="secque" required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-4"> <i
								class="fa fa-archive"></i> Answer
							</label>
							<div class="col-xs-8">
								<input class="form-control" type="text" name="ans" required />
							</div>
						</div>
						<div class="col-xs-offset-4">
							<input type="submit" class="btn btn-default" value="Sign up"
								style="margin-left: 10px;" required />
						</div>
					</s:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--navbar-->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#collapsibleMenu">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> Unique Identity System</a>
			</div>
			<div id="collapsibleMenu" class="collapse navbar-collapse">
				<div class="nav navbar-nav">
					<li class="active"><a href="test.jsp">Home</a></li>
					<li><a href="#" id="about" data-toggle="collapse"
						data-target="#collapsibleMenu">About</a></li>
				</div>
				
				<ul class="nav navbar-nav navbar-right">
					<li>
						<!--trigger sign up modal-->
						<button type="button" class="btn btn-default navbar-btn"
							data-toggle="modal" data-target="#SignupModal"
							style="margin-left: 8px">
							<span class="glyphicon glyphicon-user"></span> Sign up
						</button>
					</li>
					<li>
						<!-- Trigger Login modal button -->
						<button type="button" class="btn btn-info navbar-btn"
							data-toggle="modal" data-target="#loginModal"
							style="margin-left: 8px">
							<span class="glyphicon glyphicon-log-in"></span> Login
						</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>
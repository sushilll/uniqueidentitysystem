<%@ taglib uri="/struts-tags" prefix="s"%>
<s:include value="navbar.jsp"></s:include>
<div id="banner">
	<h1>Unique Identity System</h1>
	<p>For the convenience of the citizens</p>
	<ul class="list-inline">
		<li><a href="#" class="btn btn-default" data-toggle="modal"
			data-target="#SignupModal"><h4>Sign up</h4></a></li>
		<!--trigger login modal-->
		<li><a href="#" class="btn btn-info" data-toggle="modal"
			data-target="#loginModal"><h4>Login</h4></a></li>
	</ul>
</div>

<div class="col-xs-offset-1 col-xs-10 middle">
	<div>
		<h4>The application deals with allowing the citizens to register
			for a unique identity. The application intends to provide secure
			travel facilities. The travel functionalities involve passport and
			license.</h4>
		<h4>The server maintains personal profile along with the photo in
			a central server at the time of registration. This server then
			provides data to concerned departments looking for citizen
			information.</h4>
		<br />
		<h4>The aadhaar server maintains personal profile along with the
			photo in a central server at the time of registration. This server
			then provides data to concerned departments looking for citizen
			information.</h4>
	</div>
</div>


<s:include value="bottom.jsp"></s:include>
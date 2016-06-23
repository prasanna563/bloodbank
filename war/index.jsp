
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html itemscope itemtype="http://schema.org/Article">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/BloodBank/war/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="/BloodBank/war/favicon.ico" type="image/x-icon">
<link
	href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/shift.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css"> 
<link rel="stylesheet" href="css/main.css">
<!-- <script src="js/login.js"></script> -->

<title>FULL BloodBank</title>
</head>
<body id="b1">


	<div class="nav">
		<div class="container">
			<ul class="nav navbar-nav navbar-left">
				<li id="aboutUs"><a href="aboutUs.jsp" target="new">About
						Us</a></li> 
						<% 
						
	String userName = (String) session.getAttribute("name");
	if(userName == null){%>
		<li id="member"><a href="SignUp.jsp" target="new">Become a
						Member</a></li>
	<%} %>
				<!-- <li id="member"><a href="SignUp.jsp" target="new">Become a
						Member</a></li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<% 
						
	String user = (String) session.getAttribute("name");
			
	if(user == null){%>
				<li id="login"><a href="" style="text-decoration: none"
					data-toggle="modal" data-target="#myModal">Log In</a></li>
					<%} %>
				<li><a href="#">Emergency Helpline</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal LoginContent-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<center>
						<h4>
							<span class="glyphicon glyphicon-log-in"></span> Login
						</h4>
					</center>
				</div>


				<div class="tab-content">
			
						<div class="modal-body" style="padding: 40px 50px;">
							<form method="post" action="/userlogin">
								<div class="form-group">

									<label>Username</label> <input type="text" class="form-control"
										id="usrname" placeholder="Enter email" name="username"><span
										class="error_form" id="uname_err" style="color: red"></span>
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control" id="psw" placeholder="Enter password"
										name="password"><span class="error_form" id="pass_err"
										style="color: red"></span>
								</div>
								<br>
								<button type="submit" class="btn btn-success btn-block">
									<span class="glyphicon glyphicon-off"></span> Login
								</button>
								<button type="submit" class="btn btn-success btn-block"
									onclick="window.location.href='SignUp.jsp'"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-user"></span> SignUp
								</button>
							</form>
							
							<!-- Footer -->
							<div class="modal-footer">
								<p>
									<a href="forgotPassword.jsp" target="new">Forgot Password?</a>
								</p>
							</div>
							<!-- Footer closed -->
							
						</div>
						<!-- Modal body closed -->
						
				</div>


			</div>
				<!-- Login Modal Content closed -->
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">
			<h1>Save Lives by Donating Blood.</h1>
			<p>Donate Blood and Become a Hero</p>
		</div>
	</div>

	<div class="neighborhood-guides">

		<div class="container">
			<h2>Why do we Donate Blood ?</h2>
			<p>Blood cannot be manufactured in factories; it can only come
				from generous donors.</p>
			<div class="row"></div>
		</div>
	</div>

	<div class="learn-more">

		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h3>Do you know your Blood Volume ?</h3>
					<p>
						<a href="#">Check Here</a>
					</p>
				</div>
				<div class="col-md-4">
					<h3>Engage With Us</h3>
					<p>
						<a href="#">For Hospitals</a>
					</p>
				</div>
				<div class="col-md-4">
					<h3>Trust and Safety</h3>
					<p>
						<a href="#">Learn about trust at SaveLife</a>
					</p>
				</div>
			</div>
		</div>

		<footer style="text-align:right"> &copy; Donate Blood 2016 </footer>
	</div>

	<script>
	</script>
</body>
</html>
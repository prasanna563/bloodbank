<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/donateBlood.css">
<title>Donate Blood</title>
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		String username = null;
		String userName = null;
		//allow access only if session exists
		if (session.getAttribute("username") != null || session.getAttribute("name") != null) {
			 username = (String) session.getAttribute("username");
			 userName = (String) session.getAttribute("name");
		} 
		else {
			response.sendRedirect("login.jsp");

		}
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					username = cookie.getValue();
				} else if (cookie.getName().equals("name")) {
					userName = cookie.getValue();
				}
			}
		}
	%>

	<div class="nav" style="background-color: #df0303">

		<div class="container">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="index.jsp" target="new"
					style="text-decoration: none"><span
						class="glyphicon glyphicon-home"></span> Home</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"
					style="text-decoration: none"><span
						class="glyphicon glyphicon-user"></span> User</a>
					<ul class="dropdown-menu">
						<li><a href="">Emergency Help</a></li>
						<li><a href="/servlet6">Logout</a></li>
					</ul>
			</ul>
		</div>

	</div>

	<div class="container" id="d1">
		<div class="page-header">
			<h1 style="text-align: center">
				<span class="glyphicon glyphicon-pencil"> ChangePassword</span>
			</h1>
		</div>
		<form method="post" action="changepassword" role="form" name="form1"">
			
			<div class="form-group">
				<label>Email</label> <input type="text" class="form-control"
					id="userMail" name="mailid" required
					placeholder="Enter your e-mail" />
			</div>
			
			<div class="form-group">
				<label>Old Password</label> <input type="password" class="form-control"
					id="oldPass" name="oldPass" required
					placeholder="Enter your oldpassword" />
			</div>

			<div class="form-group">
				<label>New Password</label> <input type="password" class="form-control"
					id="newPass" name="newPass" required
					placeholder="Enter your newpassword" />
			</div>

			<div class="form-group">
				<label>Confirm Password</label> <input type="password"
					class="form-control" id="confPass" name="confPass" required
					placeholder="Confirm your password" />
			</div>

			<button type="submit" class="btn btn-default">
				<strong>Submit</strong>
			</button>
			<br> <br>
		</form>

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


</body>
</html>
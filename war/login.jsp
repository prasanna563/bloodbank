<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("max-age", 0);
response.setDateHeader("Expires", 0); %>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link rel="shortcut icon" href="/BloodBank/war/favicon.ico" type="image/x-icon">
<link rel="icon" href="/BloodBank/war/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/main1.css">
<title>Login</title>
</head>
<body>
<div class="nav">
      <div class="container">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="aboutUs.jsp" target="new">About Us</a></li>
          <li><a href="SignUp.jsp" target="new">Become a Member</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
		  <li><a href="index.jsp" style="text-decoration:none"><span class="glyphicon glyphicon-home"></span> Home</a></li>
          <li><a href="#">Emergency Helpline</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
    </div>
    <br>
    <br>
    <div class="container" style="margin-bottom:53.5px">
        <form method="post" action="servlet2">
        
        <div class="form-group">
           
              <label>Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email" name="username"><span class="error_form" id="uname_err" style="color:red"></span>
            </div>
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control" id="psw" placeholder="Enter password" name="password"><span class="error_form" id="pass_err" style="color:red"></span>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="">Remember me</label>
            </div>
        
        <br><div class="g-signin2" data-onsuccess="onSignIn"></div>
              <br><button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
			  <button type="submit" class="btn btn-success btn-block" onclick="window.location.href='SignUp.jsp'" data-dismiss="modal"><span class="glyphicon glyphicon-user"></span> SignUp</button>
        
        		<br><p style="margin-left: 1000px"><a href="" target="new">Forgot Password?</a></p>
        
        </form>
      </div>
   
    <div class="learn-more">
	 
	  <div class="container">
		<div class="row">
		
	      <div class="col-md-4">
			<h3>Do you know your Blood Volume ?</h3>
			<p><a href="#">Check Here</a></p>
	      </div>
		  <div class="col-md-4">
			<h3>Engage With Us</h3>
			<p><a href="#">For Hospitals</a></p>
		  </div>
		  <div class="col-md-4">
			<h3>Trust and Safety</h3>
			<p><a href="#">Learn about trust at SaveLife</a></p>
		  </div>
	    </div>
	  </div>
	  
	  <footer style="text-align:right">
&copy; Donate Blood 2016		
</footer>
	</div>
    
</body>
</html>
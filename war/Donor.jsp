<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/findDonar.css">
<!-- <script src="js/fetch.js"></script> -->
<title>Donate Blood</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		String userName = null;
		//allow access only if session exists
		if (session.getAttribute("username") != null) {
			/* userName = (String) session.getAttribute("username"); */
			response.sendRedirect("findingDonor.jsp");
		} else if (session.getAttribute("name") != null) {
			/* RequestDispatcher rd = request.getRequestDispatcher("Donor.jsp");
			rd.forward(request, response); */
			//response.sendRedirect("Donor.jsp");
			userName = (String) session.getAttribute("name");
		} else {
			response.sendRedirect("login.jsp");

		}
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					userName = cookie.getValue();
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
						class="glyphicon glyphicon-user">
						<%if(session.getAttribute("name") != null) {
					
					  if(cookies !=null){
					  for(Cookie cookie : cookies){
					      if(cookie.getName().equals("name")) 
					      	userName = cookie.getValue();
					      
					      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
					  }
					  }else{
					      sessionID = session.getId();
					  }out.print(userName);
			   }
		   
		   %>
						</span> </a>
					<ul class="dropdown-menu">
						<li><a href="">Change Password</a></li>
						<li><a href="">Emergency Helpline</a></li>

						<li><a href="/servlet6">Logout</a></li>

					</ul>
			</ul>
		</div>

	</div>

	<br>
	<div class="container">
		<br>
		<div class="col-md-10">
			<p style="margin-left: 450px; font-size: 24px">
				<strong>Search for Donor</strong>
			</p>
			<hr style="margin-left: 200px; border-top: 1px solid red">
			<p id="header" style="margin-left: 400px">Request your Blood Here</p>
			<br> <label style="margin-left: 250px">Blood Group:</label> <input
				type="radio" class="bloodGroup" name="bloodgroup" value="A+"
				style="margin-left: 20px" />A+ <input type="radio"
				class="bloodGroup" name="bloodgroup" value="A-"
				style="margin-left: 20px" />A- <input type="radio"
				class="bloodGroup" name="bloodgroup" value="B+"
				style="margin-left: 20px" />B+ <input type="radio"
				class="bloodGroup" name="bloodgroup" value="B-"
				style="margin-left: 20px" />B- <input type="radio"
				class="bloodGroup" name="bloodgroup" value="O+"
				style="margin-left: 20px" />O+ <input type="radio"
				class="bloodGroup" name="bloodgroup" value="O-"
				style="margin-left: 20px" />O- <input type="radio"
				class="bloodGroup" name="bloodgroup" value="AB+"
				style="margin-left: 20px" />AB+ <input type="radio"
				class="bloodGroup" name="bloodgroup" value="AB-"
				style="margin-left: 20px" />AB-
			<button type="button" id="search" name="search" style="margin-left:20px" class="btn btn-default"><strong>Search</strong></button>
			<p style="margin-top: 15px">
				<span id="disp"> </span> <span id="disp1"> </span>
			</p>
			<br> <label style="margin-left: 250px">Units Required:</label> <select
				name="bloodgroup" id="bldgrp" style="margin-left: 20px" required>
				<option value="">Number of units</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>

			</select>

			<div id="result" style="height: 50px;"></div>

			<button type="submit" class="btn btn-default" id="requestBlood"
				style="margin-left: 400px">Request for BloodGroup</button>

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
		$("document").ready(function() {
			
			$("#search").click(function(){
				
					var bg = $("input[name=bloodgroup]:checked").val();
					//var units = $('#bldgrp').find(":selected").text();
					
					$.ajax({

						type : 'GET',
						url : '/fetchdonor',
						data : {
							bg : bg
						},
						success : function(data) {
							var result = parseInt(data);
							//var newResult = parseInt(result/2);
							if(data == "Sorry No match found"){
								$("#disp").html(data).css({"color":"red","font-size":"20px","margin-left":"250px","font-family":"Verdana","text-align":"center"});
								}
							else if(result == 1){
								$("#disp").html("Available "+ result+ " unit").css({"color":"green","font-size":"20px","margin-left":"250px","font-family":"Verdana","text-align":"center"});
							}
							else{
								$("#disp").html("Available "+ result +" units").css({"color":"green","font-size":"20px","margin-left":"250px","font-family":"Verdana","text-align":"center"});
								
							}
							
							$("#bldgrp").change(function(unit){
								units = $(unit.currentTarget).val();
								console.log(result);
								if(result < units){
									$("#requestBlood").attr("disabled", true);
								}else{
									$("#requestBlood").attr("disabled", false);
								}
							});
							
							}
					});	

					});
			
			
					$("#requestBlood").click(function (){
						var bg = $("input[name=bloodgroup]:checked").val();
						var units = $('#bldgrp').find(":selected").text();
						
						$.ajax({

							type : 'GET',
							url : '/requestblood',
							data : {
								bg : bg,
								units : units
							},
							success : function(data){
								
							alert(data);
								}
							});
						$(document).ajaxSuccess(function (){
							window.location="homepage.jsp";
						});
					});
					
				});
			
	</script>

</body>
</html>
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
		String userName = null;
		//allow access only if session exists
		if (session.getAttribute("username") != null) {
			/* userName = (String) session.getAttribute("username"); */
			response.sendRedirect("donateBloodAdmin.jsp");
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
						<li><a href="">Emergency Help</a></li>
						<li><a href="/servlet6">Logout</a></li>
					</ul>
			</ul>
		</div>

	</div>

	<div class="container" id="d1">
		<div class="page-header">
			<h1 style="text-align: center">
				<span class="glyphicon glyphicon-pencil"> Donate Blood</span>
			</h1>
		</div>

		<div class="col-md-2 sidenav">
			<p>
				<a href="#">Who Can Donate Blood</a>
			</p>
			<p>
				<a href="#">Facts about Blood</a>
			</p>
			<p>
				<a href="#"></a>
			</p>
		</div>
		<div class="vr">&nbsp;</div>
		<div class="col-md-8">
			<!-- <form method="post" action="donateblood" role="form" name="form1""> -->
				<div class="form-group">
					<label>Name</label> <input type="text" class="form-control"
						id="name" name="name1" required placeholder="Enter your name" />
				</div>

				<div class="dropdown">
					<label>Gender:</label> <input type="radio" id="male" name="gender"
						value="Male" class="gender" />Male <input type="radio" name="gender"
						value="Female" id="female" class="gender" />Female
				</div>

				<div class="dropdown" style="width:130%">
					<label>Blood Group:</label> <select class="bg" name="bloodgroup" id="bloodgroup"
						required>
						<option value="">---</option>
						<option value="A+">A+</option>
						<option value="B+">B+</option>
						<option value="O+">O+</option>
						<option value="AB+">AB+</option>
						<option value="AB-">AB-</option>
						<option value="B-">B-</option>
						<option value="A-">A-</option>
						<option value="O-">O-</option>
					</select>
				</div>
				<br>

				<div class="form-group">
					<label>Phone Number :</label> <input type="tel"
						class="form-control" id="phn" name="phonenumber" required
						placeholder="Enter your Phone Number" />
				</div>
				<br>
				<div class="form-group">
					<label>Select the date</label> <input type="date" name="dat"
						id="date1" value=" "/> <br>
				</div>

				<div class="form-group">
					<label>Select Your Nearest Area:</label> <select class="areas"
						name="areas" id="areas" required>
						<option value="">Select Area</option>
						<option value="Adambakkam">Adambakkam</option>
						<option value="Adayar">Adayar</option>
						<option value="Guindy">Guindy</option>
						<option value="Mylapore">Mylapore</option>
						<option value="RA Puram">RA Puram</option>
						<option value="Shollinganallur">Shollinganallur</option>
						<option value="Tambaram">Tambaram</option>
						<option value="Taramani">Taramani</option>
					</select>
				</div>
				<br>

				<button type="submit" class="btn btn-default" id="donate">
					<span class="glyphicon glyphicon-tint" style="color: #df0303"></span>
					<strong>Donate</strong>
				</button>
				<br> <br>
			<!-- </form> -->

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
	
	$(document).ready(function(){
		
		$("#donate").click(function(){
			
			var userName = $("#name").val();
			
			var gender = $("input[name=gender]:checked").val();	
			
			var bloodGroup = $('#bloodgroup').find(":selected").text();
			
			var phoneNumb = $("#phn").val();
			
			var dates = $("#date1").val();
			
			var area = 	$('#areas').find(":selected").text();
			
			$.ajax({
				
				type : 'POST',
				url : '/donateblood',
				data :{
					  userName:userName,
					  gender:gender,
					  bloodGroup:bloodGroup,
					  phoneNumb:phoneNumb,
					  dates:dates,
					  area:area
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("max-age", 0);
	response.setDateHeader("Expires", 0);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/findDonar.css">
<!--   <script src="js/organize.js"></script> -->
<title>Organize Blood Camp</title>
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
			response.sendRedirect("organizeCampAdmin.jsp");
		} else if (session.getAttribute("name") != null) {

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

	<div class="find-donor">
		<br>
		<div class="container">
			<br>
			
			<div class="col-md-4">
				<p style="margin-left: 70px">
					<strong>Organize a Camp</strong>
				</p>
				<hr>

				<input type="text" list="listofNames" id="nameDetails" name="nameDetails" placeholder="Search..."
					style="border: none; height: 30px; width: 200px;">
					<datalist id="listofNames">
					
					</datalist>
					
				<button type="button" class="btn btn-default click" data-toggle="modal"
					data-target="#myModal" style="width: 10%">
					<span class="glyphicon glyphicon-plus"></span>
				</button>
				
				<div id="display"style="height: 400px; width: 300px; overflow: auto">
				
					<ul></ul>
				</div>


			</div>


			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					Modal OrganizeContent
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<center>
								<h4>
									<span class="glyphicon glyphicon-calendar"></span> Organize
									Camp
								</h4>
							</center>
						</div>
						
						<div class="modal-body" style="padding: 40px 50px;">
							
								<div class="form-group">

									<label>FirstName</label> <input type="text" class="form-control"
										id="fname" placeholder="Enter FirstName" name="fname">
								</div>
								
								<div class="form-group">

									<label>LastName</label> <input type="text" class="form-control"
										id="lname" placeholder="Enter LastName" name="lname">
								</div>
								
								<div class="form-group">
									<label>E-mail:</label>
									<input type="email" class="form-control" id="email" name="email" required placeholder="Enter your mail id" />
								</div>
								
								<div class="form-group">
									<label>Date</label> <input type="date" name="dat" id="dat"><br>
								</div>
								
								<div class="form-group">
  									<label>Venue:</label>
  									<textarea class="form-control" rows="5" name="venue" required id="venueDetails"></textarea>
								</div>

								<button type="button" class="btn btn-default organize" data-dismiss="modal" >
									<span class="glyphicon glyphicon-ok"></span> Organize
								</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<span class="glyphicon glyphicon-remove-circle"></span> Cancel
								</button>
							
						</div>

						<div class="modal-footer">
							<p>Thank You for Contacting us</p>
						</div>
					</div>

				</div>
			</div>

			<div class="vr">&nbsp;</div>
			<div class="col-md-8">

				
				<br>

				<div id="result">
				
				</div>

			</div>

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

<!-- <script src="/js/organizeCamp/organizeCamp.js"></script> -->
<script >
$("document").ready(function(){
	
	$(document).on("click",".click",function(){
		$("#name").val("");
		$("#dat").val("dd-mm-yyyy");
		
	});
	
	$(document).on("click",".organize",function(){
		
		var fname = $("#fname").val();
		var lname = $("#lname").val();
		var email = $("#email").val();
		var date = $("#dat").val();
		var venue = $("#venueDetails").val();
		//console.log(name);
		
		$.ajax({

			type : 'POST',
			url : '/organizeCamp',
			data : {
				fname : fname,
				lname : lname,
				email : email,
				date  : date,
				venue : venue
			},
			success : function(data){
				console.log(data);
				
				$("#disp").append("<li class='result'>"+ data +"</li>");
				
				}
			});
		
		
		
	});
	
	 $(document).ready(function(){
		$.ajax({
			//var concatText = $("#display").val();
			type : 'GET',
			url: '/fetchOrganize',
			success : function(data){
				console.log(data);
				var arr = data.split(',');
				console.log(arr);
				
				for(i=0;i<arr.length-1;i++){
					
				console.log(arr[i]);	
				$("#display ul").append("<br><li class='result' id='resultDetails'>"+arr[i]+"</li>");
				
				}
			
				}
		
		});
		
		$(document).on("click",".result",function(){
			var resultName = $(this).text();//pras anna
			console.log(resultName);
			$.ajax({
				type : 'GET',
				url  : '/fetchOrganizeDetails?resultName='+resultName,
				success : function(data){
					console.log(data);
					var details = data.split(",");
					console.log(details);
					$("#result").html("");
					
						$("#result").append("<br><label style='margin-left:200px'>FirstName :  </label><input type='text' class='organizeDetails' value="+ details[0] + "><br>");
						$("#result").append("<br><label style='margin-left:200px'>LastName 	:  </label><input type='text' class='organizeDetails' value="+ details[1] + "><br>");
						$("#result").append("<br><label style='margin-left:200px'>Date      :  </label><input type='date' class='organizeDetails' value="+ details[2] + "><br>");
						$("#result").append("<br><label style='margin-left:200px'>Venue     :  </label><input type='textarea' class='organizeDetails' value="+ details[3] + ">");
						  
						
					
				}
			});
		});
		
		
	}); 
	
	 $(document).ready(function (){
		
		 $(document).keyup(function(e){
				var namedetails = $("#nameDetails").val();
				
				$.ajax({
					type : 'GET',
					url  : '/searchOrganizeDetails?namedetails='+namedetails,
					success : function(data){
						var details = data.split(",");
						console.log(details);
						$("#listofNames").html("");
						for(i=0; i<details.length;i++){
							$("#listofNames").append("<option value='"+ details[i] +"'>");
							}
							
						if(e.keyCode == 13){
							
							var resultName = $("#nameDetails").val();
							//console.log(resultName)
							//var resultNames = resultName.split(" ");
							
							console.log()
							$.ajax({
								type : 'GET',
								url  : '/fetchOrganizeDetails?resultName='+resultName,
								success : function(data){
									console.log("response : "+data);
									var details = data.split(",");
									//console.log(details);
									$("#result").html("");
									
										$("#result").append("<br><label>FirstName : </label><input type='text' class='organizeDetails' value="+ details[0] + "><br>" );
										$("#result").append("<br><label>LastName  : </label><input type='text' class='organizeDetails' value="+ details[1] + "><br>" );
										$("#result").append("<br><label>Date      : </label><input type='date' class='organizeDetails' value="+ details[2] + "><br>" );
										$("#result").append("<br><label>Venue     : </label><input type='text' class='organizeDetails' value="+ details[3] + "><br>" );
									
								}
							});
						}		
						 	
						
					}
				});
				
				
			});
		 
	 });
	 
	 
	 $(document).ready(function (){
		 
	 });
	 
});
</script>


</body>
</html>
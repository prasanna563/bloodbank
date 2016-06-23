<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/findDonar.css">
  <!-- <script src="js/fetch.js"></script> -->
<title>Donate Blood</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String userName = null;
//allow access only if session exists
if(session.getAttribute("username") != null){
	userName = (String) session.getAttribute("username");
}
else if(session.getAttribute("name") != null){
	response.sendRedirect("Donor.jsp");
}
else {
	response.sendRedirect("login.jsp");
	
	}
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("username")) userName = cookie.getValue();
}
}
%>


<div class="nav" style="background-color:#df0303">
      
      <div class="container">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="index.jsp" target="new" style="text-decoration:none"><span class="glyphicon glyphicon-home"></span> Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		  <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="text-decoration:none"><span class="glyphicon glyphicon-user">
		  
		  <%if(session.getAttribute("username") != null)
		  {
		  if(cookies !=null){
		  for(Cookie cookie : cookies){
		      if(cookie.getName().equals("username"))
		      	userName = cookie.getValue();
		      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
		  }
		  }else{
		      sessionID = session.getId();
		  }
			//out.print(username);
			
		  }
		  %>
		  </span></a>
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
		<p style="margin-left:70px"><strong>Search for Donor</strong></p>
		<hr>
		
		<input type="text" id="bg" name="bg" placeholder="Search..." style="border:none; height:30px; width:200px;">
		<button type="button" class="btn btn-default" style="width:10%"><span class="glyphicon glyphicon-search"></span> Search </button>
		<p><span class="disp" id="disp">
		
		</span></p>
		
	
	</div>
	<div class="vr">&nbsp;</div>
	<div class="col-md-8">
	
	Date:<br>
	<input type="date" name="dat" id="d1"><br>
	<br>
	<button type="submit" data-toggle="modal" data-target="#myModal" id="search" value="Login">Search</button><br>
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">DONORS</h4>
        </div>
        <div class="modal-body">
         <script>
         $("document").ready(function(){

        		$("#search").click(function(){
        			
        			var a = $("#d1").val();
        			
        			$.ajax({
        				method:'POST',
        				url:'/servlet5',
        				data:{a:a},
        				success: function(data){
        					
        					$("#result").html(data);
        					
        					
        			/* 		$.ajax({
        					method:'POST',
        					url:'/servlet8',
        					data:{data,data},
        					success: function(result){
        						
        						
        					}
        					}); */
        					
        				}
        				
        			});
        			
        		});
        		
        	});
         </script>
         
         <div id="result" style="height:500px">
	
	</div>
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	
	
	</div>
	
	</div>

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
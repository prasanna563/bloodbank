
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" type="text/css" href="css/home.css"> 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
</head>
<body>
<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0); 
String username = null;
String userName = null;
if(session.getAttribute("username") != null || session.getAttribute("name") != null){
	username = (String) session.getAttribute("username");
	userName = (String) session.getAttribute("name");
}
else {
	response.sendRedirect("login.jsp");
	
	}
/* if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
}else username = (String) session.getAttribute("username"); */

String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("name")) 
    	userName = cookie.getValue();
    if(cookie.getName().equals("username"))
    	username = cookie.getValue();
    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}else{
    sessionID = session.getId();
}

%>

<div class="nav" style="background-color:#df0303">
      
      <div class="container">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="index.jsp" target="new" style="text-decoration:none"><span class="glyphicon glyphicon-home"></span> Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		    
		  <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="text-decoration:none">
		  <span class="glyphicon glyphicon-user">
		  <%if(session.getAttribute("username") != null)
		  {
		  if(cookies !=null){
		  for(Cookie cookie : cookies){
		      if(cookie.getName().equals("name")) 
		      	userName = cookie.getValue();
		      if(cookie.getName().equals("username"))
		      	username = cookie.getValue();
		      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
		  }
		  }else{
		      sessionID = session.getId();
		  }
			//out.print(username);
			
		  }
		  %>
		  
		  <%if(session.getAttribute("name") != null) {
					
					  if(cookies !=null){
					  for(Cookie cookie : cookies){
					      if(cookie.getName().equals("name")) 
					      	userName = cookie.getValue();
					      if(cookie.getName().equals("username"))
					      	username = cookie.getValue();
					      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
					  }
					  }else{
					      sessionID = session.getId();
					  }out.print(userName);
			   }
		   
		   %>
		  </span></a>
		  <ul class="dropdown-menu">
            <li><a href="changePassword.jsp">Change Password</a></li>
            <li><a href="">Emergency Help</a></li>
			<li><a href="/servlet6">Logout</a></li>
          </ul>
        </ul>
      </div>   
</div>


    
  
<div class="div2">
    <div class="container">
	<br>
	<br>
	
      <div class="col-md-4">
        <div class="hvr-sweep-to-top" style="border:1px solid #d4d4d4; height:500px">
		
		 <a href="donateBlood.jsp" style="text-decoration:none"><center><span class="glyphicon glyphicon-tint" style="color:#df0303; top:10px"></span></center> 
		 <p><h3 style="text-align:center">Donate Blood</h3><img src="images/donate.png" style="height:200px; width:350px"/>
		<h4 style="text-align:center; font-size:24px; font-family:Verdana"> Organizing Blood camp is one of our major activities.<br>
		 All camp basically focuses on giving blood donor a best experience. <br>
		 Learn More on how to organize a blood camp. </h4>
		</p></a>
        </div>
      </div>
		
		<div class="col-md-4">
		<div class="hvr-sweep-to-top" style="border:1px solid #d4d4d4; height:500px">
		
		<a href="findingDonor.jsp" style="text-decoration:none"><center><span class="glyphicon glyphicon-search"style="color:#df0303; top:10px"></span></center>
		<p><h3 style="text-align:center">Find Donor</h3><img src="images/find.jpg" style="height:200px; width:350px"/>
		<h4 style="text-align:center; font-size:24px; font-family:Verdana">Organizing Blood camp is one of our major activities. 
		 All camp basically focuses on giving blood donor a best experience. 
		 Learn More on how to organize a blood camp. </h4>
		</p></a>
        </div>
	  </div>
    
    
    <div class="col-md-4">
        <div class="hvr-sweep-to-top" style="border:1px solid #d4d4d4; height:500px">
		
		 <a href="organizeCamp.jsp" style="text-decoration:none"><center><span class="glyphicon glyphicon-calendar" style="color:#df0303; top:10px"></span></center> 
		 <p> <h3 style="text-align:center">Organize Blood Camp</h3><img src="images/calendar.jpg" style="height:200px; width:350px"/>
		 <h4 style="text-align:center; font-size:24px; font-family:Verdana">Organizing Blood camp is one of our major activities. 
		 All camp basically focuses on giving blood donor a best experience. 
		 Learn More on how to organize a blood camp. </h4>
		 </p> </a>
        </div>
      </div>
    
    
    </div> 
    
    	
</div>


<div class="container">
<br>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="images/bg.jpg" alt="FULL Blood Bank" >
        <div class="carousel-caption">
          <h3 style="color:red">FULL BLOOD BANK</h3>
          <p style="color:red">Keeping your Hopes Alive</p>
        </div>
      </div>

      <div class="item">
        <img src="images/img5.jpg" alt="Chania">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="images/img8.jpg" alt="Flower">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="images/img9.jpg" alt="Flower">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</div>


<br>
<br>
<div class="learn-more">
	 
	  <div class="container">
		<div class="row">
	      <div class="col-md-4">
			<h3>Do you know your Blood Volume ?</h3>
			<p><a href="learnmore.jsp">Check Here</a></p>
	      </div>
		  <div class="col-md-4">
			<h3>Engage With Us</h3>
			<p><a href="learnmore.jsp">For Hospitals</a></p>
		  </div>
		  <div class="col-md-4">
			<h3>Trust and Safety</h3>
			<p><a href="learnmore.jsp">Learn about trust at SaveLife</a></p>
		  </div>
	    </div>
	  </div>
	  
	  <footer style="text-align:right">
&copy; Donate Blood 2016		
</footer>
	</div>


</body>
</html>
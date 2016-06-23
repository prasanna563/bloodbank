<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" type="text/css" href="css/signup.css"> 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="js/vali.js"></script>
<title>Become a Member</title>
</head>
<body id="b1">  
<div class="container" id="d1">
<div class="page-header">
<h1 style="text-align:center"><span class="glyphicon glyphicon-pencil"> SignUp Form</span></h1>
</div>

<div class="form-groups">
<form method="post" action="servlet1" role="form" name="form1" ">
<div class="form-group">
<label>FirstName:</label>
<input type="text" class="form-control" id="fn" name="firstname" required placeholder="Enter your Firstname" /><span class="error_form" id="fname_err" style="color:red"></span>
</div>
<div class="form-group">
<label>LastName:</label>
<input type="text" class="form-control" id="ln" name="lastname" required placeholder="Enter your Lastname" /><span class="error_form" id="lname_err" style="color:red"></span>
</div>
<div class="form-group">
<label>Username:</label>
<input type="text" class="form-control" id="un" name="username" required placeholder="Enter Username" /><span class="error_form" id="uname_err" style="color:red"></span>
</div>
<div class="form-group">
<label>E-mail:</label>
<input type="email" class="form-control" id="email" name="email" required placeholder="Enter your mail id" /><span class="error_form" id="email_err" style="color:red"></span>
</div>

<div class="form-group">
<label>Password:</label>
<input type="password" class="form-control" id="pwd" name="password" required placeholder="Enter your Password" /><span class="error_form" id="pass_err" style="color:red"></span>
</div>

<div class="dropdown">
<label>Gender:</label>
<input type="radio" name="gender" value="Male" />Male
<input type="radio" name="gender" value="Female" />Female
</div>
<div class="dropdown">
<label>Blood Group:</label>

<select name="bloodgroup" required>
<option value="">Select Your Blood Group</option>
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
  <label>Address:</label>
  <textarea class="form-control" rows="5" name="texta" required id="comment"></textarea><span class="error_form" id="addr_err" style="color:red"></span>
</div>

<div class="form-group">
<label>Phone Number:</label>
<input type="tel" class="form-control" id="phn" name="phonenumber" required placeholder="Enter your Phone Number" /><span class="error_form" id="pnum_err" style="color:red"></span>
</div>



<button type="submit" class="btn btn-default">Submit</button>
<br>
<br>
</form>

</div>

</div>
    
</body>  
</html>
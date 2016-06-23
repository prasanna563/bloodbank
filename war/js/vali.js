$("document").ready(function(){
	
	$("#fname_err").hide();
	$("#lname_err").hide();
	$("#uname_err").hide();
	$("#email_err").hide();
	$("#pass_err").hide();
	$("#addr_err").hide();
	$("#pnum_err").hide();
	
	var fname_err = false;
	var lname_err = false;
	var uname_err = false;
	var email_err = false;
	var pass_err = false;
	var addr_err = false;
	var pnum_err = false;
	
	$("#fn").focusout(function(){
		validateFn();
	});
	
	$("#ln").focusout(function(){
		validateLn();
	});
	$("#un").focusout(function(){
		validateUn();
	});
	$("#email").focusout(function(){
		validateEmail();
	});
	$("#pwd").focusout(function(){
		validatePsd();
	});
	$("#comment").focusout(function(){
		validateAdr();
	});
	$("#phn").focusout(function(){
		validatePhn();
	});
	
	function validateFn(){
		var ex = /^[A-Za-z]+$/;
		var fname = $("#fn").val();
		
		if(ex.test(fname)){
			$("#fname_err").hide();
		}
		else{
			$("#fname_err").html("Name should contain only alphabets");
			$("#fname_err").show();
			fname_err=true;
		}
	}
	
	function validateLn(){
		var ex1 = /^[A-Za-z]+$/;
		var lname = $("#ln").val();
		
		if(ex1.test(lname)){
			$("#lname_err").hide();
		}
		else{
			$("#lname_err").html("Name should contain only alphabets");
			$("#lname_err").show();
			lname_err=true;
		}
	}
	
	function validateUn(){
		var rex = /^[a-zA-Z0-9._]+$/;
		var uname = $("#un").val();
		
		if(rex.test(uname)){
			$("#uname_err").hide();
		}
		else{
			$("#uname_err").html("username should contain only alpha-numeric values");
			$("#uname_err").show();
			uname_err=true;
		}
	}
	
	function validateEmail(){
	var patt = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
	var mid = $("#email").val();
	
	if(patt.test(mid)){
		
		$.ajax({
			type:"POST",
			url:"/servlet3?email="+mid,
			success: function(data){
				
				 if(data == "Email Already Exists"){

                     $("#email_err").html("Email Already Exists");
                     $("#email_err").show();
				 }
				 
				 else{
					 $("#email_err").hide();
				 }
			}
			
			
		});
	}
	else{
		$("#email_err").html("Please enter a Valid mail-id");
		$("#email_err").show();
		email_err=true;
	}
	
	}
	
	function validatePsd(){
		var chk = /[\W_]/;
		var pwd = $("#pwd").val();
		
		if(chk.test(pwd)){
			$("#pass_err").html("Password should not have any illegal characters");
			$("#pass_err").show();
			pass_err=true;
		}
		else if((pwd.length < 8) && ((pwd.search(/[a-zA-Z]+/)==-1) || (pwd.search(/[0-9]+/)==-1))){
			$("#pass_err").html("Password should have atleaast 8 characters and must have atleast one numeric values");
			$("#pass_err").show();
			pass_err=true;
		}
		else{
			$("#pass_err").hide();
		}
		
	}
	
	function validateAdr(){
		
		var ad = $("#comment").val();
		
		if(ad.length > 150){
			$("#addr_err").html("You have exceeded the length");
			$("#addr_err").show();
			addr_err=true;
		}
		else{
			$("#addr_err").hide();
		}
		
	}
	
	function validatePhn(){
		var exp = /^[0-9-+]+$/;
		var pn = $("#phn").val();
		
		if(exp.test(pn)){
			$("#pnum_err").hide();
		}
		else{
			$("#pnum_err").html("Invalid Phone number");
			$("#pnum_err").show();
			pnum_err=true;
		}
	}
	
	
});




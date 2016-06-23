/*$("document").ready( function (){
	
	$("#uname_err").hide();
	$("#pass_err").hide();
	
	
	var uname_err = false;
	var pass_err = false;
	
	$("#usrname").focusout(function(){
		validateUn();
	});
	
	$("#psw").focusout(function (){
		validatePwd();
	});
	
	function validateUn(){
		var rex = /^[a-zA-Z0-9._]+$/;
		var uname = $("#usrname").val();
		
		if(rex.test(uname)){
			
			$.ajax({
				type:"POST",
				url:"/servlet2?usrname="+uname+"&pwd="+psd,
				success: function(data){
					
					 if(data == "Invalid Username"){

	                     $("#uname_err").html("Invaild username or password");
	                     $("#uname_err").show();
					 }
					 
					 else{
						 $("#uname_err").hide();
					 }
				}
				
				
			});
		}
		else{
			$("#uname_err").html("Please enter a Valid Username ");
			$("#uname_err").show();
			uname_err=true;
		}
			
		}
	
});*/



$("document").ready( function (){
	$("#login").click(function(){
		
		var uname = $("#usrname").val();
		var pwd = $("#psw").val();
			
			$.ajax({
				type:'POST',
				url:'/servlet2',
				data:{uname:uname, pwd:pwd},
				success: function(data){
					

	                     $("#err_msg").html(data);
	                     
					 }
					 
				
				
			});
		
			
	});
	
});


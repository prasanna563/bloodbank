$("document").ready(function(){

	$("#search").click(function(){
		
		var a = $("#d1").val();
		
		$.ajax({
			method:'GET',
			url:'/servlet5',
			data:{a:a},
			success: function(data){
				
				$("#result").html(data);
				
			}
			
		});
		
	});
	
});

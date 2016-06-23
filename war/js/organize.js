$("document").ready(function (){
	
	$("#organize").click(function (){
		
		var n = $("#name").val();
		var d = $("#d1").val();
		
		$.ajax({
			
			type:'POST',
			url:'/servlet7',
			data:{n:n, d:d},
			success: function(data){
				
				$("#disp").html(data);
				
			}
		});
		
		
	});
	
});
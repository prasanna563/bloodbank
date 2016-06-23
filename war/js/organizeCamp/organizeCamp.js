$("document").ready(function(){
	$(document).on("click",".organize",function(){
		
		var name = $("#name").val();
		var date = $("#dat").val();
		console.log(name);
		
		$.ajax({

			type : 'POST',
			url : '/organizeCamp',
			data : {
				name : name,
				date : date
			},
			success : function(data){
				console.log(data);
				
				$("#disp").append("<li class='result'>"+name+"</li>");
				//$("#disp").show();
			
				}
			});
	});

});
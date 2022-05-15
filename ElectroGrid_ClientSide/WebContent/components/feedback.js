$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

	// Form validation-------------------  
	var status = validateFeedbackForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	}

	// If valid------------------------  
	var t = ($("#hidfeedbackIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "FeedbackApi",
		type : t,
		data : $("#formFeedback").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onFeedbackSaveComplete(response.responseText, status);
		}
	});
}); 

function onFeedbackSaveComplete(response, status){
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Saved.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Saving.");
		$("#slertError").show();
	}else{
		$("#alertError").text("Unknown Error while Saving.");
		$("#alertError").show();
	}
	$("#hidfeedbackIDSave").val("");
	$("#formFeedback")[0].reset();
}

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidfeedbackIDSave").val($(this).closest("tr").find('#hidfeedbackIDUpdate').val()); 
	$("#feedback").val($(this).closest("tr").find('td:eq(0)').text());
	
	

});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "FeedbackApi",
		type : "DELETE",
		data : "feedbackID=" + $(this).data("feedbackid"),
		dataType : "text",
		complete : function(response, status)
		{
			onFeedbackDeletedComplete(response.responseText, status);
		}
	});
});

function onFeedbackDeletedComplete(response, status)
{
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Deleting.");
		$("#alertError").show();
	}else{
		$("#alertError").text("Unknown Error While Deleting.");
		$("#alertError").show();
	}
}

//CLIENTMODEL
function validateFeedbackForm() {
	
	// Feedback 
	if ($("#feedback").val().trim() == "")  {   
		return "Insert feedback.";  
		
	}
	  
	
	 return true; 
	 
}
/**
 * 
 */
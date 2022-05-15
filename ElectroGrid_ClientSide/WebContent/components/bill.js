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
	var status = validateBillForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 

	// If valid------------------------  
	var t = ($("#hidbillNoSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "BillApi",
		type : t,
		data : $("#formBill").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onBillSaveComplete(response.responseText, status);
		}
	});
}); 

function onBillSaveComplete(response, status){
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
	$("#hidbillNoSave").val("");
	$("#formBill")[0].reset();
}

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidbillNoSave").val($(this).closest("tr").find('#hidbillNoUpdate').val());
	$("#billAmount").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#billDate").val($(this).closest("tr").find('td:eq(1)').text());         
	$("#paidAmount").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#status").val($(this).closest("tr").find('td:eq(3)').text()); 
	

});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "BillApi",
		type : "DELETE",
		data : "billNo=" + $(this).data("billno"),
		dataType : "text",
		complete : function(response, status)
		{
			onBillDeletedComplete(response.responseText, status);
		}
	});
});

function onBillDeletedComplete(response, status)
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
function validateBillForm() { 
	// Bill Amount  
	if ($("#billAmount").val().trim() == "")  {   
		return "Insert billAmount."; 
		 
	}
	 
	// Date  
	if ($("#billDate").val().trim() == "")  {   
		return "Insert billDate.";  
		
	} 
	
	// Paid Amount  
	if ($("#paidAmount").val().trim() == "")  {   
		return "Insert paidAmount."; 
		 
	}
	 
	// Status 
	if ($("#status").val().trim() == "")  {   
		return "Insert status.";  
		
	}
	 
	
	 return true; 
	 
}
/**
 * 
 */
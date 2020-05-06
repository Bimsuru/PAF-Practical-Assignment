$(document).ready(function()
{
	 $("#alertSuccess").hide();
	 $("#alertError").hide();
}); 


$(function (){
	var $apps = $('#apps');
	var $Name = $('#Name');
	var $StreetNo = $('#StreetNo');
	var $City = $('#City');
	var $PostalCode = $('#PostalCode');
	var $Email = $('#Email');
	var $AccNo = $('#AccNo');
		

	$.ajax({
		type: 'GET',
		url: 'http://localhost:8080/Hospital/webapi/hospitals/hospital/',
		success: function(apps){
			//console.log('success',data);
			$.each(apps, function(i, app){
				$apps.append('<li><div class="card shadow-lg p-3 mb-5 bg-white rounded bg-light m-2\" style=\"width: 12rem;float: left;">'
							+'Hospital Name:<span class="noedit Name">' + app.Name +'</span><input class="edit Name"/>'+'<br>'
							+'Street Number:<span class="noedit StreetNo">'+ app.StreetNo +'</span><input class="edit StreetNo"/> '+'<br>'
							+'City:<span class="noedit City">'+ app.City +'</span><input class="edit City"/> '+'<br>'
							+'PostalCode:<span class="noedit PostalCode">'+ app.PostalCode +'</span><input class="edit PostalCode"/>'+'<br>'
							+'Email Address:<span class="noedit Email">'+ app.Email +'</span><input class="edit Email"/> '+'<br>'
							+'Account Number:<span class="noedit AccNo">'+ app.AccNo +'</span><input class="edit AccNo"/>'+' <br>'
							+'<input type="button" id="'+ app.HID +'" value="Remove" class="btn btn-outline-danger remove">'+'<br>'
							+'<input type="button" " value="Edit" class="editapp btn btn-outline-primary noedit">'+'<br>'
							+'<input type="button" " value="Save" class="saveedit btn btn-outline-success edit">'+'<br>'
							+'<input type="button" " value="Cancel" class="canceledit btn btn-outline-danger edit"></li>');

			});
		},
		error: function() {
			alert('Hospital loading error...');
		}
	});
	
	
	$('#btnSave').on('click', function(){
		
		//Show and Clear Messages
		$("#alertSuccess").text("");
		$("#alertSuccess").hide();
		$("#alertError").text("");
		$("#alertError").hide();
		
		//Validation Function
		var status = validateHospitalForm(); 
		

		
		//Check any Error
		if (status != true)
		 {
			 $("#alertError").text(status);
			 $("#alertError").show();
			 return;
		 } 
		
		

		
		var app = {
				Name: $Name.val(),
				StreetNo: $StreetNo.val(),
				City: $City.val(),
				PostalCode: $PostalCode.val(),
				Email: $Email.val(),
				AccNo: $AccNo.val(),
		};
		

		
		$.ajax({
			headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
			type: 'POST',
			url: 'http://localhost:8080/Hospital/webapi/hospitals/hospital/',
			data: JSON.stringify(app),
			dataType: 'json',
			success: function(newHospital){
				console.log("Inserted");
				$apps.append('<li><div class="card shadow-lg p-3 mb-5 bg-white rounded bg-light m-2\" style=\"width: 12rem;float: left;">'
						+'Hospital Name:<span class="noedit Name">' + newHospital.Name +'</span><input class="edit Name"/>'+'<br>'
						+'Street Number:<span class="noedit StreetNo">'+ newHospital.StreetNo +'</span><input class="edit StreetNo"/> '+'<br>'
						+'City:<span class="noedit City">'+ newHospital.City +'</span><input class="edit City"/> '+'<br>'
						+'PostalCode :<span class="noedit PostalCode">'+ newHospital.PostalCode +'</span><input class="edit PostalCode"/>'+'<br>'
						+'Email Address:<span class="noedit Email">'+ newHospital.Email +'</span><input class="edit Email"/> '+'<br>'
						+'Account Number:<span class="noedit AccNo">'+ newHospital.AccNo +'</span><input class="edit AccNo"/>'+' <br>'
						+'<input type="button" id="'+ newHospital.HID +'" value="Remove" class="btn btn-outline-danger remove">'+'<br>'
						+'<input type="button" " value="Edit" class="editapp btn btn-outline-primary noedit">'+'<br>'
						+'<input type="button" " value="Save" class="saveedit btn btn-outline-success edit">'+'<br>'
						+'<input type="button" " value="Cancel" class="canceledit btn btn-outline-danger edit"></li>');
				
				//Show Success Message
				$("#alertSuccess").text("Your Hospital Saved");
				$("#alertSuccess").show();

				$("#formHospital")[0].reset(); 
				
			},
			
			error: function() {
				alert('Hospital Saving Error');
			}
		});
		
		function validateHospitalForm()
		{
			if ($Name.val().trim() == "")
			{
				return "Please Insert Hospital Name";
			}
			if ($StreetNo.val().trim() == "")
			{
				return "Please Insert Street Number";
			}
			
			if ($City.val().trim() == "")
			{
				return "Please Insert City";
			}
			
			if ($PostalCode.val().trim() == "")
			{
				return "Please Insert PostalCode";
			}
			if ($Email.val().trim() == "")
			{
				return "Please Insert Email Address";
			}
			if ($AccNo.val().trim() == "")
			{
				return "Please Insert Account Number";
			}
			
			return true;
		}
		

		
	});
	
	
	$apps.delegate('.remove','click',function(){
		var $li=$(this).closest('li');
		var self = this;
		$.ajax({
			type:'DELETE',
			url:'http://localhost:8080/Hospital/webapi/hospitals/hospital/'+$(this).attr('id'),
			success: function(){
				console.log("Deleted");
				$(self);
				$li.fadeOut(300,function(){
					$(this).remove();
					
					$("#alertSuccess").text("Hospital Delete Successfully");
					$("#alertSuccess").show(); 
					
				})
				
			},
		
			error: function() {
				alert('Hospital Delete Error');
			}
		});
	});
	
	
	$apps.delegate('.editapp','click',function(){
		
		var $li=$(this).closest('li');
		
		$li.find('input.Name').val($li.find('span.Name').html());
		$li.find('input.StreetNo').val($li.find('span.StreetNo').html());
		$li.find('input.City').val($li.find('span.City').html());
		$li.find('input.PostalCode').val($li.find('span.PostalCode').html());
		$li.find('input.Email').val($li.find('span.Email').html());
		$li.find('input.AccNo').val($li.find('span.AccNo').html());
		
		$li.addClass('edit');
	});
	
	$apps.delegate('.canceledit','click',function(){
		$(this).closest('li').removeClass('edit');
		
	});
	
	$apps.delegate('.saveedit','click',function(){
		var $li=$(this).closest('li');
		var app={

				Name: $li.find('input.Name').val(),
				StreetNo: $li.find('input.StreetNo').val(),
				City: $li.find('input.City').val(),
				PostalCode: $li.find('input.PostalCode').val(),
				Email: $li.find('input.Email').val(),
				AccNo: $li.find('input.AccNo').val(),
				
		};
		
		$.ajax({
			headers:{
				'Accept':'application/json',
				'Content-Type':'application/json'
					
					
			},
			type: 'PUT',
			url: 'http://localhost:8080/Hospital/webapi/hospitals/hospital/',
			data: JSON.stringify(app),
			dataType: 'json',
			
			success: function(newHospital){

				$li.find('span.Name').html(app.name);
				$li.find('span.StreetNo').html(app.nic);
				$li.find('span.City').html(app.phone);
				$li.find('span.PostalCode').html(app.email);
				$li.find('span.Email').html(app.reportID);
				$li.find('span.AccNo').html(app.sessionID);
				$li.removeClass('edit');
				},
		
				error: function(){
				alert('Hospital Update Error');
			}
			
		});
	});
	
	
	
	
	
	
});
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital</title>
<link rel="stylesheet" href="Views/bootstrap.main.css">
<link rel="stylesheet" href="Views/styles.css">
</head>
<body>

<div class="container">
<div class="row">
	<div class="col-sm-4">
    
     
    </div>

	<div class="col-sm-4">
	<form id="formHospital" name="formHospital" method="post" action="Hospital.jsp" >
		
		<br>
	
		<h3 class="text-center">Hospital Add</h3>
		
		<br>
		<input type="text" id="Name" name="Name" class="form-control form-control-sm" placeholder="Hospital Name" ><br>
		<input type="text" id="StreetNo" name="StreetNo" class="form-control form-control-sm" placeholder="Street Number"><br>
		<input type="text" id="City" name="City" class="form-control form-control-sm" placeholder="City"><br>
		<input type="text" id="PostalCode" name="PostalCode" class="form-control form-control-sm" placeholder= "PostalCode"><br>
		<input type="text" id="Email" name="Email" class="form-control form-control-sm" placeholder="Email Address"><br>
		<input type="text" id="AccNo" name="AccNo" class="form-control form-control-sm" placeholder="Account Number"><br>
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-info my-4 btn-block">
		
			
		
	</form>
	</div>
	

	<div class="container text-center">
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
	</div>

	

	<div class="row">
			<ul style="list-style: none;" id="apps" class="row" ></ul>
	</div>

   </div>
	
</div>

<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/main.js"></script>

</body>
</html>
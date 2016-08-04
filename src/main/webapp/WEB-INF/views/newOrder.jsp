<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap-datepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<script	src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script> 
	<script	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-datepicker/js/moment.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-datepicker/js/bootstrap-datetimepicker.min.js"></script>
	
	<title>New Order</title>
</head>
<body style="margin: 0">
<jsp:include page="header.jsp"></jsp:include>
	 
	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2">
			<ul class="nav nav-pills nav-stacked">
			    <li><a href="#">Home</a></li>
			    <li><a href="${pageContext.request.contextPath}/material">Material </a></li>
			    <li><a href="${pageContext.request.contextPath}/inventory">Inventory </a></li>
			    <li class="active"><a href="${pageContext.request.contextPath}/order">Order Management </a></li>
			    <li><a href="${pageContext.request.contextPath}/areaManagement">Area Management </a></li>
			 </ul>
		</div>
		<div class="col-sm-10">
			<ol class="breadcrumb">
			  <li><a href="#">Home</a></li>
			  <li><a href="${pageContext.request.contextPath}/order">Order</a></li>
			  <li>Place order</li>
			</ol>
			
			<h2>Place order </h2><br>
			
			<form action="newOrderData" method="post">
			
			<div class="row">
				<div class="col-sm-6">

				    <div class="form-group">
				      <label >Material:</label>
				      <select class="form-control" name="Material">
							<option value="">Material 1</option>
							<option value="">Material 2</option>
							<option value="">Material 3</option>
							<option value="">Material 4</option>
						</select>
				    </div>
				    
				    <div class="form-group">
				      <label >Recipe/Version:</label>
				      <input type="text" class="form-control" id="recipeVersion" placeholder="Recipe/Version">
				    </div>
				    
				    <div class="form-group">
				      <label>Quantity:</label>
				      <input type="number"  min="0" class="form-control" id="quantity" >
				    </div>
				    
				    <div class="form-group">
				      <label >UOM:</label>
				      <select class="form-control" name="uom">
							<option value="">Milligram </option>
							<option value="">Gram </option>
							<option value="">kilogram</option>
							<option value="">Unit</option>
						</select>
				    </div>
				    
				</div>
				<div class="col-sm-6">
				 	
				     <div class="form-group">
				      <label>Begin date:</label>
				      <div class='input-group date' id='beginDate'>
			               <input type='text' class="form-control" />
			               <span class="input-group-addon">
			                   <span class="glyphicon glyphicon-calendar"></span>
			               </span>
			           </div>
				    </div>
				    
				    <div class="form-group">
				      <label>End date :</label>
				       <div class='input-group date' id='endDate'>
			               <input type='text' class="form-control" />
			               <span class="input-group-addon">
			                   <span class="glyphicon glyphicon-calendar"></span>
			               </span>
			           </div>
				    </div>
				  	<script type="text/javascript">
					    $(function () {
					        $('#beginDate').datetimepicker();
					        $('#endDate').datetimepicker({
					            useCurrent: false //Important! See issue #1075
					        });
					        $("#beginDate").on("dp.change", function (e) {
					            $('#endDate').data("DateTimePicker").minDate(e.date);
					        });
					        $("#endDate").on("dp.change", function (e) {
					            $('#beginDate').data("DateTimePicker").maxDate(e.date);
					        });
					    });
					</script>
				  	
				</div>
				
			</div>
			<button type="submit" class="btn btn-primary ">Add</button>
			</form>
			
		</div>
	</div>
</div>
</body>
</html>
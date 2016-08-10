<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:directive.include file="include_header_scripts.jsp" />
	<title>container</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row">
	
			<%-- <jsp:include page="leftNavigation.jsp"></jsp:include> --%>
		<div class="col-sm-2">	
			<ul class="nav nav-pills nav-stacked">
			    <li><a href="#">Home</a></li>
			    <li><a href="${pageContext.request.contextPath}/material">Material </a></li>
			    <li class="active"><a href="${pageContext.request.contextPath}/inventory">Inventory </a></li>
			    <li><a href="${pageContext.request.contextPath}/order">Order Management </a></li>
			    <li><a href="${pageContext.request.contextPath}/areaManagement">Area Management </a></li>
			 </ul> 
		</div>	
		<div class="col-sm-10">
		
			<ol class="breadcrumb">
			  <li><a href="#">Home</a></li>
			  <li><a href="${pageContext.request.contextPath}/inventory">Inventory </a></li>
			  <li>Container</li>
			</ol>
			
			<div id="notificationArea">
				<div id="notification">
					<c:if test="${not empty message}">
						<div class="alert alert-success" >
						  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						  ${message}
						</div>
					</c:if>
				</div>
			</div>
			
			<h2>Container list </h2>
			<h3>Lot Id : ${ lotId } </h3> <br>
			
			<table class="table table-striped table-bordered table-hover" id="containerTable">
		    <thead>
		      <tr>
		      	<th>Container ID</th>
		      	<th>Quantity</th>
		      	<th>Area</th>
		        <th>Location</th>
		        <th>QC Status</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<tr>
			      	<td>CON001</td>
			      	<td>100</td>
			        <td>Area1</td>
			        <td>Location1</td>
			        <td>Status 1</td>
			  	</tr>
		      	<tr>
			      	<td>CON002</td>
			      	<td>50</td>
			        <td>Area3</td>
			        <td>Location3</td>
			        <td>Status 1</td>
			  	</tr>
		      	<tr>
			      	<td>CON003</td>
			      	<td>130</td>
			        <td>Area5</td>
			        <td>Location5</td>
			        <td>Status 2</td>
		      	</tr>
		      	<tr>
			      	<td>CON004</td>
			      	<td>30</td>
			        <td>Area8</td>
			        <td>Location8</td>
			        <td>Status 3</td>
		      	</tr>
		      	<tr>
			      	<td>CON005</td>
			      	<td>70</td>
			        <td>Area9</td>
			        <td>Location9</td>
			        <td>Status 3</td>
		      	</tr>
	    	</tbody>
		  </table>
		  
		 	<div id="context-menu">
	      	<ul class="dropdown-menu" role="menu">
	           <li><a tabindex="-1">Adjust Quantity</a></li>
	           <li><a tabindex="-1">Waste Quantity</a></li>
	           <li class="divider"></li>
	           <li><a tabindex="-1">Move Container</a></li>
	      	</ul>
	      </div>
	      
	      <!-- Adjust Inventory Modal -->
			<div id="adjustQuantityModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	
			    	<form action="#" id="adjustInventoryForm" method="get">
			    	
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Adjust quantity</h4>
				      </div>
				     
				      <div class="modal-body">
				        
				        <label>Container ID : </label> <span id="adjustContainerIdLabel"></span><br>
				        <label>Quantity : </label> <span id="quantityLabel"></span>
				        <hr>
				        
				        <div class="form-group">
					      <label>New Quantity:</label>
					      <input type="number"  min="0" id="adjustedQuantity" class="form-control" >
					    </div>
				        
				      </div>
				     
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary btn-sm" data-dismiss="modal" 
				        onclick='showNotification(document.getElementById("adjustedQuantity").value + " quantity set for container " + $("span#adjustContainerIdLabel").text())'>
				        Update</button>
				      </div>
			      
			      </form>
			    
			    </div>
			  </div>
			</div>
	      
	      
	      <!-- waste quantity Modal -->
			<div id="wasteQuantityModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	
			    	<form action="#" id="wasteQuantityForm" method="get">
			    	
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Waste quantity</h4>
				      </div>
				     
				      <div class="modal-body">
				        
				        <label>Container ID : </label> <span id="westedContainerIdLabel"></span><br>
				        <label>Quantity : </label> <span id="quantityLabel"></span>
				        <hr>
				        
				        <div class="form-group">
					      <label>Wasted Quantity:</label>
					      <input type="number"  min="0" id="wastedQuantity" class="form-control" >
					    </div>
				        
				      </div>
				     
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary btn-sm" data-dismiss="modal"
				         onclick='showNotification(document.getElementById("wastedQuantity").value + " quantity wasted from container " + $("span#westedContainerIdLabel").text())'>
				         Update</button>
				      </div>
			      
			      </form>
			    
			    </div>
			  </div>
			</div>
			
			<!-- Move lot Modal -->
			<div id="moveContainerModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	
			    	<form action="moveContainerData" id="moveContainerForm" method="get">
			    	
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Move container</h4>
				      </div>
				     
				      <div class="modal-body">
				        
				        <label>Container ID : </label> <span id="moveContainerIdLabel"></span><br>
				        <label>Quantity : </label> <span id="quantityLabel"></span><br>
				        <label>Current area : </label> <span id="areaLabel"></span><br>
				        <label>Current location : </label> <span id="locationLabel"></span>
				        <hr>
				        
				        <div class="form-group">
					      <label>Target area : </label>
					      <select class="form-control" name="targetArea" id="targetArea">
							<option value="Area 1" >Area 1</option>
							<option value="Area 2" >Area 2</option>
							<option value="Area 3" >Area 3</option>
							<option value="Area 4" >Area 4</option>
							<option value="Area 5" >Area 5</option>
							<option value="Area 6" >Area 6</option>
						  </select>
					    </div>
					    
					     <div class="form-group">
					      <label>Target location : </label>
					      <select class="form-control" name="targetLocation" id="targetLocation">
							<option value="location 1" >Location 1</option>
							<option value="location 2" >Location 2</option>
							<option value="location 3" >Location 3</option>
							<option value="location 4" >Location 4</option>
							<option value="location 5" >Location 5</option>
							<option value="location 6" >Location 6</option>
						  </select>
					    </div>
				        
				      </div>
				     
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary btn-sm" data-dismiss="modal"
				         onclick='showNotification( "Container " + $("span#moveContainerIdLabel").text() + " moved from " + $("span#locationLabel").text() + " to " + document.getElementById("targetLocation").value + "" )'>
				         Move </button>
				      </div>
			      
			      </form>
			    
			    </div>
			  </div>
			</div>
	      
	      
		 </div>
	</div>
	</div>
<script>

$(function () {

	$('#containerTable').contextmenu({
        target: '#context-menu',
        scopes: 'tbody > tr',
        onItem: function (row, e) {
            var name = $(row.children('*')[0]).text();
            var action = $(e.target).text();
           
        	var notificationMessage = "";
        	
            if(action == "Waste Quantity"){
            	
            	$('#wasteQuantityModal').on('show.bs.modal', function (event) {
          		  var modal = $(this)

          		  modal.find('.modal-body #westedContainerIdLabel').html($(row.children('*')[0]).text())
           		  modal.find('.modal-body #quantityLabel').html($(row.children('*')[1]).text())
           		  
          		})
          		$('#wasteQuantityModal').modal('toggle');
            	
            }else if(action == "Adjust Quantity"){

            	$('#adjustQuantityModal').on('show.bs.modal', function (event) {
            		  var modal = $(this)
            		  modal.find('.modal-body #adjustContainerIdLabel').html($(row.children('*')[0]).text())
             		  modal.find('.modal-body #quantityLabel').html($(row.children('*')[1]).text())

            	})
            	$('#adjustQuantityModal').modal('toggle');
            	
            }else if(action == "Move Container"){
            	$('#moveContainerModal').on('show.bs.modal', function (event) {
            		  var modal = $(this)
            		  modal.find('.modal-body #moveContainerIdLabel').html($(row.children('*')[0]).text())
             		  modal.find('.modal-body #quantityLabel').html($(row.children('*')[1]).text())
             		  modal.find('.modal-body #areaLabel').html($(row.children('*')[2]).text())
             		  modal.find('.modal-body #locationLabel').html($(row.children('*')[3]).text())
            		})
            	$('#moveContainerModal').modal('toggle');
            }
            
            showNotification(notificationMessage)
            
            //alert('You right clicked on ' + name + '\'s row and selected menu item "' + action  + '".');
        }
    });
});

$(document).ready(function() {
    
	$('#containerTable').DataTable();
});

</script>
<jsp:directive.include file="include_body_scripts.jsp" />	
</body>
</html>
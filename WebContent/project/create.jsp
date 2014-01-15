<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp" %>

<link rel="stylesheet" href="../css/chosen.css">
<script  src="../js/chosen.jquery.js"></script>

<script>
$(document).ready(function(){
	
	$("select").chosen();
	
	 $( "#from" ).datepicker({
		 showOtherMonths: true,
		 selectOtherMonths: true,
		 dateFormat: 'yy-mm-dd',
		 changeMonth: true,
		 changeYear: true,
		 showButtonPanel: true,
		 minDate: 0,
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	});
	 
	 $( "#to" ).datepicker({
		 showOtherMonths: true,
		 selectOtherMonths: true,
		 dateFormat: 'yy-mm-dd',
		 changeMonth: true,
		 changeYear: true,
		 showButtonPanel: true,
		 onClose: function( selectedDate ) {
		        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
		      }
	});
});
</script>
<body>
	<%@include file="../includes/navbar.jsp" %>

	   <div class="container">
		<form id="form" action="../controller?entity=Project&action=create" method="POST" autocomplete="off">
		<!-- START FORM  -->	
		
			  <div class="form-group">
			    <label>Name</label>
			    <input class="form-control" name="name" placeholder="Name of the project" required>
			  </div>
			  
			  <div class="form-group">
			    <label>Client</label>
			    
			    <select class="form-control" name="client_id" id="client_id">
				    <%@ page import="br.com.ernaneluis.model.Client" %>
				    <%@ page import="br.com.ernaneluis.dao.ClientDAO" %>
				    <% 
					    ClientDAO dao = new ClientDAO();
						List<Client> list = dao.getAll();
						String select = "";
						for(Client obj : list) select  += "<option value='" + obj.getId() + "'>" + obj.getName() +"</option>";
					    out.print(select);	
				    %>
			    </select>
			    
			  </div>
			  
			  <div class="form-group">
			    <label>Leader</label>
			    <select class="form-control" name="leader_id">
				    <%@ page import="br.com.ernaneluis.model.Employee" %>
				    <%@ page import="br.com.ernaneluis.dao.EmployeeDAO" %>
				    <% 
				    	EmployeeDAO edao = new EmployeeDAO();
						List<Employee> elist = edao.getAll();
						String eselect = "";
						for(Employee obj : elist) eselect  += "<option value='" + obj.getId() + "'>" + obj.getName() +"</option>";
					    out.print(eselect);	
				    %>
			    </select>
			  </div>
			  
			   <div class="form-group">
			    <label>Start Date</label>
			    <input class="form-control" name="start_date"  id="from" required>
			  </div>
			  
			   <div class="form-group">
			    <label>End Date</label>
			    <input class="form-control" name="end_date"  id="to" required>
			  </div>
			  
			  <div class="form-group">
			    <label>Description</label>
			    <textarea class="form-control" rows="3" name="description" required></textarea>
			
			  </div>
		
		  <button type="submit" class="btn btn-default">Submit</button>
		<!-- END FORM  -->
	</form>
	
    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>
  
</body>
</html>
<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp" %>

<body>
	<%@include file="../includes/navbar.jsp" %>

	   <div class="container">
		<form id="form" action="../controller?entity=Employee&action=create" method="POST" autocomplete="off">
		<!-- START FORM  -->	
		  <div class="form-group">
		    <label>Name</label>
		    <input class="form-control" name="name" placeholder="Name of the Employee" required>
		  </div>
		  
		  <div class="form-group">
		    <label>E-Mail</label>
		    <input class="form-control" name="email" placeholder="E-Mail of the Employee" required>
		  </div>
		  
		  <div class="form-group">
		    <label>Password</label>
		    <input class="form-control" name="password" type="password"  placeholder="Password of the Employee"  required>
		  </div>
		  
		   <div class="form-group">
		    <label>Role</label>
		    <select class="form-control" name="role">
		    	<option value="-1">Administrator</option>
		    	<option value="0">Developer</option>
		    	<option value="1">Other</option>
		    </select>
		  </div>
		    
		  
		  <button type="submit" class="btn btn-default">Submit</button>
		<!-- END FORM  -->
	</form>
	
    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

  
</body>
</html>
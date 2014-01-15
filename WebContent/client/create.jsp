<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp" %>
<body>
	<%@include file="../includes/navbar.jsp" %>

	   <div class="container">
		<form role="form" action="../controller?entity=Client&action=create" method="POST">
		<!-- START FORM  -->	
		  <div class="form-group">
		    <label class="control-label">Name</label>
		    <input class="form-control" name="name" placeholder="Name of the client" required>
		  </div>
		  
		  <div class="form-group">
		    <label>E-Mail</label>
		    <input class="form-control" name="email" placeholder="E-Mail of the client" required>
		  </div>
		  
		  <div class="form-group">
		    <label>Phone</label>
		    <input class="form-control" name="phone"  placeholder="Phone of the client" required>
		  </div>
		  
		   <div class="form-group">
		    <label>Web-site</label>
		    <input class="form-control" name="website"  placeholder="Web-site of the client" required>
		  </div>
		    
		  <div class="form-group">
		    <label>Other</label>
		    <textarea class="form-control" rows="3" name="other"  placeholder="Any other information" required></textarea>
		
		  </div>
		  
		  <button type="submit" class="btn btn-default">Submit</button>
		<!-- END FORM  -->
	</form>
	
    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

  
</body>
</html>
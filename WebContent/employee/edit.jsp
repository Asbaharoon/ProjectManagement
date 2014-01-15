<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp" %>
<body>
	<%@include file="../includes/navbar.jsp" %>

    <div class="container">
	<form role="form" action="controller?entity=Employee&action=edit&id=<%=request.getParameter("id")%>" method="POST">
		<!-- START FORM -->
		<%@ page import="br.com.ernaneluis.model.Employee" %>
		<% Employee obj = (Employee) request.getAttribute("dataView");%>
		
		 <div class="form-group">
		    <label>Name</label>
		    <input class="form-control" name="name"  value="<%=obj.getName()%>" required>
		  </div>
		  
		  <div class="form-group">
		    <label>E-Mail</label>
		    <input class="form-control" name="email"  value="<%=obj.getEmail()%>" required>
		  </div>
		  
		  <div class="form-group">
		    <label>Password</label>
		    <input class="form-control" name="password" type="password" required>
		  </div>
		  
		   <div class="form-group">
		    <label>Role</label>
		     <select class="form-control" name="role">
		     <% 
			    String selected0 = ""; String selected1 = ""; String selected2 = "";
			    if(obj.getRole().equals(-1)) selected0 = "selected";
			    if(obj.getRole().equals(0)) selected1 = "selected";
			    if(obj.getRole().equals(1)) selected2 = "selected";
			    %>
		    	<option value="-1" <%=selected0%> >Administrator</option>
		    	<option value="0" <%=selected1%> >Developer</option>
		    	<option value="1" <%=selected2%> >Other</option>
		    </select>
		  </div>
		    
		  
		  
		  <button type="submit" class="btn btn-default">Submit</button>
		<!-- END FORM -->
	</form>
	
    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  
</body>
</html>
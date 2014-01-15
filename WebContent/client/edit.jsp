<!DOCTYPE html>
<%@include file="../session.jsp" %>
<html lang="en">
<%@include file="../includes/header.jsp" %>
<body>
	<%@include file="../includes/navbar.jsp" %>

    <div class="container">
	<form role="form" action="controller?entity=Client&action=edit&id=<%=request.getParameter("id")%>" method="POST">
		<!-- START FORM -->
		<%@ page import="br.com.ernaneluis.model.Client" %>
		<% Client obj = (Client) request.getAttribute("dataView");%>
		
		 <div class="form-group">
		    <label>Name</label>
		    <input class="form-control" name="name"  value="<%=obj.getName()%>" required>
		  </div>
		  
		  <div class="form-group">
		    <label>E-Mail</label>
		    <input class="form-control" name="email"  value="<%=obj.getEmail()%>" required>
		  </div>
		  
		  <div class="form-group">
		    <label>Phone</label>
		    <input class="form-control" name="phone"  value="<%=obj.getPhone()%>" required>
		  </div>
		  
		   <div class="form-group">
		    <label>Web-site</label>
		    <input class="form-control" name="website"  value="<%=obj.getWebsite()%>" required>
		  </div>
		    
		  <div class="form-group">
		    <label>Other</label>
		    <textarea class="form-control" rows="3" name="other"  placeholder="Any other information" required><%=obj.getOther()%></textarea>
		
		  </div>
		  
		  <button type="submit" class="btn btn-default">Submit</button>
		<!-- END FORM -->
	</form>
	
    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

</body>
</html>
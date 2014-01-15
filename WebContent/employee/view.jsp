<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
<body>

	<%@include file="../includes/navbar.jsp" %>
	
	<%@ page import="br.com.ernaneluis.model.Employee" %>
    <%  Employee obj = (Employee) request.getAttribute("dataView");  %>

    <div class="container">
		<div class="page-header2">
			<h3>View Employee #<%=obj.getId()%></h3>
			<a href="controller?entity=Employee&action=edit&id=<%=obj.getId()%>" class="btn btn-primary navbar-right" type="button">Edit Employee</a>
		</div>
		
		
		<div class="col-md-6 ">
		 
		  	<p>
				<strong>Name: </strong>
				<span class="info"><%=obj.getName()%></span>
			</p>
			
			<p>
				<strong>E-Mail: </strong>
				<span class="info"><%=obj.getEmail()%></span>
			</p>
			
			<p>
				<strong>Role: </strong>
				<% if(obj.getRole().equals(-1)) {%>
	     			<span class="label label-danger"> Administrator</span>
	     		<% } %>
	     		
	     		<% if(obj.getRole().equals(0)) {%>
	     			<span class="label label-info"> Developer</span>
	     		<% } %>
	     		
	     		<% if(obj.getRole().equals(1)) { %>
	     			<span class="label label-default"> Other</span>
	     		<% } %>
			</p>
		  	
		  	
		  
		</div>

    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>


  
</body>
</html>
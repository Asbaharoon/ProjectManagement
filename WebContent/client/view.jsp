<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
<body>

	<%@include file="../includes/navbar.jsp" %>
	
	<%@ page import="br.com.ernaneluis.model.Client" %>
    <%  Client obj = (Client) request.getAttribute("dataView");  %>

    <div class="container">
		<div class="page-header2">
			<h3>View Client #<%=obj.getId()%></h3>
			<a href="controller?entity=Client&action=edit&id=<%=obj.getId()%>" class="btn btn-primary navbar-right" type="button">Edit client</a>
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
				<strong>Phone: </strong>
				<span class="info"><%=obj.getPhone()%></span>
			</p>
		  	
		  	<p>
				<strong>Web-site: </strong>
				<span class="info"><%=obj.getWebsite()%></span>
			</p>
		
			<p>
				<strong>Other: </strong>
				<span class="info"><%=obj.getOther()%></span>
			</p>
		  
		</div>

    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

</body>
</html>
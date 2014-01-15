<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
<body>

	<%@include file="../includes/navbar.jsp" %>

    <div class="container">
		<div class="page-header2">
			<h3>Clients</h3>
			
			<% if(session.getAttribute("user_permission").equals(-1)) {%>
				<a class="btn btn-primary navbar-right" type="button" href="client/create.jsp">New Client</a>
			<% } %>
		</div>
	
     <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>E-mail</th>
            <th>Phone</th>
            <th>Web-site</th>
            <th width="90">Action</th>
          </tr>
        </thead>
        <tbody>
          
          	<%@ page import="br.com.ernaneluis.model.Client" %>
            <%  @SuppressWarnings("unchecked")
	     		List<Client> attribute = ((List<Client>)request.getAttribute("dataView")); 
	     		for(Client obj : attribute ){ 
	     	%>
	     	<tr>
	     	<td><%= obj.getId() %></td>
	     	<td><a href="controller?entity=Client&action=view&id=<%= obj.getId() %>"><%= obj.getName() %></a></td>
	     	<td><%= obj.getEmail() %></td>
	     	<td><%= obj.getPhone() %></td>
	     	<td><%= obj.getWebsite() %></td>
	     	
	     	<td> 
	     		<% if(session.getAttribute("user_permission").equals(-1)) {%>
	            	<a href="controller?entity=Client&action=delete&id=<%= obj.getId() %>" class="btn btn-default btn-sm" type="button">
	            		<span class="glyphicon glyphicon-trash"></span>
	            	</a> 
            	<% } %>
            	<a href="controller?entity=Client&action=edit&id=<%= obj.getId()%>" class="btn btn-default btn-sm" type="button">
            		<span class="glyphicon glyphicon-edit"></span>
            	</a> 
           	</td>
	     	
	     	</tr>
	     	<% } %>  
		  
        </tbody>
      </table>

    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>
  
</body>
</html>
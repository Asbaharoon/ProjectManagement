<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
<body>

	<%@include file="../includes/navbar.jsp" %>

    <div class="container">
		<div class="page-header2">
			<h3>Employees</h3>
			
			<% if(session.getAttribute("user_permission").equals(-1)) {%>
				<a class="btn btn-primary navbar-right" type="button" href="employee/create.jsp">New Employee</a>
			<% }%>
		</div>
	
     <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>E-mail</th>
            <th>Role</th>
            <th width="90">Action</th>
          </tr>
        </thead>
        <tbody>
          
          	<%@ page import="br.com.ernaneluis.model.Employee" %>
            <%  @SuppressWarnings("unchecked")
	     		List<Employee> attribute = ((List<Employee>)request.getAttribute("dataView")); 
	     		for(Employee obj : attribute ){ 
	     	%>
	     	<tr>
	     	<td><%= obj.getId() %></td>
	     	<td><a href="controller?entity=Employee&action=view&id=<%= obj.getId() %>"><%= obj.getName() %></a></td>
	     	<td><%= obj.getEmail() %></td>
	     	
	     	<td>
	     		<% if(obj.getRole().equals(-1)) {%>
	     			<span class="label label-danger"> Administrator</span>
	     		<% } %>
	     		
	     		<% if(obj.getRole().equals(0)) {%>
	     			<span class="label label-info"> Developer</span>
	     		<% } %>
	     		
	     		<% if(obj.getRole().equals(1)) { %>
	     			<span class="label label-default"> Other</span>
	     		<% } %>
	     	</td>
	     	
	     	<td> 
	     		<% if(session.getAttribute("user_permission").equals(-1)) {%>
            	<a href="controller?entity=Employee&action=delete&id=<%= obj.getId() %>" class="btn btn-default btn-sm" type="button">
            		<span class="glyphicon glyphicon-trash"></span>
            	</a> 
            	<%} %>
            	
            	<% if(session.getAttribute("user_id").equals(obj.getId()) || session.getAttribute("user_permission").equals(-1)) {%>
            	<a href="controller?entity=Employee&action=edit&id=<%= obj.getId()%>" class="btn btn-default btn-sm" type="button">
            		<span class="glyphicon glyphicon-edit"></span>
            	</a> 
            	<%} %>
           	</td>
	     	
	     	</tr>
	     	<% } %>  
		  
        </tbody>
      </table>

    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>

  
</body>
</html>
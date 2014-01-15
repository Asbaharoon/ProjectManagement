<%@include file="../session.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
<body>

	<%@include file="../includes/navbar.jsp" %>

    <div class="container">
		<div class="page-header2">
			<h3>Projects</h3>
			<% if(session.getAttribute("user_permission").equals(-1)) {%>
				<a class="btn btn-primary navbar-right" type="button" href="project/create.jsp">New Project</a>
			<% } %>
		</div>
	
     <table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Client</th>
            <th>Progress</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th width="90">Action</th>
          </tr>
        </thead>
        <tbody>
          		
			<%@ page import="br.com.ernaneluis.dao.ProjectDAO" %>
          	<%@ page import="br.com.ernaneluis.model.Project" %>
            <%  @SuppressWarnings("unchecked")
	     		List<Project> attribute = ((List<Project>)request.getAttribute("dataView")); 
	     		for(Project obj : attribute ){ 
	     	%>
	     	<tr>
	     	<td><%= obj.getId() %></td>
	     	<td><a href="controller?entity=Project&action=view&id=<%= obj.getId() %>"><%= obj.getName() %></a></td>
	     	<td><a href="controller?entity=Client&action=view&id=<%= obj.getClient().getId()%>" > <%= obj.getClient().getName() %> </a></td>
	     	<td>
	     	
		     	<%
		     	ProjectDAO dao = new ProjectDAO();
		     	Double progress = dao.getProjectProgress(obj.getId());
				obj.setProgress(progress);
		     	%>
	     		<div class="progress">
				  <div class="progress-bar" role="progressbar" aria-valuenow="<%= obj.getProgress() %>" aria-valuemin="0" aria-valuemax="100" style="width:<%= obj.getProgress().intValue() %>%;">
				    <span class="sr-only"><%=String.format("%.2f", obj.getProgress()).replace(",", ".")%></span>
				  </div>
				</div>
	     	</td>
	     	
	     	<td>
            	<span class="label label-default"><%= obj.getStartDateToString() %></span>
            </td>
            
            <td>
            	<span class="label label-danger"><%= obj.getEndDateToString() %></span>
            </td>
	     	
	     	<!-- ACTIONS -->
	     	<td> 
	     		<% if(session.getAttribute("user_permission").equals(-1)) {%>
	            	<a href="controller?entity=Project&action=delete&id=<%= obj.getId() %>" class="btn btn-default btn-sm" type="button">
	            		<span class="glyphicon glyphicon-trash"></span>
	            	</a> 
            	<% } %>
            	
            	<% if(session.getAttribute("user_id").equals(obj.getLeader().getId()) || session.getAttribute("user_permission").equals(-1)) {%>
            	<a href="controller?entity=Project&action=edit&id=<%= obj.getId()%>" class="btn btn-default btn-sm" type="button">
            		<span class="glyphicon glyphicon-edit"></span>
            	</a> 
            	<% } %>
           	</td>
	     	
	     	</tr>
	     	<% } %>  
		  
        </tbody>
      </table>

    </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  
</body>
</html>
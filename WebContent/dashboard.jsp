<%@ page import="br.com.ernaneluis.model.Task" %>
<%@ page import="br.com.ernaneluis.model.Project" %>
<%@ page import="br.com.ernaneluis.dao.ProjectDAO" %>
<%  
@SuppressWarnings("unchecked")
List<Task> tasks = ((List<Task>)request.getAttribute("taskList")); 
Integer numberTasksDone = (Integer) request.getAttribute("numberTasksDone");
Integer numberTasksDoneToday = (Integer) request.getAttribute("numberTasksDoneToday");

Integer numberProjects = (Integer) request.getAttribute("numberProjects");
Integer numberClients = (Integer) request.getAttribute("numberClients");
Integer numberEmployees = (Integer) request.getAttribute("numberEmployees");

%>

<%@include file="session.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="includes/header.jsp" %>
<body>
	<%@include file="includes/navbar.jsp" %>

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
       
       <h4>Number of Projects: <span class="badge"><%=numberProjects%></span></h4>
      <h4>Number of Clients: <span class="badge"><%=numberClients%></span></h4>
      <h4>Number of Employees: <span class="badge"><%=numberEmployees%></span></h4>
       
        <h2>Your Tasks Overview</h2>
        <table class="table table-bordered">
        <thead>
          <tr>
          	<th>Project Name</th>
            <th>Task Name</th>
            <th>Status</th>
            <th>Priority</th>
          </tr>
        </thead>
        <tbody>
            <%  for(Task obj : tasks ){ %>
	     	<tr>
	     	<% ProjectDAO pdao = new ProjectDAO(); 
	     	Project project = pdao.getById(obj.getProjectId());
	     	%>
	     		<td><a href="controller?entity=Project&action=view&id=<%= project.getId() %>"><%= project.getName() %></a></td>
	     		<td><%= obj.getName() %></td>
	     		<td>
		     		<%if(obj.getStatus().equals(0)) {%>
	            		<span class="label label-default">To-Do</span>
	            	<% } %>
	            	<%if(obj.getStatus().equals(1)) {%>
	            		<span class="label label-warning">In Progress</span>
	            	<% } %>
	            	<%if(obj.getStatus().equals(2)) {%>
	            		<span class="label label-success">Done</span>
	            	<% } %>
	     		</td>
	     		<td>
	     		<%if(obj.getPriority().equals(0)) {%>
            		<span class="label label-default">Low</span>
            	<% } %>
            	<%if(obj.getPriority().equals(1)) {%>
            		<span class="label label-warning">Medium</span>
            	<% } %>
            	<%if(obj.getPriority().equals(2)) {%>
            		<span class="label label-danger">High</span>
            	<% } %>
	     		</td>
	     	
	        </tr>
		    <% } %>  
			  
	        </tbody>
	      </table>
			
			<p>
			Number of tasks done: <span class="badge"><%=numberTasksDone%></span>
			</p> 
			<p>
			Number of tasks done Today: <span class="badge"><%=numberTasksDoneToday%></span>
			</p> 
			
			

    </div> <!-- /container -->

	<%@include file="includes/footer.jsp" %>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  
</body>
</html>
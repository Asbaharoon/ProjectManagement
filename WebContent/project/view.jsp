<!DOCTYPE html>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
	
<script>
$(document).ready(function(){
	 $("#newTask").click(function()
	 {	 
		  $("#containerModal").load("task/create.jsp", { "project_id": <%=request.getParameter("id")%> } ,function(response,status,xhr)
		  {
		    if(status=="success")
		    	$('#modal').modal('show');
		    if(status=="error")
		      alert("Error: "+xhr.status+": "+xhr.statusText);
		  });
	});
	 
	 
	 $(".viewTask").click(function()
	 {	 
		 var task_id =  $(this).attr("taskId");
		  $("#containerModal").load("task/view.jsp", { "id": task_id } ,function(response,status,xhr)
		  {
		    if(status=="success")
		    	$('#modal').modal('show');
		    if(status=="error")
		      alert("Error: "+xhr.status+": "+xhr.statusText);
		  });
	});
	 
	 $(".editTask").click(function()
	 {	 
		 var task_id =  $(this).attr("taskId");
		  $("#containerModal").load("task/edit.jsp", { "id": task_id } ,function(response,status,xhr)
		  {
		    if(status=="success")
		    	$('#modal').modal('show');
		    if(status=="error")
		      alert("Error: "+xhr.status+": "+xhr.statusText);
		  });
	});
});


</script>
	
<body>

	<%@include file="../includes/navbar.jsp" %>
	
	<%@ page import="br.com.ernaneluis.model.Task" %>
	<%@ page import="br.com.ernaneluis.model.Project" %>
	<%@ page import="java.util.HashMap" %>
	<%@ page import="java.util.List" %>
	
    <% HashMap<String, Object> hash = (HashMap<String, Object>)  request.getAttribute("dataView");  
    Project obj = (Project)  hash.get("project");
    List<Task> tasks = (List<Task>) hash.get("tasks");
    String timeSpent = (String) hash.get("timeSpent");
    %>

    <div class="container" style="font-size: 1.2em;">
		<div class="page-header2">
			<h3>View Project #<%=obj.getId()%></h3>
			
			<% if(session.getAttribute("user_id").equals(obj.getLeader().getId()) || session.getAttribute("user_permission").equals(-1)) {%>
				<a href="controller?entity=Project&action=edit&id=<%=obj.getId()%>" class="btn btn-primary navbar-right" type="button">Edit Project</a>
			<% } %>
		</div>
		
		
		<div class="row ">
	  		<div class="col-md-6">
		  	<p>
				<strong>Name: </strong>
				<span class="info"><%=obj.getName()%></span>
			</p>
			
			<p>
				<strong>Client: </strong>
				<span class="info"><a href="controller?entity=Client&action=view&id=<%= obj.getClient().getId()%>" > <%=obj.getClient().getName()%> </a></span>
			</p>
			
			<p>
				<strong>Leader: </strong>
				<span class="info"><a href="controller?entity=Employee&action=view&id=<%= obj.getLeader().getId()%>" > <%=obj.getLeader().getName()%> </a></span>
			</p>
		  	
		  	<div>
				
				<strong>Progress: </strong>
			
				<div class="progress">
				  <div class="progress-bar" role="progressbar" aria-valuenow="<%= obj.getProgress() %>" aria-valuemin="0" aria-valuemax="100" style="width:<%= obj.getProgress().intValue() %>%;">
				    <span class="sr-only"><%=String.format("%.2f", obj.getProgress()).replace(",", ".")%></span>
				  </div>
				</div>
			</div>
		  
		  </div>
		  
		  <div class="col-md-6">
			<p>
				<strong>Star Date: </strong>
				<span class="label label-default"><%=obj.getStartDateToString()%></span>
			</p>
			
			<p>
				<strong>End Date: </strong>
				<span class="label label-danger"><%=obj.getEndDateToString()%></span>
			</p>
				
			<p>
				<strong>Time Spent: </strong>
				<span class="info"><%=timeSpent%></span>
			</p>	
			
		  </div>
	  
	</div><!-- end div row -->
		
		<p>
			<strong>Description: </strong>
			<span class="info"><%=obj.getDescription()%></span>
		</p>
	
	
	<div class="page-header2">
		<h3>Tasks</h3>
		<button type="button" class="btn btn-success navbar-right"  id="newTask" >New Task</button>
	</div>
	
	
	<!-- START TASK TABLE -->	
	<table class="table table-bordered">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Responsible</th>
            <th>Status</th>
            <th>Priority</th>
            
            <th width="129">Action</th>
          </tr>
        </thead>
        <tbody>
          <% for(Task task : tasks) { %>
          <tr>
          
            <td> <%=task.getId()%> </td>
            <td> <span  taskId="<%=task.getId()%>" class="label label-info viewTask" style="cursor:pointer"> <%=task.getName()%></span> </td>
            <td>
            	<a href="controller?entity=Employee&action=view&id=<%=task.getResponsible().getId()%>">
            		<%=task.getResponsible().getName()%>
            	</a> 
            </td>
            <td>
            	<%if(task.getStatus().equals(0)) {%>
            		<span class="label label-default">To-Do</span>
            	<% } %>
            	<%if(task.getStatus().equals(1)) {%>
            		<span class="label label-warning">In Progress</span>
            	<% } %>
            	<%if(task.getStatus().equals(2)) {%>
            		<span class="label label-success">Done</span>
            	<% } %>
            	 
            </td>
            
            <td>
            	<%if(task.getPriority().equals(0)) {%>
            		<span class="label label-default">Low</span>
            	<% } %>
            	<%if(task.getPriority().equals(1)) {%>
            		<span class="label label-warning">Medium</span>
            	<% } %>
            	<%if(task.getPriority().equals(2)) {%>
            		<span class="label label-danger">High</span>
            	<% } %>
            </td>
            
            
            
            <td> 
            
            	<%if(task.getStatus().equals(0)) {%>
	            	<a href="controller?entity=Task&action=start&id=<%= task.getId()%>" class="btn btn-default btn-sm" type="button">
	            		<span class="glyphicon glyphicon-play"></span>
	            	</a> 
            	<% } %>
            	<%if(task.getStatus().equals(1)) {%>
            		<a href="controller?entity=Task&action=done&id=<%= task.getId()%>" class="btn btn-default btn-sm" type="button">
            			<span class="glyphicon glyphicon-ok"></span>
            		</a> 
            	<% }%>
            	
            	<%if(!task.getStatus().equals(2)) {%>
            	<button taskId="<%=task.getId()%>" class="btn btn-default btn-sm editTask" type="button">
            		<span class="glyphicon glyphicon-edit"></span>
            	</button>
            	<% }%>
            	
            	<% if(session.getAttribute("user_id").equals(obj.getLeader().getId()) || session.getAttribute("user_permission").equals(-1) ) {%>
	            	<a href="controller?entity=Task&action=delete&id=<%= task.getId() %>" class="btn btn-default btn-sm" type="button">
	            		<span class="glyphicon glyphicon-trash"></span>
	            	</a> 
            	<% }%>
           	</td>
           	
          </tr>
         <% } %>
        </tbody>
      </table> 
	<!-- END TASK TABLE -->
	<div id="containerModal"></div>	

 </div> <!-- /container -->

	<%@include file="../includes/footer.jsp" %>


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  
</body>
</html>
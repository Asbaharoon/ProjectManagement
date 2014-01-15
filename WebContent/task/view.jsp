<%@ page import="br.com.ernaneluis.model.Task" %>
<%@ page import="br.com.ernaneluis.dao.TaskDAO" %>
<% 
	Integer id = Integer.parseInt(request.getParameter("id"));
	TaskDAO dao = new TaskDAO();
	Task obj = dao.getById(id);
%>

<div class="modal fade" id="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">View Task <%=obj.getId()%> - <%= obj.getName()%></h4>
      </div>
      
      <div class="modal-body">
	
		  
		  <div class="form-group">
		    <label>Responsible:</label>
		    <a href="controller?entity=Employee&action=view&id=<%=obj.getResponsible().getId()%>">
            	<%=obj.getResponsible().getName()%>
            </a> 
		  </div>
		  
		  <div class="form-group">
		    <label>Status:</label>
		    	<%if(obj.getStatus().equals(0)) {%>
            		<span class="label label-default">To-Do</span>
            	<% } %>
            	<%if(obj.getStatus().equals(1)) {%>
            		<span class="label label-warning">In Progress</span>
            	<% } %>
            	<%if(obj.getStatus().equals(2)) {%>
            		<span class="label label-success">Done</span>
            	<% } %>
		  </div>
	
		   
		  <div class="form-group">
		    <label>Priority:</label>
				<%if(obj.getPriority().equals(0)) {%>
					<span class="label label-default">Low</span>
				<% } %>
				<%if(obj.getPriority().equals(1)) {%>
					<span class="label label-warning">Medium</span>
				<% } %>
				<%if(obj.getPriority().equals(2)) {%>
					<span class="label label-danger">High</span>
				<% } %>
		  </div>
		  
		  <%if(!obj.getStatus().equals(0)) {%>
			  <div class="form-group">
			  	<label>Start Time:</label>
			    <span class="label label-default"><%=obj.getStartTimeFormatted()%></span> 
			  </div>
		  <% } %>
		  
		   <%if(obj.getStatus().equals(2)) {%> <!-- done -->
			  <div class="form-group">
			  	<label>End Time:</label>
			    <span class="label label-success"><%=obj.getEndTimeFormatted()%></span> 
			  </div>
		  <% } %>
		  
		   <div class="form-group">
		  	<label>Estimated Time:</label>
		    <span class="label label-info"><%=obj.getEstimatedTimeFormatted()%></span> 
		  </div>
		  
		   <%if(obj.getStatus().equals(2)) {%> <!-- done -->
			   <div class="form-group">
			  	<label>Time Spent:</label>
			    <span class="label label-info"> <%=obj.getTimeSpent()%></span> 
			  </div>
		   <% } %>
		 
		   <div class="form-group">
		   	<label>Description:</label>
			<span class="info"><%=obj.getDescription()%></span>
		  </div>

      </div><!-- /.modal-modal-body -->
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

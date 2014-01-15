<%@ page import="br.com.ernaneluis.model.Task" %>
<%@ page import="br.com.ernaneluis.dao.TaskDAO" %>
<%@ page import="br.com.ernaneluis.model.Project" %>
<%@ page import="br.com.ernaneluis.dao.ProjectDAO" %>
<% 
	Integer id = Integer.parseInt(request.getParameter("id"));
	TaskDAO tdao = new TaskDAO();
	Task obj = tdao.getById(id);
	
	ProjectDAO pdao = new ProjectDAO();
	Project project = pdao.getById(obj.getProjectId());
%>
<div class="modal fade" id="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Edit Task #<%=obj.getId()%></h4>
      </div>
      
      <div class="modal-body">
      
       <form id="form" action="controller?entity=Task&action=edit" method="POST" autocomplete="off">
      <input type="hidden" name="id" value="<%=obj.getId()%>">
		<!-- START FORM  -->	
		  <div class="form-group">
		    <label>Name</label>
		    <input class="form-control" name="name" placeholder="Name of the Task" value="<%=obj.getName()%>" required>
		  </div>
		  
		  <div class="form-group">
		    <label>Responsible</label>
		    <select class="form-control" name="responsible" id="responsible">
				    <%@ page import="br.com.ernaneluis.model.Employee" %>
				    <%@ page import="br.com.ernaneluis.dao.EmployeeDAO" %>
				    <%@ page import="java.util.List" %>
				    <% 
				    	EmployeeDAO dao = new EmployeeDAO();
						List<Employee> list = dao.getAll();
						String select = "";
						for(Employee emp : list) 
						{
							if( obj.getResponsible().getId().equals(emp.getId()) )
								select  += "<option value='" + emp.getId() + "' selected>" + emp.getName() +"</option>";
							else	
								select  += "<option value='" + emp.getId() + "'>" + emp.getName() +"</option>";
						}
					    out.print(select);	
				    %>
			 </select>
		  </div>
		  
		   
		  <div class="form-group">
		    <label>Priority</label>
		    <select class="form-control" name="priority">
			    <% 
			    String selected0 = ""; String selected1 = ""; String selected2 = "";
			    if(obj.getPriority().equals(0)) selected0 = "selected";
			    if(obj.getPriority().equals(1)) selected1 = "selected";
			    if(obj.getPriority().equals(2)) selected2 = "selected";
			    %>
		    	<option value="0" <%=selected0%> >Low</option>
		    	<option value="1" <%=selected1%> >Medium</option>
		    	<option value="2" <%=selected2%> >High</option>
		    </select>
		  </div>
		  
		  <%
		  	String hour = obj.getEstimatedTime().substring(0, 2);
		  	String minute = obj.getEstimatedTime().substring(3);
		  %>
		  <label>Estimated Time</label>
		  	<!-- ONLY THE LEADER CAN EDIT THE ESTIMATED TIME -->
			<% if(session.getAttribute("user_id").equals(project.getLeader().getId()) || session.getAttribute("user_permission").equals(-1)) {%>			  
		     <div class="row">
			    <div class="col-xs-1" style="width:13%;">
			    	<input class="form-control " name="estimated_time_hour" maxlength="2" value="<%=hour%>" required>
			    </div>
			    
			     <div class="col-xs-1" style="padding-right:0; padding-left:0; width:0.333%; font-size:20px">
			   		<span>:</span>
			    </div>
			   
			    <div class="col-xs-1" style="width:13%;">
			    	<input class="form-control" name="estimated_time_min" maxlength="2" value="<%=minute%>" required>
			    </div>
			  </div>
			  <% } else { %>
			  	<p><%=hour%> : <%=minute%></p>
			  <% } %>
		  
		  
		   <div class="form-group">
		   	<label>Description</label>
			<textarea class="form-control" rows="3" name="description" required><%=obj.getDescription()%></textarea>	 
		  </div>
		 
		     <div class="modal-footer">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
		 
		<!-- END FORM  -->
		 </form>
      </div><!-- /.modal-modal-body -->
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">New Task</h4>
      </div>
      
      <div class="modal-body">
      
       <form id="form" action="controller?entity=Task&action=create" method="POST" autocomplete="off">
       <input type="hidden" name="project_id" value="<%=request.getParameter("project_id")%>">
		<!-- START FORM  -->	
		  <div class="form-group">
		    <label>Name</label>
		    <input class="form-control" name="name" placeholder="Name of the Task" required>
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
						for(Employee obj : list) select  += "<option value='" + obj.getId() + "'>" + obj.getName() +"</option>";
					    out.print(select);	
				    %>
			 </select>
		  </div>
		
		   
		  <div class="form-group">
		    <label>Priority</label>
		    <select class="form-control" name="priority">
		    	<option value="0">Low</option>
		    	<option value="1">Medium</option>
		    	<option value="2">High</option>
		    </select>
		  </div>
		  
		  <label>Estimated Time</label>
		     <div class="row">
			    <div class="col-xs-1" style="width:13%;">
			    	<input class="form-control " name="estimated_time_hour" maxlength="2" value="00" required>
			    </div>
			    
			     <div class="col-xs-1" style="padding-right:0; padding-left:0; width:0.333%; font-size:20px">
			   		<span>:</span>
			    </div>
			   
			    <div class="col-xs-1" style="width:13%;">
			    	<input class="form-control" name="estimated_time_min" maxlength="2" value="00" required>
			    </div>
		   </div>
		  
		   <div class="form-group">
		   	<label>Description</label>
			<textarea class="form-control" rows="3" name="description" required></textarea>	 
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

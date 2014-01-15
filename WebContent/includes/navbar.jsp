
<div class="container">
<!-- Static navbar -->
  <div role="navigation" class="navbar navbar-default">
  
    <div class="navbar-header">
      <div  class="navbar-brand">Project Management</div>
    </div>
    
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="${pageContext.request.contextPath}/controller?entity=Dashboard">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/controller?entity=Project">Projects</a></li>
        <li><a href="${pageContext.request.contextPath}/controller?entity=Client">Clients</a></li>
        <li><a href="${pageContext.request.contextPath}/controller?entity=Employee">Employees</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">  
        <li class="dropdown">
          <a data-toggle="dropdown" class="dropdown-toggle" href="#"><%= session.getAttribute("user_name") %><b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
            	<a href="${pageContext.request.contextPath}/controller?entity=Employee&action=view&id=<%=session.getAttribute("user_id")%>">
            		View Profile
            	</a>
            </li>
            <li><a href="session.jsp?action=logout">Logout</a></li>
          </ul>
        </li>
      </ul>
     </div><!--/.nav-collapse -->
  </div> 
</div><!--  container -->
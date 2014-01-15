package br.com.ernaneluis.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ernaneluis.dao.ClientDAO;
import br.com.ernaneluis.dao.EmployeeDAO;
import br.com.ernaneluis.dao.ProjectDAO;
import br.com.ernaneluis.model.Client;
import br.com.ernaneluis.model.Employee;
import br.com.ernaneluis.model.Project;
import br.com.ernaneluis.model.Task;

public class ProjectController extends Controller {

	@Override
	void index(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		ProjectDAO dao = new ProjectDAO();
		List<Project> list = dao.getAll();
		
	    String url = "project/index.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", list);
	    view.forward(request, response);  
		
		
	}

	@Override
	void view(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		ProjectDAO dao = new ProjectDAO();
		Project obj = dao.getById(id);
		
		Double progress = dao.getProjectProgress(obj.getId());
		obj.setProgress(progress);
		
		String timeSpent = dao.getTotalTimeSpent(obj.getId());
		
		List<Task> tasks = dao.getAllTasks(id.intValue());
		
		HashMap<String, Object> dataView = new HashMap<String, Object>();
		dataView.put("project", obj);
		dataView.put("tasks", tasks);
		dataView.put("timeSpent", timeSpent);
		
		
		String url = "project/view.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", dataView);
	    view.forward(request, response); 
		
	}

	@Override
	void create(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		Project obj = new Project();
		obj.setName(request.getParameter("name"));
		obj.setProgress(0.0);
		obj.setDescription(request.getParameter("description"));
		
		
		ClientDAO cdao = new ClientDAO();
		Client client = cdao.getById( Integer.parseInt(request.getParameter("client_id")));
		obj.setClient(client);
		
		EmployeeDAO edao = new EmployeeDAO();
		Employee employee = edao.getById(Integer.valueOf(request.getParameter("leader_id")));
		obj.setLeader(employee);
		
		//DATE
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	
		
		//START DATE
		try 
		{
			Calendar calendar = Calendar.getInstance();
			calendar.setTime( formatter.parse(request.getParameter("start_date")) );
			obj.setStartDate(calendar);
		} 
		catch (ParseException e1) { e1.printStackTrace(); } 
		
		
		//END DATE
		try 
		{
			Calendar calendar = Calendar.getInstance();
			calendar.setTime( formatter.parse(request.getParameter("end_date")) );
			obj.setEndDate(calendar);
		} 
		catch (ParseException e) { e.printStackTrace(); }
		
		
		ProjectDAO dao = new ProjectDAO();
		dao.add(obj);
		
		response.sendRedirect("controller?entity=Project");
		
	}

	@Override
	void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		//Do this when the action is get, this create a edit view with all information of the client
		if(request.getMethod().equals("GET"))
		{
		
			Integer id = Integer.parseInt(request.getParameter("id"));
			ProjectDAO dao = new ProjectDAO();
			Project obj = dao.getById(id);
			
			String url = "project/edit.jsp";  
		    RequestDispatcher view = request.getRequestDispatcher(url); 
		    request.setAttribute("dataView", obj);
		    view.forward(request, response); 
		
		}
		//Do This when the form of edit is submited(post)
		else if(request.getMethod().equals("POST"))
		{
			ProjectDAO dao = new ProjectDAO();
			Integer id = Integer.parseInt(request.getParameter("id"));
			Project obj = dao.getById(id);
			
			obj.setName(request.getParameter("name"));
			obj.setDescription(request.getParameter("description"));
					
			ClientDAO cdao = new ClientDAO();
			Client client = cdao.getById( Integer.parseInt(request.getParameter("client_id")));
			obj.setClient(client);
			
			if(request.getParameter("leader_id") != null){
				EmployeeDAO edao = new EmployeeDAO();
				Employee employee = edao.getById(Integer.valueOf(request.getParameter("leader_id")));
				obj.setLeader(employee);
			}
			
			//DATE
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	
			
			//START DATE
			try 
			{
				Calendar calendar = Calendar.getInstance();
				calendar.setTime( formatter.parse(request.getParameter("start_date")) );
				obj.setStartDate(calendar);
			} 
			catch (ParseException e1) { e1.printStackTrace(); } 
			
			
			//END DATE
			try 
			{
				Calendar calendar = Calendar.getInstance();
				calendar.setTime( formatter.parse(request.getParameter("end_date")) );
				obj.setEndDate(calendar);
			} 
			catch (ParseException e) { e.printStackTrace(); }
			
			dao.update(obj);
			
			response.sendRedirect("controller?entity=Project&action=view&id=" + String.valueOf( obj.getId() ));
		}
		
	}

	@Override
	void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		ProjectDAO dao = new ProjectDAO();
		Project obj = dao.getById(id);
		dao.deleteAllTask(id);
		dao.delete(obj);
		response.sendRedirect("controller?entity=Project");
	}

}

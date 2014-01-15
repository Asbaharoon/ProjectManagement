package br.com.ernaneluis.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ernaneluis.dao.EmployeeDAO;
import br.com.ernaneluis.dao.TaskDAO;
import br.com.ernaneluis.model.Employee;
import br.com.ernaneluis.model.Task;

public class TaskController extends Controller
{

	@Override
	void index(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		if(request.getParameter("action").equals("start")){
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			TaskDAO dao = new TaskDAO();
			Task obj = dao.getById(id);
			
			Date date = new Date();
			Timestamp time = new Timestamp(date.getTime());
			obj.setStartTime(time);
			obj.setStatus(1);
			dao.update(obj);
			
			response.sendRedirect("controller?entity=Project&action=view&id=" + obj.getProjectId());	
		}
		if(request.getParameter("action").equals("done")){
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			TaskDAO dao = new TaskDAO();
			Task obj = dao.getById(id);
			
			Date date = new Date();
			Timestamp time = new Timestamp(date.getTime());
			obj.setEndTime(time);
			obj.setStatus(2);
			
			dao.update(obj);
			response.sendRedirect("controller?entity=Project&action=view&id=" + obj.getProjectId());
		}
	}

	@Override
	void view(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
		
	}

	@Override
	void create(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Task obj = new Task();
		obj.setName(request.getParameter("name"));
		obj.setStatus(0); //always start as to-do task
		obj.setDescription(request.getParameter("description"));
		obj.setPriority(Integer.parseInt(request.getParameter("priority")));
		obj.setProjectId(Integer.parseInt(request.getParameter("project_id")));
		obj.setStartTime(null);
		obj.setEndTime(null);
		

		String time =  request.getParameter("estimated_time_hour") + ":" + request.getParameter("estimated_time_min");
		obj.setEstimatedTime(time);

		EmployeeDAO edao = new EmployeeDAO();
		Employee responsible = edao.getById(Integer.valueOf(request.getParameter("responsible")));		
		obj.setResponsible(responsible);
		
		TaskDAO dao = new TaskDAO();
		dao.add(obj);
		
		response.sendRedirect("controller?entity=Project&action=view&id=" + request.getParameter("project_id"));	
	}

	@Override
	void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		TaskDAO dao = new TaskDAO();
		Task obj = dao.getById(id);
		
		obj.setName(request.getParameter("name"));
		obj.setDescription(request.getParameter("description"));
		obj.setPriority(Integer.parseInt(request.getParameter("priority")));

		if(request.getParameter("estimated_time_hour") != null){
			String time =  request.getParameter("estimated_time_hour") + ":" + request.getParameter("estimated_time_min");
			obj.setEstimatedTime(time);
		}

		EmployeeDAO edao = new EmployeeDAO();
		Employee responsible = edao.getById(Integer.valueOf(request.getParameter("responsible")));		
		obj.setResponsible(responsible);
		
		dao.update(obj);
		
		response.sendRedirect("controller?entity=Project&action=view&id=" + obj.getProjectId());
	}

	@Override
	void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		TaskDAO dao = new TaskDAO();
		Task obj = dao.getById(id);
		int projectId = obj.getProjectId();
		dao.delete(obj);
		
		response.sendRedirect("controller?entity=Project&action=view&id=" + projectId);	
		
	}
	
	

}

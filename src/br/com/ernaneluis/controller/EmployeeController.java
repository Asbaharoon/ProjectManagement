package br.com.ernaneluis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ernaneluis.dao.EmployeeDAO;
import br.com.ernaneluis.model.Employee;


public class EmployeeController extends Controller {
	

	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeeDAO dao = new EmployeeDAO();
		List<Employee> list = dao.getAll();
		
	    String url = "employee/index.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", list);
	    view.forward(request, response);  
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		EmployeeDAO dao = new EmployeeDAO();
		Employee obj = dao.getById(id);
		
		String url = "employee/view.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", obj);
	    view.forward(request, response); 
		 
		
	}

	@Override
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Employee obj = new Employee();
		
		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPassword(request.getParameter("password"));
		obj.setRole(Integer.valueOf( request.getParameter("role") ) );
		
		
		EmployeeDAO dao = new EmployeeDAO();
		dao.add(obj);
		
		response.sendRedirect("controller?entity=Employee");
		
	}
	
	
	@Override
	void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//Do this when the action came from the URL (get), this create a edit view with all information
		if(request.getMethod().equals("GET"))
		{
		
			Integer id = Integer.parseInt(request.getParameter("id"));
			EmployeeDAO dao = new EmployeeDAO();
			Employee obj = dao.getById(id);
			
			String url = "employee/edit.jsp";  
		    RequestDispatcher view = request.getRequestDispatcher(url); 
		    request.setAttribute("dataView", obj);
		    view.forward(request, response); 
		
		}
		//Do This when the form of edit is submited(post)
		else if(request.getMethod().equals("POST"))
		{
			EmployeeDAO dao = new EmployeeDAO();
			Integer id = Integer.parseInt(request.getParameter("id"));
			Employee obj = dao.getById(id);
			
			obj.setName(request.getParameter("name"));
			obj.setEmail(request.getParameter("email"));
			obj.setPassword(request.getParameter("password"));
			obj.setRole( Integer.valueOf( request.getParameter("role") ));
			
			dao.update(obj);
			
			response.sendRedirect("controller?entity=Employee&action=view&id=" + obj.getId().toString());
		}
	}
	

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		EmployeeDAO dao = new EmployeeDAO();
		Employee obj = dao.getById(id);
		dao.delete(obj);
		
		response.sendRedirect("controller?entity=Employee");
		
	}

	
	
}

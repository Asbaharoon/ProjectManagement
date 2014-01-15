package br.com.ernaneluis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ernaneluis.dao.ClientDAO;
import br.com.ernaneluis.model.Client;

public class ClientController extends Controller {
	

	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClientDAO dao = new ClientDAO();
		List<Client> list = dao.getAll();
		
	    String url = "client/index.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", list);
	    view.forward(request, response);  
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		ClientDAO dao = new ClientDAO();
		Client obj = dao.getById(id);
		
		String url = "client/view.jsp";  
	    RequestDispatcher view = request.getRequestDispatcher(url); 
	    request.setAttribute("dataView", obj);
	    view.forward(request, response); 
		 
		
	}

	@Override
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Client obj = new Client();
		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhone(request.getParameter("phone"));
		obj.setWebsite(request.getParameter("website"));
		obj.setOther(request.getParameter("other"));
		
		ClientDAO dao = new ClientDAO();
		dao.add(obj);
		
		response.sendRedirect("controller?entity=Client");
		
	}
	
	
	@Override
	void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//Do this when the action came from the URL (get), this create a edit view with all information of the client
		if(request.getMethod().equals("GET"))
		{
		
			Integer id = Integer.parseInt(request.getParameter("id"));
			ClientDAO dao = new ClientDAO();
			Client obj = dao.getById(id);
			
			String url = "client/edit.jsp";  
		    RequestDispatcher view = request.getRequestDispatcher(url); 
		    request.setAttribute("dataView", obj);
		    view.forward(request, response); 
		
		}
		//Do This when the form of edit is submited(post)
		else if(request.getMethod().equals("POST"))
		{
			ClientDAO dao = new ClientDAO();
			Integer id = Integer.parseInt(request.getParameter("id"));
			Client obj = dao.getById(id);
			obj.setName(request.getParameter("name"));
			obj.setEmail(request.getParameter("email"));
			obj.setPhone(request.getParameter("phone"));
			obj.setWebsite(request.getParameter("website"));
			obj.setOther(request.getParameter("other"));
			
			dao.update(obj);
			
			response.sendRedirect("controller?entity=Client&action=view&id=" + obj.getId().toString());
		}
	}
	

	
	

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		ClientDAO dao = new ClientDAO();
		Client obj = dao.getById(id);
		dao.delete(obj);
		
		response.sendRedirect("controller?entity=Client");
		
	}

	
	
}

package br.com.ernaneluis.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ernaneluis.dao.DashboardDAO;


public class DashboardController extends Controller {

	@Override
	void index(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		DashboardDAO dao = new DashboardDAO();
		 HttpSession session = request.getSession();
		 Integer userId = (Integer) session.getAttribute("user_id");
		 
		 String url = "dashboard.jsp";  
		 RequestDispatcher view = request.getRequestDispatcher(url); 
		 request.setAttribute("taskList", dao.getTasksToDo(userId) );
		 request.setAttribute("numberTasksDone", dao.getNumberTasksDone(userId) );
		 request.setAttribute("numberProjects", dao.getNumberOfProjects() );
		 request.setAttribute("numberClients", dao.getNumberOfClients() );
		 request.setAttribute("numberEmployees", dao.getNumberOfEmployees() );
		 request.setAttribute("numberTasksDoneToday", dao.getNumberTasksDoneToday(userId) );
		 
		 
	     view.forward(request, response); 
	}

	@Override
	void view(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	void create(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	void edit(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

}

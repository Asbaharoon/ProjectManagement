package br.com.ernaneluis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import br.com.ernaneluis.dao.EmployeeDAO;
import br.com.ernaneluis.model.Employee;


public class LoginController extends Controller {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println(email);
                
        EmployeeDAO dao = new EmployeeDAO();
        Employee emp = dao.login(email, password);
        
        if(emp != null){
        	 HttpSession session = request.getSession(); 
             session.setAttribute("user_permission", emp.getRole());
             session.setAttribute("user_name", emp.getName());
             session.setAttribute("user_id", emp.getId());
             
             
             JSONObject obj = new JSONObject();
             obj.put("url","controller?entity=Dashboard");
        	 obj.put("status","1");
        	 
        	 response.setContentType("text/html");
             response.setHeader("Cache-Control", "no-cache");
             response.getWriter().write(obj.toJSONString()); 
        }
        else{
        	
        	 JSONObject obj=new JSONObject();
        	 obj.put("error","The credentials you entered were invalid, please try again.");  
        	 obj.put("status","0");
        	 
        	 response.setContentType("text/html");
             response.setHeader("Cache-Control", "no-cache");
             response.getWriter().write(obj.toJSONString()); 
        }
        

	}

	@Override
	void index(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
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
	void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	void edit(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

}

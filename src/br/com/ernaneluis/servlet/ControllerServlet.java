package br.com.ernaneluis.servlet;

import br.com.ernaneluis.controller.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
    {

        String parameter = request.getParameter("entity");
        String className = "br.com.ernaneluis.controller." + parameter + "Controller" ;
        System.out.println(className);

        try {
            Class<?> classe = Class.forName(className);

            Controller cont = (Controller) classe.newInstance();
            cont.execute(request, response);

        } catch (Exception e) {
            throw new ServletException("exception", e);
        }
    }
}
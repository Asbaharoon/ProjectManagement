package br.com.ernaneluis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public abstract class Controller {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		//if parameter action exists 
		if(request.getParameterMap().containsKey("action"))
		{
			if(!request.getParameter("action").equals(""))
			{
				if(request.getParameter("action").equals("view"))   this.view(request, response);
				else if(request.getParameter("action").equals("create")) this.create(request, response);
				else if(request.getParameter("action").equals("edit")) 	this.edit(request, response);
				else if(request.getParameter("action").equals("delete")) this.delete(request, response);
				else this.index(request, response);
			}
			else
			{
				this.index(request, response);
			}
			
		}
		else{
			this.index(request, response);
		}
		
		
			
	}
	
	abstract void index(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	
	abstract void view(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	
	abstract void create(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	
	abstract void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	
	abstract void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
}
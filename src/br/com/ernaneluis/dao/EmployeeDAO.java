package br.com.ernaneluis.dao;

import java.util.List;

import br.com.ernaneluis.model.Employee;

public class EmployeeDAO extends GenericDAO<Employee> {
	
	public EmployeeDAO() {
		
    }
	
	public Employee login(String email, String password){
		
		 try{
	           
		 System.out.println("try login");
		@SuppressWarnings("unchecked")
		List<Employee> list =  getManager().createQuery(
	        	    "SELECT emp FROM Employee emp WHERE emp.email = :email AND emp.password = :password")
	        	    .setParameter("email", email)
	        	    .setParameter("password", password)
	        	    .getResultList();
		 return list.get(0);
		 
		 }catch(Exception e){
	            e.printStackTrace();
	            Employee emp = null;
	            return emp;
	        }
		 
	}
	
}
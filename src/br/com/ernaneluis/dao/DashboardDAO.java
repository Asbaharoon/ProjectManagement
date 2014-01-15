package br.com.ernaneluis.dao;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.ernaneluis.model.Employee;
import br.com.ernaneluis.model.Task;
import br.com.ernaneluis.dao.EmployeeDAO;

public class DashboardDAO  {
	
	EntityManagerFactory factory;
	EntityManager manager;
	 
	 public DashboardDAO(){
		 this.factory = Persistence.createEntityManagerFactory("ProjectManagement");
		 this.manager = factory.createEntityManager();
	 }
	
	public List<Task> getTasksToDo(Integer userId){
		EmployeeDAO edao = new EmployeeDAO();
		Employee emp = edao.getById(userId);
		@SuppressWarnings("unchecked")
		List<Task> list =  manager.createQuery(
	        	    "SELECT tsk FROM Task tsk WHERE tsk.responsible = :responsible AND tsk.status < 2")
	        	    .setParameter("responsible", emp)
	        	    .getResultList();
		 return list;
	}
	
	//SELECT COUNT(*) FROM task WHERE responsible = 1 AND status = 2
			
	public Integer getNumberTasksDone(Integer userId){
		EmployeeDAO edao = new EmployeeDAO();
		Employee emp = edao.getById(userId);

		Long number = (Long) manager.createQuery(
	        	    "SELECT  COUNT(*) FROM Task  WHERE responsible = :responsible AND status = 2")
	        	    .setParameter("responsible", emp)
	        	    .getSingleResult();
		 return (int) (long) number;
	}
	
	public Integer getNumberOfProjects(){
		Long number = (Long) manager.createQuery(
	        	    "SELECT  COUNT(*) FROM Project")
	        	    .getSingleResult();
		 return (int) (long) number;
	}
	
	public Integer getNumberOfClients(){
		Long number = (Long) manager.createQuery(
	        	    "SELECT  COUNT(*) FROM Client")
	        	    .getSingleResult();
		 return (int) (long) number;
	}
	
	public Integer getNumberOfEmployees(){
		Long number = (Long) manager.createQuery(
	        	    "SELECT  COUNT(*) FROM Employee")
	        	    .getSingleResult();
		 return (int) (long) number;
	}

	//SELECT COUNT(*) FROM task WHERE responsible = 1 AND status = 2 AND end_time::date = now()::date
	
	public Integer getNumberTasksDoneToday(Integer userId){
		EmployeeDAO edao = new EmployeeDAO();
		Employee emp = edao.getById(userId);

		Long number = (Long) manager.createQuery(
	        	    "SELECT  COUNT(*) FROM Task  WHERE responsible = :responsible AND status = 2 AND DATE(end_time)  = CURRENT_DATE()")
	        	    .setParameter("responsible", emp)
	        	    .getSingleResult();
		 return (int) (long) number;
	}
}

package br.com.ernaneluis.dao;
import java.util.List;

import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import br.com.ernaneluis.model.Project;
import br.com.ernaneluis.model.Task;

public class ProjectDAO extends GenericDAO<Project> 
{	
	public ProjectDAO() {}
	
	public List<Task> getAllTasks(int projectId)
	{
		
		@SuppressWarnings("unchecked")
		List<Task> list =  getManager().createQuery(
	        	    "SELECT task FROM Task task WHERE task.projectId = :id")
	        	    .setParameter("id", projectId)
	        	    .getResultList();
		 return list;	
	}
	
	
	public Integer getNumberOfTaskDone(int projectId)
	{
		@SuppressWarnings("unchecked")
		List<Long> list =  getManager().createQuery(
	        	    "SELECT count(*) FROM Task task WHERE task.status = 2 AND task.projectId = :id")
	        	    .setParameter("id", projectId)
	        	    .getResultList();
		Integer result = (int) (long) list.get(0);
		return result;	
	}
	
	
	public Integer getNumberOfAllTask(int projectId)
	{
		@SuppressWarnings("unchecked")
		List<Long> list =  getManager().createQuery(
	        	    "SELECT count(*) FROM Task task WHERE task.projectId = :id")
	        	    .setParameter("id", projectId)
	        	    .getResultList();
		Integer result = (int) (long) list.get(0);
		return result;	
	}
	
	public Double getProjectProgress(int projectId)
	{
		Integer numberTaskDone = getNumberOfTaskDone(projectId);
		Integer numberAllTask = getNumberOfAllTask(projectId);
		//System.out.println(numberTaskDone + ' ' + numberAllTask);
		Double result = 0.0;
		if( numberTaskDone > 0 && numberAllTask > 0)
		{
			result =  numberTaskDone.doubleValue() /  numberAllTask.doubleValue();
			result = result * 100;
		}
		return result;
	}
	
	public String getTotalTimeSpent(int projectId)
	{
		ProjectDAO dao = new ProjectDAO();
		Project obj = dao.getById(projectId);
		List<Task> tasks = dao.getAllTasks(obj.getId());
		
		double totalTime = 0.0;
		for(Task task : tasks)
		{
			if(task.getStatus().equals(2))
			{
				double timeInMiliSeconds = Math.abs(task.getEndTime().getTime() - task.getStartTime().getTime());
				totalTime += timeInMiliSeconds;
				
			}
		}
		
		String rtn = "00 hour(s) 00 minute(s)";
		if(totalTime > 0)
		{
			int timeInSeconds = (int) totalTime / 1000;
			int hours, minutes;
			hours = timeInSeconds / 3600;
		    timeInSeconds = timeInSeconds - (hours * 3600);
			minutes = timeInSeconds / 60;
			rtn = hours + " hour(s) " + minutes + " minute(s)";
		}
		return rtn;
		
	}
	
	public void deleteAllTask(Integer id)
	{
		EntityTransaction tx = getManager().getTransaction();
		tx.begin();
		Query query = getManager().createQuery("DELETE Task WHERE projectId = :id");
        query.setParameter("id", id);
        query.executeUpdate();
        tx.commit();
	}
	
}
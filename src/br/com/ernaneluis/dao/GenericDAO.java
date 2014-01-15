package br.com.ernaneluis.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;



public abstract class GenericDAO<Ent> {
	
    private EntityManager manager;
    private EntityManagerFactory factory;
 
    public GenericDAO() {
    	this.factory = Persistence.createEntityManagerFactory("ProjectManagement");
		this.manager = factory.createEntityManager();
    }
 
    @SuppressWarnings("unchecked")
	public Ent getById(Integer id) {
        return (Ent) manager.find(getTypeClass(), id);
    }
 
    public void add(Ent entity) {
        
        try{
        	
        	EntityTransaction tx = manager.getTransaction();
        	
        	tx.begin();
            	manager.persist(entity);
            tx.commit();
            
            this.close();
        }catch(Exception e){
            e.printStackTrace();
            this.rollBack();
        }
        
    }
 
    
    public void update(Ent entity) {
        
        try{
        	
        	EntityTransaction tx = manager.getTransaction();
            tx.begin();
            	manager.merge(entity);
           	tx.commit();
            this.close();
            
        }catch(Exception e){
            e.printStackTrace();
            this.rollBack();
        }
        
        
    }
 
    public void delete(Ent entity) {        
        try{
        	
        	EntityTransaction tx = manager.getTransaction();
            tx.begin();
            	entity = manager.merge(entity);  
            	manager.remove(entity);  
            tx.commit();
            this.close();
            
        }catch(Exception e){
            e.printStackTrace();
            this.rollBack();
        }
    }
 
    @SuppressWarnings("unchecked")
	public List<Ent> getAll() {
        return manager.createQuery(("FROM " + getTypeClass().getName())).getResultList();
    }
 
    private Class<?> getTypeClass() {
        Class<?> clazz = (Class<?>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        return clazz;
    }
    
   /* 
    private void begin(){
    	manager.getTransaction().begin();
    }
     
    private void commit(){
    	manager.getTransaction().commit();
    }
    */
    
    /**
     * THIS METHOD NEEDS TO BE ALWAYS CALLED
     */
    private void close(){
    	manager.close();
        factory.close();
    }
     
    private void rollBack(){
    	manager.getTransaction().rollback();
    }

	public EntityManager getManager() {
		return manager;
	}

    
    
}
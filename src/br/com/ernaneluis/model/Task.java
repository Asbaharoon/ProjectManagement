package br.com.ernaneluis.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.persistence.*;

@Entity
@Table(name="task")
@SequenceGenerator(name="task_id_seq" , sequenceName="task_id_seq")
public class Task {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="task_id_seq")
	private Integer id;
	
	@Column(name = "project_id", nullable = true)
	private Integer projectId;
	
	//@Column(name = "responsible", nullable = true)
	@ManyToOne(optional = false)
	@JoinColumn(name="responsible", nullable=false)
	private Employee responsible;
	
	@Column(name = "start_time", nullable = true)
	private Timestamp startTime;
	
	@Column(name = "end_time", nullable = true)
	private Timestamp endTime;
	
	@Column(name = "estimated_time", nullable = true)
	private String estimatedTime;
		
	private String name;
	private Integer status;
	private Integer priority;
	private String description;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Employee getResponsible() {
		return responsible;
	}
	public void setResponsible(Employee responsible) {
		this.responsible = responsible;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(String estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public String getStartTimeFormatted(){
        String rtn = "";
        if(this.getStartTime() != null) rtn =  new SimpleDateFormat("H:mm dd/MM/yyyy").format(getStartTime());
        return rtn;
	}
	
	public String getEndTimeFormatted(){
		
		 String rtn = "";
	     if(this.getStartTime() != null) rtn =  new SimpleDateFormat("H:mm dd/MM/yyyy").format(getEndTime());
	     return rtn;
	}
	
	public String getTimeSpent(){
		
		double timeInMiliSeconds = Math.abs(getEndTime().getTime() - getStartTime().getTime());
		
		int timeInSeconds = (int) timeInMiliSeconds / 1000;
		 int hours, minutes;
		 //seconds;
	      hours = timeInSeconds / 3600;
	      timeInSeconds = timeInSeconds - (hours * 3600);
	      minutes = timeInSeconds / 60;
	      //timeInSeconds = timeInSeconds - (minutes * 60);
	      //seconds = timeInSeconds;
	      String rtn = hours + " hour(s) " + minutes + " minute(s)";
		return rtn;
	}
	
	
	public String getEstimatedTimeFormatted(){
		 
		return getEstimatedTime().substring(0, 2) + " hour(s) " + getEstimatedTime().substring(3) + " minute(s)";
	}

	
	
}
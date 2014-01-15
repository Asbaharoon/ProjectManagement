package br.com.ernaneluis.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.*;

@Entity
@Table(name="project")
@SequenceGenerator(name="project_id_seq" , sequenceName="project_id_seq")
public class Project {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="project_id_seq")
	private int id;
	
	//@Column(name = "client_id", nullable = true)
	@OneToOne(optional = false, fetch = FetchType.EAGER, orphanRemoval = false)
	@JoinColumn(name="client_id", nullable=false)
	private Client client;
	
	//@Column(name = "leader_id", nullable = true)
	@ManyToOne(optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name="leader_id", nullable=false)
	private Employee leader;
	
	private String name;
	
	private Double progress;

	@Column(name = "start_date", nullable = true)
    @Temporal(TemporalType.DATE)
	private Calendar startDate;

	@Column(name = "end_date", nullable = true)
    @Temporal(TemporalType.DATE)
	private Calendar endDate;
	
	private String description;

	public int getId() {
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getProgress() {
		return progress;
	}

	public void setProgress(double progress) {
		this.progress = progress;
	}

	public Calendar getStartDate() {
		return startDate;
	}

	public void setStartDate(Calendar startDate) {
		this.startDate = startDate;
	}

	public Calendar getEndDate() {
		return endDate;
	}

	public void setEndDate(Calendar endDate) {
		this.endDate = endDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Employee getLeader() {
		return leader;
	}

	public void setLeader(Employee leader) {
		this.leader = leader;
	}
	
	
	public String getStartDateToString(){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		return formatter.format(getStartDate().getTime());  
	}
	
	public String getEndDateToString(){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		return formatter.format(getEndDate().getTime());  
	}
	
	public String getStartDateDBFormat(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		return formatter.format(getStartDate().getTime());  
	}
	public String getEndDateDBFormat(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		return formatter.format(getEndDate().getTime());  
	}
	
}

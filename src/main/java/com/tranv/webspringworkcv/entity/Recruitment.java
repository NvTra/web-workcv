package com.tranv.webspringworkcv.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "recruitment")
public class Recruitment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "title")
	private String title;

	@Column(name = "type")
	private String type;

	@Column(name = "view")
	private String view;

	@Column(name = "address")
	private String address;

	@Column(name = "created_at")
	private String createdAt;

	@Column(name = "description")
	private String description;

	@Column(name = "experience")
	private String experience;

	@Column(name = "quantity")
	private String quantity;

	@Column(name = "ranked")
	private String ranked;

	@Column(name = "salary")
	private String salary;

	@Column(name = "deadline")
	private String deadline;

	@Column(name = "status")
	private int status;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "company_id")
	private Company company;



	// constructor
	public Recruitment() {
	}

	public Recruitment(String title, String type, String view, String address, String createdAt, String description,
			String experience, String quantity, String ranked, String salary, String deadline, int status,
			Category category) {
		this.title = title;
		this.type = type;
		this.view = view;
		this.address = address;
		this.createdAt = createdAt;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.ranked = ranked;
		this.salary = salary;
		this.deadline = deadline;
		this.status = status;
		this.category = category;
	}

	// getter and setter
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getRanked() {
		return ranked;
	}

	public void setRanked(String ranked) {
		this.ranked = ranked;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getdeadline() {
		return deadline;
	}

	public void setdeadline(String deadline) {
		this.deadline = deadline;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}

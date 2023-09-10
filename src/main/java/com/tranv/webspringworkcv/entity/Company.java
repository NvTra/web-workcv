package com.tranv.webspringworkcv.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "name_company")
	private String nameCompany;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "email")
	private String email;

	@Column(name = "address")
	private String address;

	@Column(name = "description")
	private String description;

	@Lob
	@Column(name = "logo", columnDefinition = "MEDIUMBLOB")
	private byte[] logo;

	@Column(name = "status")
	private int status;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "company", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	private List<Recruitment> recruitments;

	@ManyToMany(mappedBy = "companies")
	private Set<User> users = new HashSet<User>();
	// constructor

	public Company() {
	}

	public Company(String nameCompany, String phoneNumber, String email, String address, String description) {
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
		this.description = description;

	}

	// setter and getter

	public List<Recruitment> getRecruitments() {
		return recruitments;
	}

	public byte[] getLogo() {
		return logo;
	}

	public void setLogo(byte[] logo) {
		this.logo = logo;
	}

	public void setRecruitments(List<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
package com.tranv.webspringworkcv.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "applyjob")
public class ApplyPost {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "name_cv")
	private String nameCv;

	@Column(name = "status")
	private String status;

	@Column(name = "text")
	private String text;

	@Column(name = "created_at")
	private String createdAt;
	// constructor

	public ApplyPost() {
	}

	public ApplyPost(String nameCv, String status, String text) {
		super();
		this.nameCv = nameCv;
		this.status = status;
		this.text = text;
	}

	// setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameCv() {
		return nameCv;
	}

	public void setNameCv(String nameCv) {
		this.nameCv = nameCv;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

}

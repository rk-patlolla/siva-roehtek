package com.rohtek.entities;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "Employee", uniqueConstraints = { @UniqueConstraint(columnNames = "ENAME") })
@EntityListeners(AuditingEntityListener.class)
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "ID")
	private Long eid;

	@Email
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "MOBILE", unique = true)
	private Long mobile;

	@Column(name = "ENAME", unique = true)
	private String ename;

	@Column(name = "password")
	private String password;

	@Column(name = "ADDRESS")
	private String eaddress;
	@Column(name = "createDate", updatable = false)
	@CreatedDate
	private Timestamp createDate;

	@Column(name = "updateDate")
	@LastModifiedDate
	private Timestamp updateDate;

	@Column(name = "active")
	private boolean active = true;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "did", referencedColumnName = "did")
	private Department department;

	@Column(name = "role", updatable = false)
	private String role;

	@CreatedBy
	private String createdBy;

	@LastModifiedBy
	private String updatedBy;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Long getEid() {
		return eid;
	}

	public void setEid(Long eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEaddress() {
		return eaddress;
	}

	public void setEaddress(String eaddress) {
		this.eaddress = eaddress;
	}

}

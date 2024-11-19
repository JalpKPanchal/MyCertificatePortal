package com.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "students")
public class StudentEntity {

	
	@Id
	private String studentId;
	private String firstName;
	private String lastName;
	private String college;
	private String email;
	private String mobile;
	private String batchType;
	private String subject;
	private String faculty;
	private Integer regularity;
	private Integer communication;
	private Integer discipline;
	private Integer testPerformance;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBatchType() {
		return batchType;
	}
	public void setBatchType(String batchType) {
		this.batchType = batchType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public Integer getRegularity() {
		return regularity;
	}
	public void setRegularity(Integer regularity) {
		this.regularity = regularity;
	}
	public Integer getCommunication() {
		return communication;
	}
	public void setCommunication(Integer communication) {
		this.communication = communication;
	}
	public Integer getDiscipline() {
		return discipline;
	}
	public void setDiscipline(Integer discipline) {
		this.discipline = discipline;
	}
	public Integer getTestPerformance() {
		return testPerformance;
	}
	public void setTestPerformance(Integer testPerformance) {
		this.testPerformance = testPerformance;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
}

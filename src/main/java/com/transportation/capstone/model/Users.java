package com.transportation.capstone.model;

import javax.persistence.*;

@Entity
@Table(name="account")
public class Users {

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	@Id
	//@SequenceGenerator(name="mysequence", initialValue="1000")
	//add generator="mysequence" inside the below paraenthese if need to execute teh starter at 1000
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	@Transient
	private String password2;
	private String role;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", password=" + password + ", password2=" + password2 + ", role=" + role + "]";
	}
	
	
	
	
	
}

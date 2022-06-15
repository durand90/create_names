package com.fanfan.exam.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	
	@NotEmpty(message="Email is needed")
	@Email(message="Enter valid Email")
	private String email;
	
	@NotEmpty(message="Password is Required")
	@Size(min=3, max=500, message="Password need to be at least 3 characters")
	private String password;
	
	//empty constructor
	public LoginUser() {}
	
	
	//getters and setters
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
	};
	
	

}

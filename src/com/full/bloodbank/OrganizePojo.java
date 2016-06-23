package com.full.bloodbank;

import javax.jdo.annotations.PersistenceCapable;

import javax.jdo.annotations.Persistent;


@PersistenceCapable
public class OrganizePojo {

	@Persistent
	public String firstName;
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Persistent
	public String lastName;
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Persistent
	public String email;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Persistent  
	private String date1;

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}
	
	@Persistent
	public String venueDetails;

	public String getVenueDetails() {
		return venueDetails;
	}

	public void setVenueDetails(String venueDetails) {
		this.venueDetails = venueDetails;
	}
	
}

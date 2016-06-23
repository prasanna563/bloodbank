package com.full.bloodbank;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable
public class AdminPojo {

	
	@Persistent
	public String fname;
	
	public String getFname() {
		return fname;
	}




	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
	@Persistent
	public String lname;
	
	public String getLname() {
		return lname;
	}




	public void setLname(String lname) {
		this.lname = lname;
	}

	
	@Persistent
	public String uname;
	
	
	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}

	//@PrimaryKey
	@Persistent
	public String mid;
	
	public String getMid() {
		return mid;
	}




	public void setMid(String mid) {
		this.mid = mid;
	}


	
	@Persistent
	public String pass;
	
	public String getPass() {
		return pass;
	}




	public void setPass(String pass) {
		this.pass = pass;
	}

	

	@Persistent
	public String gendr;

	public String getGendr() {
		return gendr;
	}




	public void setGendr(String gendr) {
		this.gendr = gendr;
	}


	
	@Persistent
	public String phonenum;


	public String getPhonenum() {
		return phonenum;
	}




	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	
}

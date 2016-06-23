package com.full.bloodbank;

import javax.jdo.annotations.Extension;

import javax.jdo.annotations.PersistenceCapable;

import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class BloodGroupPojo {
	
	@Persistent
	public String bgroup;
	
	public String getBgroup() {
		return bgroup;
	}

	public String setBgroup(String bgroup) {
		return this.bgroup = bgroup;
	}
	
	@Persistent
	public int count=0;

	public int getCount() {
		return count;
	}

	public int setCount(int count) {
		return this.count = count;
	}
	

}

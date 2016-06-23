package com.full.dao;

import java.util.List;

import com.full.jdo.*;

public interface BloodBankDAO {

	public List<WebSitePojo> getAllUsers();
	public WebSitePojo getByMailId(String mail);
	public WebSitePojo getByUserName(String uname);
	
	   public void insertuser(WebSitePojo user);
	   public void updateUser(WebSitePojo user);
	   public void deleteUser(WebSitePojo user);
}

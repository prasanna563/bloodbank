package com.full.dao;

import java.util.List;
import java.util.ArrayList;
import com.full.jdo.*;

public class BloodBankDAOImplementation implements BloodBankDAO {

	List<WebSitePojo> user = new ArrayList<WebSitePojo>() ;
	
	@Override
	public List<WebSitePojo> getAllUsers() {
		String result = "SELECT * FROM WebSitePojo";
		return null;
		
		
	}

	@Override
	public WebSitePojo getByMailId(String mail) {
		
		WebSitePojo user = new WebSitePojo();
		String user1 = "SELECT * FROM WebSitePojo WHERE mid ="+mail;
		return null;
	}

	@Override
	public WebSitePojo getByUserName(String uname) {
		
		return null;
	}

	@Override
	public void insertuser(WebSitePojo user) {
		
	}

	@Override
	public void updateUser(WebSitePojo user) {
		
	}

	@Override
	public void deleteUser(WebSitePojo user) {
		
	}

	


}

package com.full.bloodbank;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jdo.Query;

import com.full.bloodbank.PMF;

public class DonateBlood extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		
		String name1 = req.getParameter("userName");
		String gen = req.getParameter("gender");
		String bg = req.getParameter("bloodGroup");
		String pn = req.getParameter("phoneNumb");
		String date = req.getParameter("dates");
		String areas = req.getParameter("area");
		
		
		DonatePojo dp = new DonatePojo();
		dp.setName(name1);
		dp.setGender(gen);
		dp.setBgroup(bg);
		dp.setPnumber(pn);
		dp.setDate1(date);
		dp.setAreas(areas);
		
		PersistenceManager pm= PMF.get().getPersistenceManager();
		pm.makePersistent(dp);
		
		Query q = pm.newQuery(BloodGroupPojo.class," bgroup == '" + bg + "'");
		
		List<BloodGroupPojo> lst = (List<BloodGroupPojo>) q.execute();
		if(!lst.isEmpty()){
		 for(BloodGroupPojo bgp : lst){
			 int a=bgp.getCount();
			 a++;
			 bgp.setCount(a);
			pm.makePersistent(bgp);
		 }
		}
		else{
			BloodGroupPojo bp = new BloodGroupPojo();
			bp.setBgroup(bg);
			bp.setCount(1);
			pm.makePersistent(bp);
		}
		
		
		pw.write("Thank you "+" "+ name1 +" "+"for Donating Blood.");
		
	}
	
}

package com.full.bloodbank;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jdo.Query;

public class RequestBlood extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

	
		PrintWriter pw = res.getWriter();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String bgrp = req.getParameter("bg");
			String units = req.getParameter("units");
			int newUnits = Integer.parseInt(units);
			
			Query q = pm.newQuery(BloodGroupPojo.class, " bgroup == '" + bgrp + "'");

			List<BloodGroupPojo> lst = (List<BloodGroupPojo>) q.execute(bgrp);
			
			
			for (BloodGroupPojo dp : lst) {
				
				int oldCount = dp.getCount();
		
				System.out.println(oldCount);
				
				if (oldCount >= newUnits) {
					oldCount = oldCount - newUnits;
					dp.setCount(oldCount);
					pm.makePersistent(dp);
				}
			}
			pw.write("we received your request");
			
		} catch (Exception exec) {
			exec.printStackTrace();
		} finally {
			pw.close();
			pm.close();
		}

	}

}

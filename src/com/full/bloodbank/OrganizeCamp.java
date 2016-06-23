package com.full.bloodbank;

import javax.servlet.http.HttpServlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import javax.jdo.Query;

public class OrganizeCamp extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			
			Gson gson = new Gson();
			
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String email = req.getParameter("email");
			String date = req.getParameter("date");
			String venue = req.getParameter("venue");
			
			OrganizePojo op = new OrganizePojo();
			op.setFirstName(fname);
			op.setLastName(lname);
			op.setEmail(email);
			op.setDate1(date);
			op.setVenueDetails(venue);
			
			
			pm.makePersistent(op);
			System.out.println(gson.toJson(op));
		pw.write(fname+" "+lname);
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			pw.close();
			pm.close();
		}
	
		/*RequestDispatcher rd = req.getRequestDispatcher("organizeCamp.jsp");
		rd.include(req, res);*/
		
	}
}

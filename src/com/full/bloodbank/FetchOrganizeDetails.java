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

import com.google.gson.Gson;

import javax.jdo.Query;

public class FetchOrganizeDetails extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		res.setContentType("text/plain");
		PrintWriter pw = res.getWriter();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {

			String name = req.getParameter("resultName"); 
			
			String fname[] = name.split(" ");
			
			//System.out.println("firstname is :"+fname[0]);
			//System.out.println("last name is :"+fname[1]);
			/*String firstName = "";
			for(int i = 0; i<=fname.length -1; i++){
				firstName = fname[i];
				System.out.println(firstName);
			}*/
			Gson gson = new Gson();
			Query q = pm.newQuery(OrganizePojo.class); 
			
			q.setFilter(" firstName == '" + fname[0] + "' && lastName == '" + fname[fname.length-1] +"'");
			
			List<OrganizePojo> lst = (List<OrganizePojo>) q.execute();
			System.out.println("List values are:" + lst);
			if (!lst.isEmpty()) {
				for (OrganizePojo op : lst) {
					System.out.println("Response is:"+gson.toJson(op));
					String names = op.getFirstName();
					String lname = op.getLastName();
					String organizedDate = op.getDate1();
					String venue = op.getVenueDetails();
					pw.println(names+","+lname+","+organizedDate+","+venue+",");
					/*pw.println(name); 
					pw.println(organizedDate);*/
					System.out.println(names + " " + organizedDate);
					//pw.write(gson.toJson(op));
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pm.close();
			pw.close();
		}

	}
}

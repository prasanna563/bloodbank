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

public class SearchOrganizeDetails extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		res.setContentType("text/plain");
		PrintWriter pw = res.getWriter();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {

			String namedetails = req.getParameter("namedetails");
			
			System.out.println("name details is:"+namedetails);
			
			Gson gson = new Gson();
			
			Query q = pm.newQuery(OrganizePojo.class);

			List<OrganizePojo> lst = (List<OrganizePojo>) q.execute();

			if (!lst.isEmpty()) {
				for (OrganizePojo op : lst) {
					System.out.println("JSON format"+gson.toJson(op));
					String names = op.getFirstName();
					if(names.contains(namedetails)){
						
						pw.println(names +",");
					}
					
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

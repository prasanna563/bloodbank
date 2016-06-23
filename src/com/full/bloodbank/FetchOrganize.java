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

public class FetchOrganize extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
		res.setContentType("text/plain");
		PrintWriter pw = res.getWriter();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
		Query q = pm.newQuery(OrganizePojo.class);
		Gson gson = new Gson();
		List<OrganizePojo> lst = (List<OrganizePojo>) q.execute();
		System.out.println(gson.toJson(lst));
		if(!lst.isEmpty()){
			for(OrganizePojo op : lst){
				String name= op.getFirstName();
				String lname = op.getLastName();
				//pw.write(gson.toJson(lst));
			pw.println(name + " " + lname+",");
			System.out.println(name+" "+lname);
			}
			
		}
		
	}
		catch(Exception e){
			e.printStackTrace();
		}
		
		finally{
			pw.close();
			pm.close();
		}
		
	}
}

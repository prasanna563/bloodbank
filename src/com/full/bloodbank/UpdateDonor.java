package com.full.bloodbank;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jdo.Query;

public class UpdateDonor extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		
		ServletContext cons = getServletContext();
		String n = (String) cons.getAttribute("names");
		String bg = (String) cons.getAttribute("bloodgrp");
		String a = (String) cons.getAttribute("areas");
		String d = (String) cons.getAttribute("date");
		
		
		PersistenceManager pm= PMF.get().getPersistenceManager();
		
		
		
	}
	
}

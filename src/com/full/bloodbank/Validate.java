package com.full.bloodbank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.full.bloodbank.PMF;
import com.full.bloodbank.WebSitePojo;

public class Validate extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
   
		//String uname = req.getParameter("username");
		String mailid = req.getParameter("email");
		//String x = "Email Already Exists";
		
		PersistenceManager pm= PMF.get().getPersistenceManager();
		
		Query q = pm.newQuery(WebSitePojo.class,"mid == '"+mailid+"'"); 
		
        List<WebSitePojo> lst = (List<WebSitePojo>)q.execute(mailid);
   	 if(!lst.isEmpty()){
   		 //RequestDispatcher rd = req.getRequestDispatcher("homepage.jsp");
   		 //rd.forward(req,res);
   		// pw.println("Email Already Exist");
   		 res.getWriter().write("Email Already Exists");
   		 
   		 
   		 
   	 }
   	 
   	 else{
   		 pw.println("Good to go");
   		
   		 // RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
   		 //rd.include(req,res);
   	 }
		
	}

}
